import '../entities/entities.dart';

/// Avalia regras de alarme e mantém o ciclo de vida ISA-18.2:
///
/// ```text
///  normal ──(condição)──▶ ativo/não reconhecido ──(ack)──▶ ativo/reconhecido
///                                │                                │
///                           (normaliza)                      (normaliza)
///                                ▼                                ▼
///                 normalizado/não reconhecido ──(ack)──▶      removido
/// ```
///
/// Alarmes analógicos usam banda morta (1% da faixa) para não "piscar"
/// quando o valor oscila em cima do limite.
class AlarmTracker {
  final Map<String, Alarm> _alarms = {};

  /// Fração da faixa de engenharia usada como histerese.
  static const double deadbandFraction = 0.01;

  /// Alarmes atuais, ordenados por prioridade.
  List<Alarm> get alarms => _sorted();

  /// Reavalia todas as regras contra o estado ao vivo.
  ///
  /// Leituras sem qualidade boa não mudam o alarme: perder comunicação não
  /// deve "normalizar" um alarme (nem dispará-lo).
  List<Alarm> update(Plant plant, PlantLiveState live, DateTime now) {
    for (final equipment in plant.equipments) {
      for (final tag in equipment.tags) {
        final reading = live.reading(tag.id);
        if (reading == null || reading.quality != TagQuality.good) continue;

        for (var i = 0; i < tag.alarms.length; i++) {
          final rule = tag.alarms[i];
          final id = '${tag.id}:$i';
          final existing = _alarms[id];
          final active = isConditionActive(
            rule,
            reading.value,
            tag: tag,
            wasActive: existing?.active ?? false,
          );

          if (active) {
            _alarms[id] = _raiseOrRefresh(existing, id, equipment, tag, rule,
                reading.value, now);
          } else if (existing != null && existing.active) {
            final cleared = existing.copyWith(active: false, clearedAt: now);
            if (cleared.isResolved) {
              _alarms.remove(id);
            } else {
              _alarms[id] = cleared;
            }
          }
        }
      }
    }
    return _sorted();
  }

  /// Reconhece um alarme. Retorna `false` se ele não existir.
  bool acknowledge(String alarmId) {
    final alarm = _alarms[alarmId];
    if (alarm == null) return false;
    final acked = alarm.copyWith(acknowledged: true);
    if (acked.isResolved) {
      _alarms.remove(alarmId);
    } else {
      _alarms[alarmId] = acked;
    }
    return true;
  }

  /// Reconhece todos os alarmes pendentes.
  void acknowledgeAll() {
    for (final id in _alarms.keys.toList()) {
      acknowledge(id);
    }
  }

  /// Regra pura de disparo (com histerese para analógicos).
  static bool isConditionActive(
    AlarmRule rule,
    TagValue value, {
    required TagDefinition tag,
    required bool wasActive,
  }) {
    switch ((rule.condition, value)) {
      case (AlarmCondition.on, BooleanTagValue(:final value)):
        return value;
      case (AlarmCondition.off, BooleanTagValue(:final value)):
        return !value;
      case (AlarmCondition.above, NumberTagValue(:final value)):
        final limit = rule.limit;
        if (limit == null) return false;
        return wasActive ? value > limit - _deadband(tag) : value > limit;
      case (AlarmCondition.below, NumberTagValue(:final value)):
        final limit = rule.limit;
        if (limit == null) return false;
        return wasActive ? value < limit + _deadband(tag) : value < limit;
      default:
        return false; // regra incompatível com o tipo da tag
    }
  }

  static double _deadband(TagDefinition tag) {
    final min = tag.min;
    final max = tag.max;
    if (min == null || max == null || max <= min) return 0;
    return (max - min) * deadbandFraction;
  }

  Alarm _raiseOrRefresh(
    Alarm? existing,
    String id,
    Equipment equipment,
    TagDefinition tag,
    AlarmRule rule,
    TagValue value,
    DateTime now,
  ) {
    final numeric = value is NumberTagValue ? value.value : null;

    // Condição reapareceu depois de normalizar: é uma nova ocorrência.
    if (existing == null || !existing.active) {
      return Alarm(
        id: id,
        tagId: tag.id,
        tagName: tag.name,
        equipmentId: equipment.id,
        equipmentTag: equipment.tag,
        severity: rule.severity,
        message: rule.message,
        raisedAt: now,
        active: true,
        triggerValue: numeric,
        limit: rule.limit,
        unit: tag.unit,
        decimals: tag.decimals,
      );
    }
    // Mantém o pior valor da ocorrência (pico/vale), que é o que o
    // operador precisa saber depois que o alarme normaliza.
    final previous = existing.triggerValue;
    final worst = switch ((numeric, previous, rule.condition)) {
      (null, _, _) => previous,
      (final n?, null, _) => n,
      (final n?, final p?, AlarmCondition.below) => n < p ? n : p,
      (final n?, final p?, _) => n > p ? n : p,
    };
    return existing.copyWith(triggerValue: worst);
  }

  List<Alarm> _sorted() {
    final list = _alarms.values.toList()
      ..sort((a, b) {
        // 1) não reconhecidos primeiro, 2) ativos, 3) severidade, 4) recentes
        final ack = (a.acknowledged ? 1 : 0).compareTo(b.acknowledged ? 1 : 0);
        if (ack != 0) return ack;
        final active = (a.active ? 0 : 1).compareTo(b.active ? 0 : 1);
        if (active != 0) return active;
        final severity = a.severity.priority.compareTo(b.severity.priority);
        if (severity != 0) return severity;
        return b.raisedAt.compareTo(a.raisedAt);
      });
    return List.unmodifiable(list);
  }
}
