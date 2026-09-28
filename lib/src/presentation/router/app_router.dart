import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../design_system/design_system.dart';
import '../views/views.dart';
import 'app_routes.dart';

/// Configuração de navegação.
///
/// `StatefulShellRoute.indexedStack` mantém uma pilha por aba: sair do
/// detalhe da P-101 para os alarmes e voltar preserva onde o operador
/// estava.
GoRouter buildAppRouter() {
  return GoRouter(
    initialLocation: '/planta',
    debugLogDiagnostics: false,
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(),
      body: DsMessageView(
        icon: Icons.explore_off_rounded,
        title: 'Página não encontrada',
        message: 'O endereço "${state.uri}" não existe neste app.',
        actionLabel: 'Ir para a planta',
        onAction: () => context.goNamed(AppRoutes.dashboard),
      ),
    ),
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => ShellPage(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/planta',
                name: AppRoutes.dashboard,
                builder: (context, state) => const DashboardPage(),
                routes: [
                  GoRoute(
                    path: 'equipamento/:${AppRoutes.equipmentIdParam}',
                    name: AppRoutes.equipment,
                    builder: (context, state) => EquipmentPage(
                      // A key por id recria o view model ao trocar de
                      // equipamento na mesma rota.
                      key: ValueKey(
                        state.pathParameters[AppRoutes.equipmentIdParam],
                      ),
                      equipmentId:
                          state.pathParameters[AppRoutes.equipmentIdParam]!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/alarmes',
                name: AppRoutes.alarms,
                builder: (context, state) => const AlarmsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/explorador',
                name: AppRoutes.explorer,
                builder: (context, state) => const ExplorerPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/gateway',
                name: AppRoutes.gateway,
                builder: (context, state) => const GatewayPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
