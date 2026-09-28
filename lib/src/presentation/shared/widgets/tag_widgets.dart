import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../design_system/design_system.dart';
import '../formatters.dart';
import '../presenters.dart';

/// Valor de uma tag com unidade, qualidade e cor de alarme.
class TagValueText extends StatelessWidget {
  /// Definição da tag.
  final TagDefinition tag;

  /// Leitura atual.
  final TagReading? reading;

  /// Tamanho.
  final DsValueSize size;

  /// Severidade do alarme ativo nesta tag (pinta o valor).
  final AlarmSeverity? alarm;

  /// Cria um [TagValueText].
  const TagValueText({
    super.key,
    required this.tag,
    required this.reading,
    this.size = DsValueSize.medium,
    this.alarm,
  });

  @override
  Widget build(BuildContext context) {
    return DsValueText(
      value: Formatters.tagValue(tag, reading?.value),
      unit: tag.isBoolean ? '' : tag.unit,
      size: size,
      quality: reading.dsQuality,
      color: alarm?.tone.color(context.colors),
    );
  }
}

/// Item de alarme (lista de alarmes e seção de alarmes do equipamento).
class AlarmTile extends StatelessWidget {
  /// Alarme.
  final Alarm alarm;

  /// Reconhecer (omitido se já reconhecido).
  final VoidCallback? onAcknowledge;

  /// Toque no item (ex.: abrir equipamento).
  final VoidCallback? onTap;

  /// Cria um [AlarmTile].
  const AlarmTile({
    super.key,
    required this.alarm,
    this.onAcknowledge,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final s = context.spacing;
    final color = alarm.severity.tone.color(c);
    final muted = !alarm.active;

    final value = alarm.triggerValue;
    final limit = alarm.limit;
    final detail = [
      if (value != null)
        '${_extremeLabel(alarm)} ${Formatters.withUnit(value, alarm.unit, decimals: alarm.decimals)}',
      if (limit != null)
        'limite ${Formatters.withUnit(limit, alarm.unit, decimals: alarm.decimals)}',
    ].join(' · ');

    return DsCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      accentColor: alarm.acknowledged ? null : color.withValues(alpha: 0.7),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: muted ? c.border : color,
                borderRadius: BorderRadius.horizontal(
                  left: context.radius.lg.topLeft,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(s.md, s.md, s.xs, s.md),
                child: Row(
                  children: [
                    Icon(
                      alarm.severity.icon,
                      color: muted ? c.textMuted : color,
                      size: 26,
                    ),
                    SizedBox(width: s.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(alarm.equipmentTag, style: context.ds.overline),
                              SizedBox(width: s.sm),
                              DsBadge(
                                label: alarm.active ? 'ATIVO' : 'NORMALIZADO',
                                tone: alarm.active
                                    ? alarm.severity.tone
                                    : DsTone.neutral,
                                filled: alarm.active && !alarm.acknowledged,
                              ),
                            ],
                          ),
                          SizedBox(height: s.xs),
                          Text(
                            alarm.message,
                            style: context.text.titleSmall?.copyWith(
                              color: muted ? c.textSecondary : c.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: s.xxs),
                          Text(
                            [
                              Formatters.time(alarm.raisedAt),
                              if (detail.isNotEmpty) detail,
                              if (alarm.acknowledged) 'reconhecido',
                            ].join(' · '),
                            style: context.text.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    if (onAcknowledge != null && !alarm.acknowledged)
                      IconButton(
                        tooltip: 'Reconhecer',
                        onPressed: onAcknowledge,
                        icon: const Icon(Icons.done_all_rounded),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// "pico" para alarmes de máxima, "vale" para mínima.
String _extremeLabel(Alarm alarm) {
  final limit = alarm.limit;
  final value = alarm.triggerValue;
  if (limit == null || value == null) return 'valor';
  return value >= limit ? 'pico' : 'vale';
}
