import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';
import '../../../design_system/design_system.dart';
import '../../../shared/shared.dart';

/// Sinótico do equipamento: desenho por tipo + valores principais.
class EquipmentHero extends StatelessWidget {
  /// Equipamento.
  final Equipment equipment;

  /// Estado ao vivo.
  final PlantLiveState live;

  /// Severidade ativa por tag.
  final Map<String, AlarmSeverity> alarmByTag;

  /// Cria um [EquipmentHero].
  const EquipmentHero({
    super.key,
    required this.equipment,
    required this.live,
    required this.alarmByTag,
  });

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    final primary = equipment.primaryTags;
    final stateTag = equipment.stateTag;
    final running = stateTag == null ? null : live.boolOf(stateTag.id);

    return DsCard(
      padding: EdgeInsets.all(s.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (equipment.description.isNotEmpty) ...[
            Text(equipment.description, style: context.text.bodyMedium),
            SizedBox(height: s.xl),
          ],
          Row(
            children: [
              _Visual(
                equipment: equipment,
                live: live,
                running: running,
                alarm: primary.isEmpty ? null : alarmByTag[primary.first.id],
              ),
              SizedBox(width: s.xl),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final (i, tag) in primary.indexed) ...[
                      if (i > 0) SizedBox(height: s.lg),
                      Text(tag.name, style: context.text.bodySmall),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: TagValueText(
                          tag: tag,
                          reading: live.reading(tag.id),
                          size: i == 0 ? DsValueSize.hero : DsValueSize.large,
                          alarm: alarmByTag[tag.id],
                        ),
                      ),
                    ],
                    if (stateTag != null) ...[
                      SizedBox(height: s.lg),
                      DsBadge(
                        label: Formatters.tagValue(
                          stateTag,
                          live.reading(stateTag.id)?.value,
                        ),
                        icon: running == true
                            ? Icons.play_arrow_rounded
                            : Icons.stop_rounded,
                        tone: running == true ? DsTone.accent : DsTone.neutral,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Visual extends StatelessWidget {
  final Equipment equipment;
  final PlantLiveState live;
  final bool? running;
  final AlarmSeverity? alarm;

  const _Visual({
    required this.equipment,
    required this.live,
    required this.running,
    required this.alarm,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final alarmColor = alarm?.tone.color(c);

    if (equipment.type == EquipmentType.tank && equipment.primaryTags.isNotEmpty) {
      final level = equipment.primaryTags.first;
      final min = level.min ?? 0;
      final max = level.max ?? 100;
      double norm(double v) => (v - min) / (max - min);
      final value = live.numberOf(level.id);

      // Limites de alarme do nível + setpoints na mesma unidade.
      final markers = [
        for (final rule in level.alarms)
          if (rule.limit != null)
            DsGaugeMarker(norm(rule.limit!), rule.severity.tone.color(c)),
        for (final sp in equipment.tagsWithRole(TagRole.setpoint))
          if (sp.unit == level.unit && live.numberOf(sp.id) != null)
            DsGaugeMarker(norm(live.numberOf(sp.id)!), c.accent),
      ];
      return DsTankIndicator(
        fraction: value == null ? null : norm(value),
        markers: markers,
        alarmColor: alarmColor,
      );
    }

    final icon = equipment.type.icon;
    final active = running == true;
    final visual = Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? c.accentMuted : c.surfaceSunken,
        border: Border.all(
          color: alarmColor ?? (active ? c.accent : c.borderStrong),
          width: 2,
        ),
      ),
      child: Icon(icon, size: 44, color: active ? c.running : c.stopped),
    );

    if (equipment.type != EquipmentType.pump) return visual;
    return _Spinning(spinning: active, child: visual);
  }
}

/// Gira o rotor da bomba enquanto ela opera — leitura instantânea de estado.
class _Spinning extends StatefulWidget {
  final bool spinning;
  final Widget child;

  const _Spinning({required this.spinning, required this.child});

  @override
  State<_Spinning> createState() => _SpinningState();
}

class _SpinningState extends State<_Spinning>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );

  @override
  void initState() {
    super.initState();
    if (widget.spinning) _controller.repeat();
  }

  @override
  void didUpdateWidget(covariant _Spinning oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.spinning && !_controller.isAnimating) _controller.repeat();
    if (!widget.spinning && _controller.isAnimating) _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(turns: _controller, child: widget.child);
  }
}
