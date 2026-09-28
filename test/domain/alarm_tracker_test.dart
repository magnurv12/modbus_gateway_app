import 'package:flutter_test/flutter_test.dart';
import 'package:modbus_supervisor/src/domain/domain.dart';

void main() {
  const level = TagDefinition(
    id: 'level',
    name: 'Nível',
    table: ModbusTable.input,
    address: 0,
    min: 0,
    max: 100,
    unit: '%',
    alarms: [
      AlarmRule(
        condition: AlarmCondition.above,
        limit: 90,
        severity: AlarmSeverity.high,
        message: 'Nível alto',
      ),
    ],
  );
  const estop = TagDefinition(
    id: 'estop',
    name: 'Emergência',
    table: ModbusTable.discrete,
    address: 0,
    dataType: TagDataType.boolean,
    alarms: [
      AlarmRule(
        condition: AlarmCondition.on,
        severity: AlarmSeverity.critical,
        message: 'Emergência',
      ),
    ],
  );
  const plant = Plant(
    name: 'P',
    site: 'S',
    equipments: [
      Equipment(
        id: 'tq',
        tag: 'TQ-01',
        name: 'Tanque',
        type: EquipmentType.tank,
        tags: [level, estop],
      ),
    ],
  );

  final t0 = DateTime(2026, 9, 28, 10);

  PlantLiveState live({
    double? levelValue,
    bool? estopValue,
    TagQuality quality = TagQuality.good,
  }) {
    return PlantLiveState(
      status: LiveConnectionStatus.online,
      readings: {
        if (levelValue != null)
          'level': TagReading(
            tagId: 'level',
            value: TagValue.number(levelValue),
            updatedAt: t0,
            quality: quality,
          ),
        if (estopValue != null)
          'estop': TagReading(
            tagId: 'estop',
            value: TagValue.boolean(estopValue),
            updatedAt: t0,
            quality: quality,
          ),
      },
    );
  }

  test('dispara alarme analógico acima do limite', () {
    final tracker = AlarmTracker();
    final alarms = tracker.update(plant, live(levelValue: 92), t0);
    expect(alarms, hasLength(1));
    expect(alarms.single.active, isTrue);
    expect(alarms.single.acknowledged, isFalse);
    expect(alarms.single.triggerValue, 92);
    expect(alarms.single.equipmentTag, 'TQ-01');
  });

  test('histerese: não normaliza dentro da banda morta', () {
    final tracker = AlarmTracker()..update(plant, live(levelValue: 92), t0);
    // banda = 1% de 0..100 → normaliza apenas abaixo de 89
    expect(
      tracker.update(plant, live(levelValue: 89.5), t0).single.active,
      isTrue,
    );
    expect(
      tracker.update(plant, live(levelValue: 88.5), t0).single.active,
      isFalse,
    );
  });

  test('normalizado sem reconhecimento permanece na lista (ISA-18.2)', () {
    final tracker = AlarmTracker()
      ..update(plant, live(levelValue: 95), t0)
      ..update(plant, live(levelValue: 50), t0);
    final alarm = tracker.alarms.single;
    expect(alarm.active, isFalse);
    expect(alarm.acknowledged, isFalse);
    expect(alarm.clearedAt, t0);

    tracker.acknowledge(alarm.id);
    expect(tracker.alarms, isEmpty);
  });

  test('reconhecido e ainda ativo continua até normalizar', () {
    final tracker = AlarmTracker()..update(plant, live(levelValue: 95), t0);
    tracker.acknowledge(tracker.alarms.single.id);
    expect(tracker.alarms.single.acknowledged, isTrue);

    tracker.update(plant, live(levelValue: 50), t0);
    expect(tracker.alarms, isEmpty);
  });

  test('guarda o pico da ocorrência mesmo depois de normalizar', () {
    final tracker = AlarmTracker()
      ..update(plant, live(levelValue: 91), t0)
      ..update(plant, live(levelValue: 97), t0)
      ..update(plant, live(levelValue: 93), t0)
      ..update(plant, live(levelValue: 50), t0);
    expect(tracker.alarms.single.active, isFalse);
    expect(tracker.alarms.single.triggerValue, 97);
  });

  test('leitura sem qualidade boa não altera alarmes', () {
    final tracker = AlarmTracker()..update(plant, live(levelValue: 95), t0);
    final alarms = tracker.update(
      plant,
      live(levelValue: 10, quality: TagQuality.stale),
      t0,
    );
    expect(alarms.single.active, isTrue);
  });

  test('ordena crítico antes de alto e não reconhecidos primeiro', () {
    final tracker = AlarmTracker();
    final alarms = tracker.update(
      plant,
      live(levelValue: 95, estopValue: true),
      t0,
    );
    expect(alarms.map((a) => a.severity), [
      AlarmSeverity.critical,
      AlarmSeverity.high,
    ]);

    tracker.acknowledge(alarms.first.id);
    expect(tracker.alarms.first.severity, AlarmSeverity.high);
  });
}
