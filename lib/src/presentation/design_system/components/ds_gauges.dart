import 'package:flutter/material.dart';

import '../theme/ds_context.dart';

/// Marcador sobre um gauge (limite de alarme ou setpoint).
class DsGaugeMarker {
  /// Posição em unidade de engenharia.
  final double value;

  /// Cor.
  final Color color;

  /// Cria um [DsGaugeMarker].
  const DsGaugeMarker(this.value, this.color);
}

/// Indicador analógico horizontal no estilo ISA-101: trilho cinza, faixas
/// de alarme sutis e um ponteiro — a posição relativa importa mais que o
/// número.
class DsLinearGauge extends StatelessWidget {
  /// Valor atual (`null` = sem leitura).
  final double? value;

  /// Início da escala.
  final double min;

  /// Fim da escala.
  final double max;

  /// Marcadores (limites de alarme, setpoints).
  final List<DsGaugeMarker> markers;

  /// Cor do ponteiro (padrão: `textPrimary`; cor de alarme quando violado).
  final Color? color;

  /// Cria um [DsLinearGauge].
  const DsLinearGauge({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    this.markers = const [],
    this.color,
  });

  double _fraction(double v) =>
      max <= min ? 0 : ((v - min) / (max - min)).clamp(0.0, 1.0);

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final pointer = color ?? c.textPrimary;
    return SizedBox(
      height: 14,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          return Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: c.surfaceSunken,
                  borderRadius: context.radius.pill,
                  border: Border.all(color: c.border),
                ),
              ),
              if (value != null)
                AnimatedContainer(
                  duration: context.motion.slow,
                  curve: context.motion.curve,
                  height: 6,
                  width: width * _fraction(value!),
                  decoration: BoxDecoration(
                    color: pointer.withValues(alpha: 0.35),
                    borderRadius: context.radius.pill,
                  ),
                ),
              for (final marker in markers)
                Positioned(
                  left: width * _fraction(marker.value) - 1,
                  child: Container(width: 2, height: 14, color: marker.color),
                ),
              if (value != null)
                AnimatedPositioned(
                  duration: context.motion.slow,
                  curve: context.motion.curve,
                  left: width * _fraction(value!) - 5,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: pointer,
                      shape: BoxShape.circle,
                      border: Border.all(color: c.surface, width: 2),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

/// Sinótico de reservatório: nível animado com marcadores laterais.
class DsTankIndicator extends StatelessWidget {
  /// Nível em fração 0..1 (`null` = sem leitura).
  final double? fraction;

  /// Marcadores em fração 0..1 (setpoints, limites).
  final List<DsGaugeMarker> markers;

  /// Cor de alarme sobre o líquido (nível fora da faixa).
  final Color? alarmColor;

  /// Largura.
  final double width;

  /// Altura.
  final double height;

  /// Cria um [DsTankIndicator].
  const DsTankIndicator({
    super.key,
    required this.fraction,
    this.markers = const [],
    this.alarmColor,
    this.width = 84,
    this.height = 132,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final level = (fraction ?? 0).clamp(0.0, 1.0);
    return SizedBox(
      width: width + 14,
      height: height,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: width,
            child: Container(
              decoration: BoxDecoration(
                color: c.surfaceSunken,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                  bottom: Radius.circular(16),
                ),
                border: Border.all(color: alarmColor ?? c.borderStrong, width: 1.5),
              ),
              clipBehavior: Clip.antiAlias,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(end: level),
                  duration: context.motion.slow,
                  curve: context.motion.curve,
                  builder: (context, v, _) => FractionallySizedBox(
                    heightFactor: fraction == null ? 0 : v,
                    widthFactor: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            c.process.withValues(alpha: 0.95),
                            c.process.withValues(alpha: 0.55),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          for (final marker in markers)
            Positioned(
              left: width - 2,
              top: (1 - marker.value.clamp(0.0, 1.0)) * (height - 2),
              child: Container(width: 14, height: 2, color: marker.color),
            ),
        ],
      ),
    );
  }
}

/// Barras de sinal (Wi-Fi) de 0 a 4.
class DsSignalBars extends StatelessWidget {
  /// Barras acesas (0..4).
  final int bars;

  /// Cria um [DsSignalBars].
  const DsSignalBars({super.key, required this.bars});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final lit = bars <= 1 ? c.alarmHigh : c.textPrimary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < 4; i++) ...[
          Container(
            width: 5,
            height: 6.0 + i * 4,
            decoration: BoxDecoration(
              color: i < bars ? lit : c.surfaceSunken,
              borderRadius: BorderRadius.circular(1.5),
            ),
          ),
          if (i < 3) const SizedBox(width: 2.5),
        ],
      ],
    );
  }
}

/// Barra de proporção (ex.: carga do barramento, heap livre).
class DsMeterBar extends StatelessWidget {
  /// Fração 0..1.
  final double fraction;

  /// Cor da parte preenchida.
  final Color? color;

  /// Cria um [DsMeterBar].
  const DsMeterBar({super.key, required this.fraction, this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: context.radius.pill,
      child: TweenAnimationBuilder<double>(
        tween: Tween(end: fraction.clamp(0.0, 1.0)),
        duration: context.motion.slow,
        curve: context.motion.curve,
        builder: (context, v, _) => LinearProgressIndicator(
          value: v,
          minHeight: 6,
          color: color,
        ),
      ),
    );
  }
}
