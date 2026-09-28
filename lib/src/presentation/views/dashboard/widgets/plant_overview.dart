import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';
import '../../../design_system/design_system.dart';
import '../../../shared/shared.dart';

/// Faixa de indicadores gerais da planta.
class PlantOverview extends StatelessWidget {
  /// Planta.
  final Plant plant;

  /// Estado ao vivo.
  final PlantLiveState live;

  /// Alarmes.
  final List<Alarm> alarms;

  /// Toque no indicador de alarmes.
  final VoidCallback onAlarmsTap;

  /// Cria um [PlantOverview].
  const PlantOverview({
    super.key,
    required this.plant,
    required this.live,
    required this.alarms,
    required this.onAlarmsTap,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final s = context.spacing;

    final active = alarms.where((a) => a.active).toList();
    final unacked = alarms.where((a) => !a.acknowledged).length;
    final top = active.isEmpty
        ? null
        : active
              .map((a) => a.severity)
              .reduce((a, b) => a.priority <= b.priority ? a : b);

    final tags = plant.allTags.toList();
    final good = tags
        .where((t) => live.reading(t.id)?.quality == TagQuality.good)
        .length;
    final commColor = good == tags.length ? null : c.badQuality;

    return DsCard(
      padding: EdgeInsets.symmetric(vertical: s.lg, horizontal: s.lg),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: onAlarmsTap,
                borderRadius: context.radius.md,
                child: DsKpiTile(
                  icon: Icons.notifications_active_outlined,
                  label: 'Alarmes',
                  value: DsValueText(
                    value: '${active.length}',
                    size: DsValueSize.large,
                    color: top?.tone.color(c),
                  ),
                  footer: Text(
                    unacked == 0
                        ? 'todos reconhecidos'
                        : '$unacked não reconhecidos',
                    style: context.text.bodySmall,
                  ),
                ),
              ),
            ),
            VerticalDivider(width: s.xl),
            Expanded(
              child: DsKpiTile(
                icon: Icons.sensors_rounded,
                label: 'Tags OK',
                value: DsValueText(
                  value: '$good',
                  unit: '/ ${tags.length}',
                  size: DsValueSize.large,
                  color: commColor,
                ),
                footer: Text(
                  good == tags.length
                      ? 'comunicação OK'
                      : 'qualidade degradada',
                  style: context.text.bodySmall,
                ),
              ),
            ),
            VerticalDivider(width: s.xl),
            Expanded(
              child: DsKpiTile(
                icon: Icons.precision_manufacturing_outlined,
                label: 'Ativos',
                value: DsValueText(
                  value: '${plant.equipments.length}',
                  size: DsValueSize.large,
                ),
                footer: Text(
                  '${plant.allTags.length} tags mapeadas',
                  style: context.text.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
