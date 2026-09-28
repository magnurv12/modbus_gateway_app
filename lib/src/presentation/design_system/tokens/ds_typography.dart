import 'package:flutter/material.dart';

import 'ds_colors.dart';

/// Estilos de texto próprios do supervisório, além do [TextTheme].
///
/// Valores de processo usam algarismos tabulares: numa tela que atualiza a
/// cada 500 ms, dígitos proporcionais fazem o número "tremer".
@immutable
class DsTextStyles extends ThemeExtension<DsTextStyles> {
  /// Valor de destaque (hero de equipamento).
  final TextStyle valueHero;

  /// Valor grande (KPIs).
  final TextStyle valueLarge;

  /// Valor médio (listas de tags).
  final TextStyle valueMedium;

  /// Unidade ao lado do valor.
  final TextStyle unit;

  /// Rótulo em caixa alta (overline de seções/tags ISA).
  final TextStyle overline;

  /// Monoespaçado (endereços, hex, binário).
  final TextStyle mono;

  /// Cria um [DsTextStyles].
  const DsTextStyles({
    required this.valueHero,
    required this.valueLarge,
    required this.valueMedium,
    required this.unit,
    required this.overline,
    required this.mono,
  });

  static const _tabular = [FontFeature.tabularFigures()];
  static const _monoFamilies = [
    'Menlo',
    'Roboto Mono',
    'Consolas',
    'monospace',
  ];

  /// Constrói os estilos a partir da paleta.
  factory DsTextStyles.from(DsColors c) => DsTextStyles(
    valueHero: TextStyle(
      fontSize: 44,
      height: 1.05,
      fontWeight: FontWeight.w600,
      letterSpacing: -1,
      color: c.textPrimary,
      fontFeatures: _tabular,
    ),
    valueLarge: TextStyle(
      fontSize: 26,
      height: 1.1,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
      color: c.textPrimary,
      fontFeatures: _tabular,
    ),
    valueMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: c.textPrimary,
      fontFeatures: _tabular,
    ),
    unit: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: c.textSecondary,
    ),
    overline: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.1,
      color: c.textMuted,
    ),
    mono: TextStyle(
      fontSize: 13,
      fontFamilyFallback: _monoFamilies,
      color: c.textPrimary,
      fontFeatures: _tabular,
    ),
  );

  @override
  DsTextStyles copyWith() => this;

  @override
  DsTextStyles lerp(DsTextStyles? other, double t) {
    if (other == null) return this;
    return DsTextStyles(
      valueHero: TextStyle.lerp(valueHero, other.valueHero, t)!,
      valueLarge: TextStyle.lerp(valueLarge, other.valueLarge, t)!,
      valueMedium: TextStyle.lerp(valueMedium, other.valueMedium, t)!,
      unit: TextStyle.lerp(unit, other.unit, t)!,
      overline: TextStyle.lerp(overline, other.overline, t)!,
      mono: TextStyle.lerp(mono, other.mono, t)!,
    );
  }
}
