import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/domain.dart';
import '../models/models.dart';
import '../simulator/plant_simulator.dart';

/// Pedido de assinatura de uma faixa de endereços (`op: subscribe`).
class LiveSubscription {
  /// Id único na conexão (1–32 caracteres).
  final String id;

  /// Tabela.
  final ModbusTable table;

  /// Escravo (`null` = padrão do gateway).
  final int? slave;

  /// Primeiro endereço.
  final int start;

  /// Quantidade de endereços.
  final int count;

  /// Intervalo de polling.
  final Duration interval;

  /// Cria uma [LiveSubscription].
  const LiveSubscription({
    required this.id,
    required this.table,
    required this.slave,
    required this.start,
    required this.count,
    required this.interval,
  });

  /// Mensagem JSON do protocolo.
  Map<String, Object> toJson() => {
        'op': 'subscribe',
        'id': id,
        'table': table.path,
        'start': start,
        'count': count,
        'intervalMs': interval.inMilliseconds,
        'slave': ?slave,
      };
}

/// Conexão de streaming com o gateway.
abstract class ILiveStreamDataSource {
  /// Abre uma conexão. A stream termina (`done`) ou falha (`error`) quando
  /// a conexão cai; cancelar a assinatura fecha a conexão.
  Stream<WsMessage> connect();

  /// Envia uma assinatura na conexão aberta.
  void subscribe(LiveSubscription subscription);
}

/// Implementação WebSocket real (`ws://<gateway>/ws`).
class RemoteLiveStreamDataSource implements ILiveStreamDataSource {
  final Uri _url;
  final Duration _connectTimeout;
  WebSocketChannel? _channel;

  /// Cria um [RemoteLiveStreamDataSource].
  RemoteLiveStreamDataSource(this._url, {required Duration connectTimeout})
      : _connectTimeout = connectTimeout;

  @override
  Stream<WsMessage> connect() {
    late final StreamController<WsMessage> controller;
    WebSocketChannel? channel;
    StreamSubscription<dynamic>? socket;

    controller = StreamController<WsMessage>(
      onListen: () async {
        try {
          channel = WebSocketChannel.connect(_url);
          await channel!.ready.timeout(_connectTimeout);
        } catch (error, stack) {
          if (!controller.isClosed) {
            controller.addError(error, stack);
            await controller.close();
          }
          return;
        }
        _channel = channel;
        socket = channel!.stream.listen(
          (frame) {
            final message = WsMessage.tryParse(frame);
            if (message != null) controller.add(message);
          },
          onError: controller.addError,
          onDone: controller.close,
        );
      },
      // Não pode aguardar o fechamento do socket: com `cancelOnError`, o
      // Dart só entrega o erro ao assinante depois que a Future do
      // `onCancel` completa — e `sink.close()` de um socket que nunca abriu
      // não completa, o que prenderia o erro (e a reconexão) para sempre.
      onCancel: () {
        if (identical(_channel, channel)) _channel = null;
        unawaited(socket?.cancel());
        unawaited(
          channel?.sink
              .close()
              .timeout(const Duration(seconds: 2), onTimeout: () {})
              .catchError((Object _) {}),
        );
      },
    );
    return controller.stream;
  }

  @override
  void subscribe(LiveSubscription subscription) {
    _channel?.sink.add(jsonEncode(subscription.toJson()));
  }
}

/// Implementação sobre o [PlantSimulator] que imita o protocolo do firmware:
/// `hello` → `subscribed` → `snapshot` → `update` (só o que mudou).
class SimulatedLiveStreamDataSource implements ILiveStreamDataSource {
  final PlantSimulator _simulator;
  StreamController<WsMessage>? _controller;
  final Map<String, Timer> _timers = {};

  /// Cria um [SimulatedLiveStreamDataSource].
  SimulatedLiveStreamDataSource(this._simulator);

  @override
  Stream<WsMessage> connect() {
    final controller = StreamController<WsMessage>();
    controller.onListen = () {
      Timer(const Duration(milliseconds: 250), () {
        if (!controller.isClosed) controller.add(const WsHello(clientId: 1));
      });
    };
    controller.onCancel = _stopAll;
    _controller = controller;
    return controller.stream;
  }

  @override
  void subscribe(LiveSubscription s) {
    final controller = _controller;
    if (controller == null || controller.isClosed) return;

    _timers.remove(s.id)?.cancel();
    controller.add(WsSubscribed(
      id: s.id,
      effectiveIntervalMs: s.interval.inMilliseconds,
    ));

    List<int>? last;
    void poll() {
      if (controller.isClosed) return;
      final List<int> values;
      try {
        values = _simulator.read(s.table, s.start, s.count);
      } catch (_) {
        controller.add(WsError(id: s.id, raw: {
          'type': 'error',
          'id': s.id,
          'error': 'illegal_address',
          'message': 'Faixa fora do mapa do escravo simulado',
          'modbusCode': 2,
          'modbusError': 'IllegalDataAddress',
        }));
        return;
      }
      final previous = last;
      last = values;
      if (previous == null) {
        controller.add(WsSnapshot(
          id: s.id,
          startAddress: s.start,
          values: values,
        ));
        return;
      }
      final changes = [
        for (var i = 0; i < values.length; i++)
          if (values[i] != previous[i])
            (address: s.start + i, value: values[i]),
      ];
      if (changes.isNotEmpty) {
        controller.add(WsUpdate(id: s.id, changes: changes));
      }
    }

    poll();
    _timers[s.id] = Timer.periodic(s.interval, (_) => poll());
  }

  void _stopAll() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    _controller = null;
  }
}
