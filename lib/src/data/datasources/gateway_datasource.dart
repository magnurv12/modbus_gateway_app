import 'dart:math' as math;

import '../../core/network/api_client.dart';
import '../../domain/domain.dart';
import '../models/models.dart';
import '../simulator/plant_simulator.dart';

/// Contrato de acesso REST ao gateway.
///
/// Lança exceções de rede/API (`core/network`); quem traduz para `Failure`
/// é o repositório.
abstract class IGatewayDataSource {
  /// `GET /api/health`.
  Future<HealthModel> getHealth();

  /// `GET /api/<table>?start=&count=&slave=`.
  Future<ModbusBlockModel> read(
    ModbusTable table,
    int start,
    int count, {
    int? slave,
  });

  /// `PUT /api/<table>/<address>` (um valor) ou `PUT /api/<table>` (bloco).
  Future<ModbusBlockModel> write(
    ModbusTable table,
    int start,
    List<int> values, {
    int? slave,
  });
}

/// Implementação HTTP real.
class RemoteGatewayDataSource implements IGatewayDataSource {
  final ApiClient _api;

  /// Cria um [RemoteGatewayDataSource].
  RemoteGatewayDataSource(this._api);

  @override
  Future<HealthModel> getHealth() async {
    final json = await _api.get('/api/health');
    return HealthModel.fromJson(json);
  }

  @override
  Future<ModbusBlockModel> read(
    ModbusTable table,
    int start,
    int count, {
    int? slave,
  }) async {
    final json = await _api.get(
      '/api/${table.path}',
      query: {
        'start': '$start',
        'count': '$count',
        if (slave != null) 'slave': '$slave',
      },
    );
    return ModbusBlockModel.fromJson(json);
  }

  @override
  Future<ModbusBlockModel> write(
    ModbusTable table,
    int start,
    List<int> values, {
    int? slave,
  }) async {
    final query = {if (slave != null) 'slave': '$slave'};

    // Um único valor vai por FC 05/06: muitos escravos baratos (inversores,
    // medidores) não implementam FC 15/16.
    if (values.length == 1) {
      final body = table.isBit
          ? {'state': values.single != 0}
          : {'value': values.single};
      final json = await _api.put(
        '/api/${table.path}/$start',
        body,
        query: query,
      );
      return ModbusBlockModel.fromJson(json);
    }

    final body = table.isBit
        ? {'startAddress': start, 'states': [for (final v in values) v != 0]}
        : {'startAddress': start, 'values': values};
    final json = await _api.put('/api/${table.path}', body, query: query);
    return ModbusBlockModel.fromJson(json);
  }
}

/// Implementação sobre o [PlantSimulator] — mesmo contrato, sem rede.
class SimulatedGatewayDataSource implements IGatewayDataSource {
  final PlantSimulator _simulator;
  final math.Random _random = math.Random();

  /// Cria um [SimulatedGatewayDataSource].
  SimulatedGatewayDataSource(this._simulator);

  /// Latência típica de uma transação a 9600 baud (~50 ms).
  Future<void> _busLatency() => Future.delayed(
        Duration(milliseconds: 40 + _random.nextInt(40)),
      );

  @override
  Future<HealthModel> getHealth() async {
    await _busLatency();
    return HealthModel(
      uptimeMs: _simulator.uptime.inMilliseconds,
      freeHeap: 180000 + _random.nextInt(8000),
      resetReason: 'power_on',
      modbusLinkUp: true,
      wifi: WifiModel(
        ssid: 'Planta-EB01',
        rssi: -58 - _random.nextInt(8),
        ip: '192.168.0.42',
        hostname: 'modbus-gateway',
        mac: '24:6F:28:AA:10:42',
        channel: 6,
      ),
      firmware: const FirmwareModel(
        version: 'simulador',
        buildTime: '2026-09-28T00:00:00Z',
        arduinoCore: '3.0.7',
        idf: 'v5.1.4',
        chip: 'ESP32-D0WD-V3',
      ),
      modbus: ModbusStatsModel(
        okCount: _simulator.okCount,
        errorCount: _simulator.errorCount,
        lastResult: 'Success',
        lastSlave: 1,
        lastAttemptAt: _simulator.uptime.inMilliseconds,
        lastSuccessAt: _simulator.uptime.inMilliseconds,
        config: const ModbusConfigModel(responseTimeoutMs: 400),
      ),
      stream: StreamStatsModel(
        clients: 1,
        subscriptions: 4,
        pollBlocks: 4,
        busLoadPct: 18 + _random.nextDouble() * 6,
      ),
    );
  }

  @override
  Future<ModbusBlockModel> read(
    ModbusTable table,
    int start,
    int count, {
    int? slave,
  }) async {
    await _busLatency();
    return ModbusBlockModel(
      table: table,
      slave: slave ?? 1,
      functionCode: table.readFunction,
      startAddress: start,
      values: _simulator.read(table, start, count),
    );
  }

  @override
  Future<ModbusBlockModel> write(
    ModbusTable table,
    int start,
    List<int> values, {
    int? slave,
  }) async {
    await _busLatency();
    _simulator.write(table, start, values);
    final single = values.length == 1;
    return ModbusBlockModel(
      table: table,
      slave: slave ?? 1,
      functionCode: switch ((table.isBit, single)) {
        (true, true) => 5,
        (false, true) => 6,
        (true, false) => 15,
        (false, false) => 16,
      },
      startAddress: start,
      values: values,
    );
  }
}
