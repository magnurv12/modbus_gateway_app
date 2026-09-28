import 'package:flutter/material.dart';

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';
import '../../design_system/design_system.dart';
import '../../router/app_routes.dart';
import '../../shared/shared.dart';
import 'alarms_state.dart';
import 'alarms_viewmodel.dart';

/// Lista de alarmes da planta (ciclo ISA-18.2).
class AlarmsPage extends StatefulWidget {
  /// Cria um [AlarmsPage].
  const AlarmsPage({super.key});

  @override
  State<AlarmsPage> createState() => _AlarmsPageState();
}

class _AlarmsPageState extends ViewState<AlarmsPage, AlarmsViewModel> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlarmsViewModel, AlarmsState>(
      viewModel: viewModel,
      builder: (context, state) {
        final loaded = state is AlarmsStateLoaded ? state : null;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Alarmes'),
            actions: [
              if (loaded != null && loaded.unacknowledgedCount > 0)
                TextButton.icon(
                  onPressed: viewModel.acknowledgeAll,
                  icon: const Icon(Icons.done_all_rounded, size: 18),
                  label: const Text('Reconhecer todos'),
                ),
              SizedBox(width: context.spacing.sm),
            ],
          ),
          body: switch (state) {
            AlarmsStateLoading() => const DsLoadingView(),
            AlarmsStateError(:final failure) => FailureView(
              failure: failure,
              onRetry: viewModel.load,
            ),
            final AlarmsStateLoaded loaded => _Loaded(
              state: loaded,
              viewModel: viewModel,
            ),
          },
        );
      },
    );
  }
}

class _Loaded extends StatelessWidget {
  final AlarmsStateLoaded state;
  final AlarmsViewModel viewModel;

  const _Loaded({required this.state, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    final visible = state.visible;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(s.page, s.sm, s.page, 0),
          sliver: SliverList.list(
            children: [
              _SeveritySummary(counts: state.activeBySeverity),
              SizedBox(height: s.lg),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final filter in AlarmFilter.values) ...[
                      FilterChip(
                        label: Text(switch (filter) {
                          AlarmFilter.all => 'Todos (${state.all.length})',
                          AlarmFilter.active => 'Ativos',
                          AlarmFilter.unacknowledged =>
                            'Não reconhecidos (${state.unacknowledgedCount})',
                        }),
                        selected: state.filter == filter,
                        onSelected: (_) => viewModel.setFilter(filter),
                      ),
                      SizedBox(width: s.sm),
                    ],
                  ],
                ),
              ),
              SizedBox(height: s.md),
            ],
          ),
        ),
        if (visible.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: DsMessageView(
              icon: Icons.verified_outlined,
              tone: DsTone.success,
              title: state.all.isEmpty
                  ? 'Planta sem alarmes'
                  : 'Nada neste filtro',
              message: state.all.isEmpty
                  ? 'Todas as variáveis estão dentro dos limites configurados '
                        'no mapa de tags.'
                  : 'Troque o filtro para ver os demais alarmes.',
            ),
          )
        else
          SliverPadding(
            padding: EdgeInsets.fromLTRB(s.page, 0, s.page, s.xxl),
            sliver: SliverList.separated(
              itemCount: visible.length,
              separatorBuilder: (_, _) => SizedBox(height: s.sm),
              itemBuilder: (context, index) {
                final alarm = visible[index];
                final tile = AlarmTile(
                  alarm: alarm,
                  onAcknowledge: () => viewModel.acknowledge(alarm.id),
                  onTap: () => context.goToEquipment(alarm.equipmentId),
                );
                if (alarm.acknowledged) return tile;
                return Dismissible(
                  key: ValueKey('${alarm.id}@${alarm.raisedAt}'),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (_) async {
                    viewModel.acknowledge(alarm.id);
                    return false; // o item muda de estado, não some
                  },
                  background: _SwipeBackground(),
                  child: tile,
                );
              },
            ),
          ),
      ],
    );
  }
}

class _SeveritySummary extends StatelessWidget {
  final Map<AlarmSeverity, int> counts;

  const _SeveritySummary({required this.counts});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final s = context.spacing;
    return DsCard(
      padding: EdgeInsets.symmetric(vertical: s.md, horizontal: s.sm),
      child: Row(
        children: [
          for (final severity in AlarmSeverity.values)
            Expanded(
              child: Column(
                children: [
                  Icon(
                    severity.icon,
                    size: 20,
                    color: counts[severity]! > 0
                        ? severity.tone.color(c)
                        : c.textMuted,
                  ),
                  SizedBox(height: s.xs),
                  DsValueText(
                    value: '${counts[severity]}',
                    size: DsValueSize.large,
                    color: counts[severity]! > 0 ? null : c.textMuted,
                  ),
                  Text(severity.label, style: context.text.bodySmall),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _SwipeBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: context.spacing.xl),
      decoration: BoxDecoration(
        color: context.colors.accentMuted,
        borderRadius: context.radius.lg,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Reconhecer', style: context.text.labelLarge),
          SizedBox(width: context.spacing.sm),
          Icon(Icons.done_all_rounded, color: context.colors.accent),
        ],
      ),
    );
  }
}
