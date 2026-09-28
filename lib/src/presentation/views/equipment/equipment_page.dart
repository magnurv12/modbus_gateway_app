import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';
import '../../design_system/design_system.dart';
import '../../router/app_routes.dart';
import '../../shared/shared.dart';
import 'equipment_state.dart';
import 'equipment_viewmodel.dart';
import 'widgets/equipment_hero.dart';
import 'widgets/setpoint_sheet.dart';
import 'widgets/tag_tiles.dart';
import 'widgets/trend_card.dart';

/// Detalhe de um equipamento: sinótico, tendências, status, comandos e
/// parâmetros.
class EquipmentPage extends StatefulWidget {
  /// Id do equipamento (parâmetro da rota).
  final String equipmentId;

  /// Cria um [EquipmentPage].
  const EquipmentPage({super.key, required this.equipmentId});

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends ViewState<EquipmentPage, EquipmentViewModel> {
  @override
  EquipmentViewModel resolveViewModel() =>
      DM.getWithParam<EquipmentViewModel, String>(widget.equipmentId);

  void _onEffect(BuildContext context, EquipmentEffect effect) {
    switch (effect) {
      case WriteConfirmed(:final message):
        HapticFeedback.lightImpact();
        context.showDsSnackBar(
          message,
          tone: DsTone.success,
          icon: Icons.check_circle_rounded,
        );
      case WriteFailed(:final failure, :final retry):
        HapticFeedback.heavyImpact();
        context.showFailure(
          failure,
          onRetry: failure.isTransient ? retry : null,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelEffectListener<EquipmentEffect>(
      effects: viewModel.effects,
      onEffect: _onEffect,
      child: ViewModelBuilder<EquipmentViewModel, EquipmentState>(
        viewModel: viewModel,
        builder: (context, state) => switch (state) {
          EquipmentStateLoading() => Scaffold(
            appBar: AppBar(),
            body: const DsLoadingView(),
          ),
          EquipmentStateNotFound(:final equipmentId) => Scaffold(
            appBar: AppBar(),
            body: DsMessageView(
              icon: Icons.search_off_rounded,
              title: 'Equipamento não encontrado',
              message: 'Não existe "$equipmentId" no mapa da planta atual.',
              actionLabel: 'Voltar para a planta',
              onAction: () => context.goNamed(AppRoutes.dashboard),
            ),
          ),
          EquipmentStateError(:final failure) => Scaffold(
            appBar: AppBar(),
            body: FailureView(failure: failure, onRetry: viewModel.load),
          ),
          final EquipmentStateLoaded loaded => _Loaded(
            state: loaded,
            viewModel: viewModel,
          ),
        },
      ),
    );
  }
}

class _Loaded extends StatelessWidget {
  final EquipmentStateLoaded state;
  final EquipmentViewModel viewModel;

  const _Loaded({required this.state, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    final equipment = state.equipment;
    final live = state.live;

    final alarmByTag = <String, AlarmSeverity>{};
    for (final alarm in state.alarms.where((a) => a.active)) {
      final current = alarmByTag[alarm.tagId];
      if (current == null || alarm.severity.priority < current.priority) {
        alarmByTag[alarm.tagId] = alarm.severity;
      }
    }

    final measurements = equipment
        .tagsWithRole(TagRole.measurement)
        .where((t) => !t.isBoolean)
        .toList();
    final statuses = equipment.tagsWithRole(TagRole.status);
    final commands = equipment.tagsWithRole(TagRole.command);
    final setpoints = equipment.tagsWithRole(TagRole.setpoint);
    final trendTags = [...measurements, ...setpoints];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(equipment.tag, style: context.ds.overline),
            Text(equipment.name),
          ],
        ),
        actions: [
          LiveIndicator(status: live.status),
          SizedBox(width: s.page),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(s.page, s.sm, s.page, s.xxxl),
        children: [
          EquipmentHero(
            equipment: equipment,
            live: live,
            alarmByTag: alarmByTag,
          ),
          if (state.alarms.isNotEmpty) ...[
            DsSectionHeader('Alarmes', caption: '${state.alarms.length}'),
            for (final alarm in state.alarms) ...[
              AlarmTile(
                alarm: alarm,
                onAcknowledge: () => viewModel.acknowledge(alarm.id),
              ),
              SizedBox(height: s.sm),
            ],
          ],
          if (trendTags.isNotEmpty) ...[
            const DsSectionHeader('Tendência'),
            TrendCard(
              tags: trendTags,
              selectedId: state.trendTagId,
              live: live,
              onSelect: viewModel.selectTrend,
            ),
          ],
          if (measurements.isNotEmpty) ...[
            const DsSectionHeader('Medições', caption: 'input registers'),
            DsCard(
              padding: EdgeInsets.symmetric(horizontal: s.lg, vertical: s.xs),
              child: Column(
                children: [
                  for (final (i, tag) in measurements.indexed) ...[
                    if (i > 0) const Divider(),
                    MeasurementTile(
                      tag: tag,
                      reading: live.reading(tag.id),
                      alarm: alarmByTag[tag.id],
                    ),
                  ],
                ],
              ),
            ),
          ],
          if (statuses.isNotEmpty) ...[
            const DsSectionHeader('Status', caption: 'entradas discretas'),
            _StatusGrid(tags: statuses, live: live, alarmByTag: alarmByTag),
          ],
          if (commands.isNotEmpty) ...[
            const DsSectionHeader('Comandos', caption: 'coils'),
            DsCard(
              padding: EdgeInsets.symmetric(horizontal: s.lg, vertical: s.xs),
              child: Column(
                children: [
                  for (final (i, tag) in commands.indexed) ...[
                    if (i > 0) const Divider(),
                    CommandTile(
                      tag: tag,
                      reading: live.reading(tag.id),
                      pending: state.pendingWrites.contains(tag.id),
                      onChanged: (on) => viewModel.setCommand(tag, on),
                      onPulse: () => viewModel.pulse(tag),
                    ),
                  ],
                ],
              ),
            ),
          ],
          if (setpoints.isNotEmpty) ...[
            const DsSectionHeader('Parâmetros', caption: 'holding registers'),
            DsCard(
              padding: EdgeInsets.symmetric(horizontal: s.lg, vertical: s.xs),
              child: Column(
                children: [
                  for (final (i, tag) in setpoints.indexed) ...[
                    if (i > 0) const Divider(),
                    SetpointTile(
                      tag: tag,
                      reading: live.reading(tag.id),
                      pending: state.pendingWrites.contains(tag.id),
                      onEdit: () => _editSetpoint(context, tag),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _editSetpoint(BuildContext context, TagDefinition tag) async {
    final current = state.live.numberOf(tag.id);
    if (current == null) return;
    final value = await showSetpointSheet(context, tag: tag, current: current);
    if (value != null) await viewModel.writeSetpoint(tag, value);
  }
}

class _StatusGrid extends StatelessWidget {
  final List<TagDefinition> tags;
  final PlantLiveState live;
  final Map<String, AlarmSeverity> alarmByTag;

  const _StatusGrid({
    required this.tags,
    required this.live,
    required this.alarmByTag,
  });

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth > 560 ? 3 : 2;
        final width = (constraints.maxWidth - s.sm * (columns - 1)) / columns;
        return Wrap(
          spacing: s.sm,
          runSpacing: s.sm,
          children: [
            for (final tag in tags)
              SizedBox(
                width: width,
                child: StatusTile(
                  tag: tag,
                  reading: live.reading(tag.id),
                  alarm: alarmByTag[tag.id],
                ),
              ),
          ],
        );
      },
    );
  }
}
