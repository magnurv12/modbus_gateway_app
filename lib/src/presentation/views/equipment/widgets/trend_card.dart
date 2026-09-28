import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';
import '../../../design_system/design_system.dart';
import '../../../shared/shared.dart';

/// Tendência de uma tag analógica com seletor e linhas de alarme.
class TrendCard extends StatelessWidget {
  /// Tags selecionáveis.
  final List<TagDefinition> tags;

  /// Tag selecionada.
  final String? selectedId;

  /// Estado ao vivo.
  final PlantLiveState live;

  /// Troca de tag.
  final ValueChanged<String> onSelect;

  /// Cria um [TrendCard].
  const TrendCard({
    super.key,
    required this.tags,
    required this.selectedId,
    required this.live,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    final c = context.colors;
    final tag = tags.where((t) => t.id == selectedId).firstOrNull ?? tags.first;
    final points = live.trend(tag.id);

    return DsCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final t in tags) ...[
                  ChoiceChip(
                    label: Text(t.name),
                    selected: t.id == tag.id,
                    onSelected: (_) => onSelect(t.id),
                  ),
                  SizedBox(width: s.sm),
                ],
              ],
            ),
          ),
          SizedBox(height: s.lg),
          DsTrendChart(
            values: [for (final p in points) p.value],
            minY: tag.min,
            maxY: tag.max,
            formatY: (v) => Formatters.number(v, decimals: tag.decimals),
            limits: [
              for (final rule in tag.alarms)
                if (rule.limit != null)
                  DsChartLimit(
                    rule.limit!,
                    rule.severity.tone.color(c),
                    rule.condition == AlarmCondition.above ? 'H' : 'L',
                  ),
            ],
            caption: points.isEmpty
                ? ''
                : 'últimos ${_window(points)} · amostragem 1 s · ${tag.unit}',
          ),
        ],
      ),
    );
  }

  String _window(List<TrendPoint> points) {
    final span = points.last.time.difference(points.first.time);
    return span.inMinutes >= 1 ? '${span.inMinutes} min' : '${span.inSeconds} s';
  }
}
