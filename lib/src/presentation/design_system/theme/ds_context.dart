import 'package:flutter/material.dart';

import '../tokens/ds_colors.dart';
import '../tokens/ds_metrics.dart';
import '../tokens/ds_typography.dart';

/// Acesso aos tokens do design system herdados pelo [BuildContext].
///
/// ```dart
/// Container(
///   padding: EdgeInsets.all(context.spacing.lg),
///   decoration: BoxDecoration(
///     color: context.colors.surface,
///     borderRadius: context.radius.lg,
///   ),
///   child: Text('42', style: context.ds.valueLarge),
/// )
/// ```
extension DsContext on BuildContext {
  ThemeData get _theme => Theme.of(this);

  /// Paleta semântica.
  DsColors get colors => _theme.extension<DsColors>()!;

  /// Escala de espaçamento.
  DsSpacing get spacing => _theme.extension<DsSpacing>()!;

  /// Raios de borda.
  DsRadius get radius => _theme.extension<DsRadius>()!;

  /// Movimento.
  DsMotion get motion => _theme.extension<DsMotion>()!;

  /// Estilos de texto do supervisório.
  DsTextStyles get ds => _theme.extension<DsTextStyles>()!;

  /// Estilos de texto Material.
  TextTheme get text => _theme.textTheme;
}

/// Tom semântico de um componente — mapeado para cor pela paleta.
enum DsTone {
  /// Neutro.
  neutral,

  /// Interação/informação.
  accent,

  /// Confirmação.
  success,

  /// Crítico.
  critical,

  /// Alto.
  high,

  /// Médio.
  medium,

  /// Baixo.
  low,

  /// Qualidade ruim/comunicação.
  badQuality,
}

/// Cor de cada [DsTone].
extension DsToneColor on DsTone {
  /// Cor principal do tom na paleta [c].
  Color color(DsColors c) => switch (this) {
        DsTone.neutral => c.textSecondary,
        DsTone.accent => c.accent,
        DsTone.success => c.success,
        DsTone.critical => c.alarmCritical,
        DsTone.high => c.alarmHigh,
        DsTone.medium => c.alarmMedium,
        DsTone.low => c.alarmLow,
        DsTone.badQuality => c.badQuality,
      };
}
