import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/mvvm/mvvm.dart';
import '../../design_system/design_system.dart';
import '../../shared/shared.dart';
import 'shell_state.dart';
import 'shell_viewmodel.dart';

/// Moldura com navegação inferior e banner de conexão global.
class ShellPage extends StatefulWidget {
  /// Shell do go_router (mantém a pilha de cada aba).
  final StatefulNavigationShell navigationShell;

  /// Cria um [ShellPage].
  const ShellPage({super.key, required this.navigationShell});

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends ViewState<ShellPage, ShellViewModel> {
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(
      onStateChange: viewModel.onLifecycleChanged,
    );
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  void _onDestinationSelected(int index) {
    widget.navigationShell.goBranch(
      index,
      // Tocar na aba atual volta para a raiz dela.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShellViewModel, ShellState>(
      viewModel: viewModel,
      builder: (context, state) {
        return switch (state) {
          ShellStateLoading() => const Scaffold(body: DsLoadingView()),
          ShellStateError(:final failure) => Scaffold(
              body: FailureView(failure: failure, onRetry: viewModel.load),
            ),
          final ShellStateReady ready => _buildReady(context, ready),
        };
      },
    );
  }

  Widget _buildReady(BuildContext context, ShellStateReady state) {
    final badgeColor = state.topSeverity?.tone.color(context.colors);
    return Scaffold(
      body: Column(
        children: [
          ConnectionBanner(
            status: state.status,
            failure: state.connectionFailure,
            nextRetryAt: state.nextRetryAt,
            onReconnect: viewModel.reconnect,
          ),
          Expanded(child: widget.navigationShell),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.space_dashboard_outlined),
            selectedIcon: Icon(Icons.space_dashboard_rounded),
            label: 'Planta',
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: state.pendingAlarms > 0,
              backgroundColor: badgeColor,
              label: Text('${state.pendingAlarms}'),
              child: const Icon(Icons.notifications_outlined),
            ),
            selectedIcon: Badge(
              isLabelVisible: state.pendingAlarms > 0,
              backgroundColor: badgeColor,
              label: Text('${state.pendingAlarms}'),
              child: const Icon(Icons.notifications_rounded),
            ),
            label: 'Alarmes',
          ),
          const NavigationDestination(
            icon: Icon(Icons.manage_search_outlined),
            selectedIcon: Icon(Icons.manage_search_rounded),
            label: 'Explorador',
          ),
          const NavigationDestination(
            icon: Icon(Icons.router_outlined),
            selectedIcon: Icon(Icons.router_rounded),
            label: 'Gateway',
          ),
        ],
      ),
    );
  }
}
