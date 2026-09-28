import 'dart:math' as math;

import '../../core/network/network_exceptions.dart';
import '../../domain/domain.dart';

/// Escravo Modbus simulado com a física da estação de bombeamento do
/// `assets/plant/plant.yaml` padrão.
///
/// Permite demonstrar o app sem hardware (`USE_SIMULATOR: true`) e roda a
/// mesma lógica que um CLP real rodaria:
///
/// * o reservatório enche por gravidade e a P-101 o esvazia pela XV-101;
/// * em automático, liga a bomba no nível máximo e desliga no mínimo;
/// * bomba contra válvula fechada ("shut-off") aquece o motor até desarmar;
/// * funcionamento a seco (LSL atuada) também desarma o inversor.
///
/// Não usa timers: o estado avança pelo tempo decorrido a cada acesso.
class PlantSimulator {
  final Stopwatch _clock = Stopwatch()..start();
  final math.Random _random;
  Duration _lastTick = Duration.zero;

  /// Tamanho de cada tabela simulada; acima disso responde endereço ilegal.
  static const int tableSize = 32;

  final List<int> _holding = List.filled(tableSize, 0);
  final List<int> _input = List.filled(tableSize, 0);
  final List<bool> _coils = List.filled(tableSize, false);
  final List<bool> _discrete = List.filled(tableSize, false);

  // Estado físico em unidade de engenharia.
  double _level = 55; // %
  double _freq = 0; // Hz
  double _temp = 32; // °C
  double _energyKwh = 123456.7; // > 65535 de propósito: exercita uint32

  /// Transações atendidas / com erro (alimentam o health simulado).
  int okCount = 0;

  /// Transações com erro.
  int errorCount = 0;

  /// Cria um [PlantSimulator]. [seed] torna o ruído reproduzível em testes.
  PlantSimulator({int? seed}) : _random = math.Random(seed) {
    _holding[0] = 450; // setpoint de frequência: 45,0 Hz
    _holding[1] = 850; // nível máximo (liga em auto): 85,0 %
    _holding[2] = 250; // nível mínimo (desliga em auto): 25,0 %
    _holding[3] = 5; // rampa: 5 s
    _coils[1] = true; // válvula aberta
    _coils[2] = true; // modo automático
    _tick();
  }

  /// Tempo desde a criação (usado como uptime).
  Duration get uptime => _clock.elapsed;

  /// Lê [count] valores (bits como 0/1).
  List<int> read(ModbusTable table, int start, int count) {
    _checkRange(table, start, count);
    _tick();
    okCount++;
    return switch (table) {
      ModbusTable.holding => _holding.sublist(start, start + count),
      ModbusTable.input => _input.sublist(start, start + count),
      ModbusTable.coils => [
        for (final b in _coils.sublist(start, start + count)) b ? 1 : 0,
      ],
      ModbusTable.discrete => [
        for (final b in _discrete.sublist(start, start + count)) b ? 1 : 0,
      ],
    };
  }

  /// Escreve [values] a partir de [start].
  void write(ModbusTable table, int start, List<int> values) {
    if (!table.isWritable) {
      errorCount++;
      throw const ApiException(405, {
        'error': 'read_only',
        'message': 'This table cannot be written over Modbus',
      });
    }
    _checkRange(table, start, values.length);
    _tick();
    for (var i = 0; i < values.length; i++) {
      if (table == ModbusTable.holding) {
        _holding[start + i] = values[i] & 0xFFFF;
      } else {
        _coils[start + i] = values[i] != 0;
      }
    }
    okCount++;
    _tick();
  }

  void _checkRange(ModbusTable table, int start, int count) {
    if (start < 0 || start + count > tableSize) {
      errorCount++;
      // Mesmo formato que o gateway devolve para exceção 02 do escravo.
      throw ApiException(404, {
        'error': 'illegal_address',
        'message': 'The Modbus slave rejected the address range',
        'table': table.path,
        'slave': 1,
        'functionCode': table.readFunction,
        'address': start,
        'count': count,
        'modbusCode': 2,
        'modbusError': 'IllegalDataAddress',
      });
    }
  }

  // ---------------------------------------------------------------------------
  // Física
  // ---------------------------------------------------------------------------

  static const double _tankM3 = 3; // pequeno para ciclos rápidos na demo
  static const double _pumpNominalM3h = 90; // a 60 Hz

  void _tick() {
    final now = _clock.elapsed;
    var dt = (now - _lastTick).inMicroseconds / 1e6;
    _lastTick = now;
    // Integra em passos pequenos para ficar estável após longas pausas.
    while (dt > 0) {
      final step = math.min(dt, 0.2);
      _step(step, now.inMilliseconds / 1000);
      dt -= step;
    }
    _publish();
  }

  void _step(double dt, double t) {
    final spFreq = _holding[0] / 10;
    final spMax = _holding[1] / 10;
    final spMin = _holding[2] / 10;
    final rampS = math.max(1, _holding[3]).toDouble();

    // Lógica de CLP: modo automático e reset.
    if (_coils[2]) {
      if (_level >= spMax) _coils[0] = true;
      if (_level <= spMin) _coils[0] = false;
    }
    if (_coils[3]) _discrete[1] = false;

    final estop = _discrete[5];
    final canRun = _coils[0] && !_discrete[1] && !estop;
    final target = canRun ? spFreq.clamp(0, 60).toDouble() : 0.0;
    final rate = 60 / rampS * dt;
    _freq += (target - _freq).clamp(-rate, rate);

    final valveOpen = _coils[1];
    final ratio = _freq / 60;
    final inflow = 40 + 8 * math.sin(t / 30);
    final pumpFlow = valveOpen ? _pumpNominalM3h * ratio : 0.0;
    _level += (inflow - pumpFlow) / 3600 * dt / _tankM3 * 100;
    _level = _level.clamp(0, 100).toDouble();

    final running = _freq > 0.5;
    final deadHead = running && !valveOpen;
    final current = running
        ? 8 + 22 * ratio * ratio * (valveOpen ? 1 : 0.8)
        : 0.0;
    final targetTemp = 30 + current * 1.4 + (deadHead ? 45 : 0);
    _temp += (targetTemp - _temp) * (1 - math.exp(-dt / 12));

    final powerKw = current * 0.56;
    _energyKwh += powerKw * dt / 3600;

    // Proteções que desarmam o inversor.
    if (_temp > 95 || (running && _level < 3)) _discrete[1] = true;

    _discrete[0] = running;
    _discrete[2] = _level > 95;
    _discrete[3] = _level < 3;

    final pressure = running ? (valveOpen ? 6.0 : 8.6) * ratio * ratio : 0.1;
    _input[0] = _raw(_level, 10);
    _input[1] = _raw(pressure + _noise(0.03), 100);
    _input[2] = _raw(pumpFlow + (running ? _noise(0.4) : 0), 10);
    _input[3] = _raw(_temp + _noise(0.1), 10);
    _input[4] = _raw(current + (running ? _noise(0.15) : 0), 10);
    _input[5] = _raw(_freq, 10);
    _input[8] = _raw(powerKw, 10);
  }

  void _publish() {
    final energy = (_energyKwh * 10).round();
    _input[6] = energy ~/ 0x10000; // palavra alta primeiro (wordOrder: big)
    _input[7] = energy % 0x10000;
  }

  double _noise(double amplitude) => (_random.nextDouble() * 2 - 1) * amplitude;

  static int _raw(double value, double factor) =>
      (value * factor).round().clamp(0, 0xFFFF);
}
