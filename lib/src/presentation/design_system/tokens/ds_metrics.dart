import 'package:flutter/material.dart';

/// Escala de espaçamento (base 4).
@immutable
class DsSpacing extends ThemeExtension<DsSpacing> {
  /// 2
  final double xxs;

  /// 4
  final double xs;

  /// 8
  final double sm;

  /// 12
  final double md;

  /// 16
  final double lg;

  /// 24
  final double xl;

  /// 32
  final double xxl;

  /// 48
  final double xxxl;

  /// Margem lateral padrão das telas.
  final double page;

  /// Cria um [DsSpacing].
  const DsSpacing({
    this.xxs = 2,
    this.xs = 4,
    this.sm = 8,
    this.md = 12,
    this.lg = 16,
    this.xl = 24,
    this.xxl = 32,
    this.xxxl = 48,
    this.page = 16,
  });

  /// Escala padrão.
  static const regular = DsSpacing();

  @override
  DsSpacing copyWith({double? page}) => DsSpacing(page: page ?? this.page);

  @override
  DsSpacing lerp(DsSpacing? other, double t) => this;
}

/// Raios de borda.
@immutable
class DsRadius extends ThemeExtension<DsRadius> {
  /// Chips, badges.
  final BorderRadius sm;

  /// Campos, botões.
  final BorderRadius md;

  /// Cards.
  final BorderRadius lg;

  /// Sheets.
  final BorderRadius xl;

  /// Pílula.
  final BorderRadius pill;

  /// Cria um [DsRadius].
  const DsRadius({
    this.sm = const BorderRadius.all(Radius.circular(6)),
    this.md = const BorderRadius.all(Radius.circular(10)),
    this.lg = const BorderRadius.all(Radius.circular(14)),
    this.xl = const BorderRadius.all(Radius.circular(22)),
    this.pill = const BorderRadius.all(Radius.circular(999)),
  });

  /// Raios padrão.
  static const regular = DsRadius();

  @override
  DsRadius copyWith() => this;

  @override
  DsRadius lerp(DsRadius? other, double t) => this;
}

/// Durações de animação.
@immutable
class DsMotion extends ThemeExtension<DsMotion> {
  /// Micro-interações.
  final Duration fast;

  /// Transições comuns.
  final Duration normal;

  /// Transições de valor em gauges.
  final Duration slow;

  /// Curva padrão.
  final Curve curve;

  /// Cria um [DsMotion].
  const DsMotion({
    this.fast = const Duration(milliseconds: 150),
    this.normal = const Duration(milliseconds: 250),
    this.slow = const Duration(milliseconds: 450),
    this.curve = Curves.easeOutCubic,
  });

  /// Movimento padrão.
  static const regular = DsMotion();

  @override
  DsMotion copyWith() => this;

  @override
  DsMotion lerp(DsMotion? other, double t) => this;
}
