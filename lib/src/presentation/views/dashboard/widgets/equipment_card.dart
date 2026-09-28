import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';
import '../../../design_system/design_system.dart';
import '../../../shared/shared.dart';
import '../dashboard_state.dart';

/// Card de equipamento no painel da planta.
class EquipmentCard extends StatelessWidget {
  /// Resumo do equipamento.
  final EquipmentSummary summary;

  /// Estado ao vivo.
  final PlantLiveState live;

  /// Toque no card.
  final VoidCallback onTap;

  /// Cria um [EquipmentCard].
  const EquipmentCard({
    super.key,
    required this.summary,
    required this.live,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    final equipment = summary.equipment;
    final alarmColor = summary.worstAlarm?.tone.color(context.colors);
    final primary = equipment.primaryTags;

    return DsCard(
      onTap: onTap,
      accentColor: alarmColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(summary: summary),
          SizedBox(height: s.lg),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (equipment.type == EquipmentType.tank &&
                  primary.isNotEmpty) ...[
                _MiniTank(tag: primary.first, live: live, alarm: alarmColor),
                SizedBox(width: s.lg),
              ],
              Expanded(
                child: Wrap(
                  spacing: s.xl,
                  runSpacing: s.lg,
                  children: [
                    for (final tag in primary)
                      _PrimaryValue(
                        tag: tag,
                        live: live,
                        width: primary.length == 1 ? double.infinity : 136,
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (summary.stateTag != null) ...[
            SizedBox(height: s.lg),
            const Divider(),
            SizedBox(height: s.md),
            _StateFooter(tag: summary.stateTag!, live: live),
          ],
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final EquipmentSummary summary;

  const _Header({required this.summary});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final s = context.spacing;
    final equipment = summary.equipment;

    final badge = switch (summary.condition) {
      EquipmentCondition.alarm => DsBadge(
        label: summary.pendingAlarms == 1
            ? '1 alarme'
            : '${summary.pendingAlarms} alarmes',
        tone: summary.worstAlarm!.tone,
        icon: summary.worstAlarm!.icon,
        filled: summary.worstAlarm == AlarmSeverity.critical,
      ),
      EquipmentCondition.communication => const DsBadge(
        label: 'Sem comunicação',
        tone: DsTone.badQuality,
        icon: Icons.link_off_rounded,
      ),
      EquipmentCondition.waiting => const DsBadge(
        label: 'Aguardando',
        icon: Icons.hourglass_empty_rounded,
      ),
      EquipmentCondition.normal => const DsBadge(
        label: 'Normal',
        icon: Icons.check_rounded,
      ),
    };

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(s.sm),
          decoration: BoxDecoration(
            color: c.surfaceSunken,
            borderRadius: context.radius.md,
          ),
          child: Icon(equipment.type.icon, color: c.textSecondary, size: 22),
        ),
        SizedBox(width: s.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(equipment.tag, style: context.ds.overline),
              Text(
                equipment.name,
                style: context.text.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        badge,
        SizedBox(width: s.xs),
        Icon(Icons.chevron_right_rounded, color: c.textMuted),
      ],
    );
  }
}

class _PrimaryValue extends StatelessWidget {
  final TagDefinition tag;
  final PlantLiveState live;
  final double width;

  const _PrimaryValue({
    required this.tag,
    required this.live,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final trend = live.trend(tag.id);
    return SizedBox(
      width: width,
      child: DsKpiTile(
        label: tag.name,
        value: TagValueText(
          tag: tag,
          reading: live.reading(tag.id),
          size: DsValueSize.large,
        ),
        footer: tag.isBoolean
            ? null
            : DsSparkline(
                values: [
                  for (final p in trend.skip(
                    trend.length > 60 ? trend.length - 60 : 0,
                  ))
                    p.value,
                ],
              ),
      ),
    );
  }
}

class _MiniTank extends StatelessWidget {
  final TagDefinition tag;
  final PlantLiveState live;
  final Color? alarm;

  const _MiniTank({required this.tag, required this.live, this.alarm});

  @override
  Widget build(BuildContext context) {
    final value = live.numberOf(tag.id);
    final min = tag.min ?? 0;
    final max = tag.max ?? 100;
    return DsTankIndicator(
      width: 48,
      height: 72,
      fraction: value == null ? null : (value - min) / (max - min),
      alarmColor: alarm,
    );
  }
}

class _StateFooter extends StatelessWidget {
  final TagDefinition tag;
  final PlantLiveState live;

  const _StateFooter({required this.tag, required this.live});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final on = live.boolOf(tag.id);
    final reading = live.reading(tag.id);
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: on == null
                ? Colors.transparent
                : on
                ? c.running
                : c.stopped,
            border: Border.all(color: c.borderStrong),
          ),
        ),
        SizedBox(width: context.spacing.sm),
        Expanded(
          child: Text(
            tag.name,
            style: context.text.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: context.spacing.sm),
        TagValueText(tag: tag, reading: reading),
      ],
    );
  }
}
