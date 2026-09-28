import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modbus_supervisor/src/data/data.dart';
import 'package:modbus_supervisor/src/domain/domain.dart';

/// Datasource controlável: o teste decide o que o "gateway" envia.
class _FakeLiveSource implements ILiveStreamDataSource {
  StreamController<WsMessage>? controller;
  final List<LiveSubscription> subscriptions = [];
  int connections = 0;

  @override
  Stream<WsMessage> connect() {
    connections++;
    controller = StreamController<WsMessage>();
    return controller!.stream;
  }

  @override
  void subscribe(LiveSubscription subscription) =>
      subscriptions.add(subscription);

  void send(WsMessage message) => controller!.add(message);
}

void main() {
  const level = TagDefinition(
    id: 'level',
    name: 'Nível',
    table: ModbusTable.input,
    address: 0,
    scale: 0.1,
  );
  const pump = TagDefinition(
    id: 'pump',
    name: 'Bomba',
    table: ModbusTable.coils,
    address: 0,
    dataType: TagDataType.boolean,
  );
  const plant = Plant(
    name: 'P',
    site: 'S',
    equipments: [
      Equipment(
        id: 'e',
        tag: 'E',
        name: 'E',
        type: EquipmentType.generic,
        tags: [level, pump],
      ),
    ],
  );

  test('hello → assina; snapshot/update → decodifica; queda → stale + backoff',
      () {
    fakeAsync((async) {
      final source = _FakeLiveSource();
      final repository = LiveDataRepositoryImpl(
        source,
        const TagCodec(),
        interval: const Duration(milliseconds: 500),
      );
      final states = <PlantLiveState>[];
      repository.watch(plant).listen(states.add);
      async.flushMicrotasks();

      expect(repository.current.status, LiveConnectionStatus.connecting);

      source.send(const WsHello());
      async.flushMicrotasks();
      expect(repository.current.status, LiveConnectionStatus.online);
      expect(source.subscriptions.map((s) => s.table),
          containsAll([ModbusTable.input, ModbusTable.coils]));
      final inputId =
          source.subscriptions.firstWhere((s) => s.table == ModbusTable.input).id;
      final coilId =
          source.subscriptions.firstWhere((s) => s.table == ModbusTable.coils).id;

      source
        ..send(WsSnapshot(id: inputId, startAddress: 0, values: const [724]))
        ..send(WsSnapshot(id: coilId, startAddress: 0, values: const [0]));
      async.flushMicrotasks();
      expect(repository.current.numberOf('level'), closeTo(72.4, 1e-9));
      expect(repository.current.boolOf('pump'), isFalse);

      source.send(WsUpdate(id: coilId, changes: const [(address: 0, value: 1)]));
      async.flushMicrotasks();
      expect(repository.current.boolOf('pump'), isTrue);

      // Tendência amostrada a cada 1 s.
      async.elapse(const Duration(seconds: 3));
      expect(repository.current.trend('level'), hasLength(3));

      // Erro de polling marca só as tags da faixa como "bad".
      source.send(WsError(id: inputId, raw: const {
        'error': 'slave_timeout',
        'modbusCode': 226,
      }));
      async.flushMicrotasks();
      expect(repository.current.reading('level')!.quality, TagQuality.bad);
      expect(repository.current.reading('pump')!.quality, TagQuality.good);

      // Queda da conexão: valores congelados e reconexão agendada.
      unawaited(source.controller!.close());
      async.flushMicrotasks();
      expect(repository.current.status, LiveConnectionStatus.reconnecting);
      expect(repository.current.reading('pump')!.quality, TagQuality.stale);
      expect(repository.current.connectionFailure,
          isA<GatewayUnreachableFailure>());

      async.elapse(LiveDataRepositoryImpl.backoff.first);
      expect(source.connections, 2);

      unawaited(repository.dispose());
      async.flushMicrotasks();
    });
  });

  test('pausar libera a conexão e retomar reconecta', () {
    fakeAsync((async) {
      final source = _FakeLiveSource();
      final repository = LiveDataRepositoryImpl(
        source,
        const TagCodec(),
        interval: const Duration(milliseconds: 500),
      );
      repository.watch(plant).listen((_) {});
      async.flushMicrotasks();
      source.send(const WsHello());
      async.flushMicrotasks();

      repository.setActive(false);
      async.flushMicrotasks();
      expect(repository.current.status, LiveConnectionStatus.paused);
      expect(source.controller!.hasListener, isFalse);

      repository.setActive(true);
      async.flushMicrotasks();
      expect(source.connections, 2);

      unawaited(repository.dispose());
      async.flushMicrotasks();
    });
  });
}
