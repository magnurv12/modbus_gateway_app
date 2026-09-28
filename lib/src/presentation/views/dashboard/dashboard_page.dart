import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/mvvm/mvvm.dart';
import '../../design_system/design_system.dart';
import '../../router/app_routes.dart';
import '../../shared/shared.dart';
import 'dashboard_state.dart';
import 'dashboard_viewmodel.dart';
import 'widgets/equipment_card.dart';
import 'widgets/plant_overview.dart';

/// Painel da planta: visão geral e cards dos equipamentos.
class DashboardPage extends StatefulWidget {
  /// Cria um [DashboardPage].
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ViewState<DashboardPage, DashboardViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<DashboardViewModel, DashboardState>(
        viewModel: viewModel,
        builder: (context, state) => switch (state) {
          DashboardStateLoading() => const SafeArea(child: DsLoadingView()),
          DashboardStateError(:final failure) =>
            FailureView(failure: failure, onRetry: viewModel.load),
          final DashboardStateLoaded loaded => _Loaded(state: loaded),
        },
      ),
    );
  }
}

class _Loaded extends StatelessWidget {
  final DashboardStateLoaded state;

  const _Loaded({required this.state});

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          toolbarHeight: 72,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(state.plant.name, style: context.text.titleLarge),
              ),
              Text(state.plant.site, style: context.text.bodySmall),
            ],
          ),
          actions: [
            LiveIndicator(status: state.live.status),
            SizedBox(width: s.page),
          ],
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: s.page),
          sliver: SliverList.list(
            children: [
              SizedBox(height: s.sm),
              PlantOverview(
                plant: state.plant,
                live: state.live,
                alarms: state.alarms,
                onAlarmsTap: () => context.goNamed(AppRoutes.alarms),
              ),
              DsSectionHeader(
                'Equipamentos',
                caption: '${state.equipments.length}',
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(s.page, 0, s.page, s.xxl),
          sliver: SliverList.separated(
            itemCount: state.equipments.length,
            separatorBuilder: (_, _) => SizedBox(height: s.md),
            itemBuilder: (context, index) {
              final summary = state.equipments[index];
              return EquipmentCard(
                summary: summary,
                live: state.live,
                onTap: () => context.goToEquipment(summary.equipment.id),
              );
            },
          ),
        ),
      ],
    );
  }
}
