import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:modbus_supervisor/src/data/data.dart';
import 'package:modbus_supervisor/src/domain/domain.dart';

void main() {
  group('ModbusBlockModel', () {
    test('bloco de registradores', () {
      final model = ModbusBlockModel.fromJson({
        'table': 'holding',
        'slave': 1,
        'functionCode': 3,
        'startAddress': 1,
        'count': 2,
        'registers': [
          {'address': 1, 'value': 1800},
          {'address': 2, 'value': 350},
        ],
        'cached': true,
        'ageMs': 120,
      });
      final block = model.toEntity();
      expect(block.values, [1800, 350]);
      expect(block.valueAt(2), 350);
      expect(block.cached, isTrue);
    });

    test('bloco de bits', () {
      final block = ModbusBlockModel.fromJson({
        'table': 'coils',
        'slave': 1,
        'functionCode': 1,
        'startAddress': 0,
        'count': 3,
        'states': [true, false, true],
      }).toEntity();
      expect(block.values, [1, 0, 1]);
    });

    test('bit único (resposta de PUT)', () {
      final block = ModbusBlockModel.fromJson({
        'table': 'coils',
        'slave': 1,
        'functionCode': 5,
        'address': 7,
        'state': true,
      }).toEntity();
      expect(block.startAddress, 7);
      expect(block.values, [1]);
    });

    test('contrato quebrado lança FormatException', () {
      expect(
        () => ModbusBlockModel.fromJson({'table': 'holding', 'slave': 1}),
        throwsFormatException,
      );
      expect(
        () => ModbusBlockModel.fromJson({'table': 'nope'}),
        throwsFormatException,
      );
    });
  });

  test('HealthModel tolera blocos ausentes (firmware antigo)', () {
    final health = HealthModel.fromJson({
      'uptimeMs': 60000,
      'freeHeap': 150000,
      'modbusLinkUp': true,
    }).toEntity();
    expect(health.uptime, const Duration(minutes: 1));
    expect(health.stream.clients, 0);
    expect(health.successRate, isNull);
  });

  group('WsMessage', () {
    test('snapshot e update', () {
      final snapshot = WsMessage.tryParse(
        '{"type":"snapshot","id":"m","table":"holding","slave":1,'
        '"startAddress":1,"count":3,"values":[40,7,96],"ts":81234}',
      );
      expect(snapshot, isA<WsSnapshot>());
      expect((snapshot as WsSnapshot).values, [40, 7, 96]);

      final update = WsMessage.tryParse(
        '{"type":"update","id":"m","changes":[[3,53]],"ts":81434}',
      ) as WsUpdate;
      expect(update.changes.single, (address: 3, value: 53));
    });

    test('tipos desconhecidos e lixo são ignorados', () {
      expect(WsMessage.tryParse('{"type":"future"}'), isNull);
      expect(WsMessage.tryParse('not json'), isNull);
    });
  });

  group('PlantParser', () {
    test('o plant.yaml do app é válido', () {
      final source = File('assets/plant/plant.yaml').readAsStringSync();
      final plant = PlantParser.parse(source);

      expect(plant.equipments.map((e) => e.id), ['tq01', 'p101', 'xv101', 'qgbt01']);
      final energy = plant.allTags.firstWhere((t) => t.id == 'qg_energy');
      expect(energy.dataType, TagDataType.uint32);
      expect(energy.registerCount, 2);
      final reset = plant.allTags.firstWhere((t) => t.id == 'p101_reset');
      expect(reset.momentary, isTrue);
    });

    test('aponta o caminho exato do erro', () {
      const yaml = '''
plant:
  name: X
  equipments:
    - id: a
      tag: A
      name: A
      tags:
        - id: t1
          name: T1
          table: holdin
          address: 0
''';
      expect(
        () => PlantParser.parse(yaml),
        throwsA(isA<PlantConfigException>().having(
          (e) => e.path,
          'path',
          'equipments[0].tags[0].table',
        )),
      );
    });

    test('rejeita ids duplicados e alarme incompatível', () {
      const duplicated = '''
plant:
  name: X
  equipments:
    - {id: a, tag: A, name: A, tags: [{id: t, name: T, table: input, address: 0}]}
    - {id: b, tag: B, name: B, tags: [{id: t, name: T, table: input, address: 1}]}
''';
      expect(() => PlantParser.parse(duplicated), throwsA(isA<PlantConfigException>()));

      const wrongAlarm = '''
plant:
  name: X
  equipments:
    - id: a
      tag: A
      name: A
      tags:
        - id: t
          name: T
          table: discrete
          address: 0
          alarms: [{when: above, limit: 1, severity: high, message: M}]
''';
      expect(() => PlantParser.parse(wrongAlarm), throwsA(isA<PlantConfigException>()));
    });
  });

  test('SubscriptionPlanner agrupa o mapa padrão em 4 assinaturas', () {
    final plant = PlantParser.parse(
      File('assets/plant/plant.yaml').readAsStringSync(),
    );
    final plans = SubscriptionPlanner.plan(plant.allTags);

    expect(plans, hasLength(4));
    final input = plans.firstWhere((p) => p.table == ModbusTable.input);
    expect(input.start, 0);
    expect(input.count, 9); // 0..8, energia uint32 ocupa 6 e 7
  });
}
