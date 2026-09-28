import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Nomes e caminhos das rotas nomeadas.
///
/// As telas navegam **sempre** pelo nome (`context.goNamed`), nunca por
/// string de caminho — trocar uma URL não quebra nenhuma chamada.
abstract final class AppRoutes {
  /// Painel da planta.
  static const dashboard = 'dashboard';

  /// Detalhe de equipamento (parâmetro `equipmentId`).
  static const equipment = 'equipment';

  /// Lista de alarmes.
  static const alarms = 'alarms';

  /// Explorador Modbus.
  static const explorer = 'explorer';

  /// Saúde do gateway.
  static const gateway = 'gateway';

  /// Parâmetro de caminho do equipamento.
  static const equipmentIdParam = 'equipmentId';
}

/// Atalhos tipados de navegação.
extension AppNavigation on BuildContext {
  /// Abre o detalhe do equipamento [equipmentId].
  void goToEquipment(String equipmentId) => goNamed(
        AppRoutes.equipment,
        pathParameters: {AppRoutes.equipmentIdParam: equipmentId},
      );
}
