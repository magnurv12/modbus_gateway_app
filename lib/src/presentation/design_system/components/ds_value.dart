import 'package:flutter/material.dart';

import '../theme/ds_context.dart';

/// Qualidade visual de um valor de processo.
enum DsValueQuality {
  /// Valor atual.
  good,

  /// Último valor conhecido (sem comunicação) — esmaecido.
  stale,

  /// Leitura falhou — magenta.
  bad,

  /// Ainda sem leitura.
  pending,
}

/// Tamanho do [DsValueText].
enum DsValueSize {
  /// Hero de equipamento.
  hero,

  /// KPI.
  large,

  /// Linha de lista.
  medium,
}

/// Valor numérico com unidade, algarismos tabulares e indicação de
/// qualidade — o bloco de construção de toda leitura na tela.
class DsValueText extends StatelessWidget {
  /// Valor já formatado (ex.: `72,4`).
  final String value;

  /// Unidade (ex.: `%`).
  final String unit;

  /// Tamanho.
  final DsValueSize size;

  /// Qualidade.
  final DsValueQuality quality;

  /// Cor de estado (ex.: valor em alarme). `null` = cor normal.
  final Color? color;

  /// Cria um [DsValueText].
  const DsValueText({
    super.key,
    required this.value,
    this.unit = '',
    this.size = DsValueSize.medium,
    this.quality = DsValueQuality.good,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final base = switch (size) {
      DsValueSize.hero => context.ds.valueHero,
      DsValueSize.large => context.ds.valueLarge,
      DsValueSize.medium => context.ds.valueMedium,
    };
    final valueColor = switch (quality) {
      DsValueQuality.good => color ?? base.color,
      DsValueQuality.stale => colors.textMuted,
      DsValueQuality.bad => colors.badQuality,
      DsValueQuality.pending => colors.textMuted,
    };
    final shown = quality == DsValueQuality.pending ? '—' : value;
    final unitStyle = context.ds.unit.copyWith(
      fontSize: size == DsValueSize.hero ? 18 : null,
      color: quality == DsValueQuality.good ? null : colors.textMuted,
    );

    return Semantics(
      label: '$shown $unit'.trim(),
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          AnimatedDefaultTextStyle(
            duration: context.motion.fast,
            style: base.copyWith(
              color: valueColor,
              fontStyle: quality == DsValueQuality.stale
                  ? FontStyle.italic
                  : FontStyle.normal,
            ),
            child: Text(shown),
          ),
          if (unit.isNotEmpty) ...[
            const SizedBox(width: 4),
            Text(unit, style: unitStyle),
          ],
          if (quality == DsValueQuality.bad) ...[
            const SizedBox(width: 6),
            Icon(Icons.link_off_rounded, size: 14, color: colors.badQuality),
          ],
        ],
      ),
    );
  }
}

/// Tile de KPI: rótulo + valor grande + rodapé opcional (ex.: sparkline).
class DsKpiTile extends StatelessWidget {
  /// Rótulo.
  final String label;

  /// Valor.
  final Widget value;

  /// Rodapé (sparkline, badge...).
  final Widget? footer;

  /// Ícone do rótulo.
  final IconData? icon;

  /// Cria um [DsKpiTile].
  const DsKpiTile({
    super.key,
    required this.label,
    required this.value,
    this.footer,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 14, color: context.colors.textMuted),
              SizedBox(width: context.spacing.xs),
            ],
            Flexible(
              child: Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.text.bodySmall,
              ),
            ),
          ],
        ),
        SizedBox(height: context.spacing.xs),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: value,
        ),
        if (footer != null) ...[
          SizedBox(height: context.spacing.sm),
          footer!,
        ],
      ],
    );
  }
}
