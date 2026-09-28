import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/ds_context.dart';

/// Minigráfico de tendência para cards.
class DsSparkline extends StatelessWidget {
  /// Valores em ordem cronológica.
  final List<double> values;

  /// Cor do traço (padrão: `colors.trendLine`).
  final Color? color;

  /// Altura.
  final double height;

  /// Cria um [DsSparkline].
  const DsSparkline({
    super.key,
    required this.values,
    this.color,
    this.height = 28,
  });

  @override
  Widget build(BuildContext context) {
    final lineColor = color ?? context.colors.trendLine;
    return SizedBox(
      height: height,
      width: double.infinity,
      child: RepaintBoundary(
        child: CustomPaint(
          painter: _SparklinePainter(values: values, color: lineColor),
        ),
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> values;
  final Color color;

  _SparklinePainter({required this.values, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (values.length < 2) return;
    final (minV, maxV) = _range(values);
    final span = maxV - minV;
    final path = Path();
    for (var i = 0; i < values.length; i++) {
      final x = size.width * i / (values.length - 1);
      final norm = span == 0 ? 0.5 : (values[i] - minV) / span;
      final y = size.height - norm * (size.height - 2) - 1;
      i == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
    }

    final fill = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.22), color.withValues(alpha: 0)],
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6
        ..strokeJoin = StrokeJoin.round
        ..isAntiAlias = true,
    );
  }

  @override
  bool shouldRepaint(_SparklinePainter old) =>
      !identical(old.values, values) || old.color != color;
}

/// Linha de referência horizontal num [DsTrendChart] (limite de alarme,
/// setpoint...).
class DsChartLimit {
  /// Valor no eixo Y.
  final double value;

  /// Cor.
  final Color color;

  /// Rótulo curto.
  final String label;

  /// Cria um [DsChartLimit].
  const DsChartLimit(this.value, this.color, this.label);
}

/// Gráfico de tendência com grade, eixo Y e linhas de limite.
class DsTrendChart extends StatelessWidget {
  /// Valores em ordem cronológica (amostragem fixa).
  final List<double> values;

  /// Faixa fixa do eixo Y; `null` = automática.
  final double? minY;

  /// Faixa fixa do eixo Y; `null` = automática.
  final double? maxY;

  /// Linhas de referência.
  final List<DsChartLimit> limits;

  /// Formata os rótulos do eixo Y.
  final String Function(double value) formatY;

  /// Legenda do eixo X (ex.: "últimos 5 min").
  final String caption;

  /// Altura.
  final double height;

  /// Degrau (valores digitais) em vez de linha.
  final bool stepped;

  /// Cria um [DsTrendChart].
  const DsTrendChart({
    super.key,
    required this.values,
    required this.formatY,
    this.minY,
    this.maxY,
    this.limits = const [],
    this.caption = '',
    this.height = 150,
    this.stepped = false,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: height,
          child: values.length < 2
              ? Center(
                  child: Text(
                    'Coletando amostras…',
                    style: context.text.bodySmall,
                  ),
                )
              : RepaintBoundary(
                  child: CustomPaint(
                    painter: _TrendPainter(
                      values: values,
                      minY: minY,
                      maxY: maxY,
                      limits: limits,
                      formatY: formatY,
                      stepped: stepped,
                      line: c.trendLine,
                      grid: c.border,
                      label: context.ds.mono.copyWith(
                        fontSize: 10,
                        color: c.textMuted,
                      ),
                    ),
                  ),
                ),
        ),
        if (caption.isNotEmpty) ...[
          SizedBox(height: context.spacing.xs),
          Text(
            caption,
            style: context.text.bodySmall,
            textAlign: TextAlign.end,
          ),
        ],
      ],
    );
  }
}

class _TrendPainter extends CustomPainter {
  final List<double> values;
  final double? minY;
  final double? maxY;
  final List<DsChartLimit> limits;
  final String Function(double) formatY;
  final bool stepped;
  final Color line;
  final Color grid;
  final TextStyle label;

  _TrendPainter({
    required this.values,
    required this.minY,
    required this.maxY,
    required this.limits,
    required this.formatY,
    required this.stepped,
    required this.line,
    required this.grid,
    required this.label,
  });

  static const double _axisWidth = 44;

  @override
  void paint(Canvas canvas, Size size) {
    var (lo, hi) = _range(values);
    for (final limit in limits) {
      lo = math.min(lo, limit.value);
      hi = math.max(hi, limit.value);
    }
    lo = minY ?? lo;
    hi = maxY ?? hi;
    if (hi - lo < 1e-9) {
      lo -= 1;
      hi += 1;
    } else if (minY == null || maxY == null) {
      final pad = (hi - lo) * 0.1;
      if (minY == null) lo -= pad;
      if (maxY == null) hi += pad;
    }

    final plot = Rect.fromLTWH(
      _axisWidth,
      4,
      size.width - _axisWidth,
      size.height - 8,
    );
    double yOf(double v) => plot.bottom - (v - lo) / (hi - lo) * plot.height;

    // Grade + eixo Y.
    final gridPaint = Paint()
      ..color = grid
      ..strokeWidth = 1;
    for (var i = 0; i <= 3; i++) {
      final v = lo + (hi - lo) * i / 3;
      final y = yOf(v);
      canvas.drawLine(Offset(plot.left, y), Offset(plot.right, y), gridPaint);
      _text(canvas, formatY(v), Offset(0, y - 6), _axisWidth - 6);
    }

    // Limites.
    for (final limit in limits) {
      final y = yOf(limit.value);
      final paint = Paint()
        ..color = limit.color.withValues(alpha: 0.8)
        ..strokeWidth = 1.2;
      for (var x = plot.left; x < plot.right; x += 8) {
        canvas.drawLine(
          Offset(x, y),
          Offset(math.min(x + 4, plot.right), y),
          paint,
        );
      }
      _text(
        canvas,
        limit.label,
        Offset(plot.right - 40, y - 13),
        40,
        color: limit.color,
      );
    }

    // Série.
    final path = Path();
    for (var i = 0; i < values.length; i++) {
      final x = plot.left + plot.width * i / (values.length - 1);
      final y = yOf(values[i].clamp(lo, hi));
      if (i == 0) {
        path.moveTo(x, y);
      } else if (stepped) {
        final prevY = yOf(values[i - 1].clamp(lo, hi));
        path
          ..lineTo(x, prevY)
          ..lineTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    final fill = Path.from(path)
      ..lineTo(plot.right, plot.bottom)
      ..lineTo(plot.left, plot.bottom)
      ..close();
    canvas.save();
    canvas.clipRect(plot);
    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [line.withValues(alpha: 0.18), line.withValues(alpha: 0)],
        ).createShader(plot),
    );
    canvas.drawPath(
      path,
      Paint()
        ..color = line
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeJoin = StrokeJoin.round,
    );
    canvas.restore();

    // Último ponto.
    final last = Offset(plot.right, yOf(values.last.clamp(lo, hi)));
    canvas.drawCircle(last, 3.5, Paint()..color = line);
  }

  void _text(
    Canvas canvas,
    String text,
    Offset at,
    double width, {
    Color? color,
  }) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: color == null ? label : label.copyWith(color: color),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.right,
      maxLines: 1,
      ellipsis: '…',
    )..layout(minWidth: width, maxWidth: width);
    painter.paint(canvas, at);
  }

  @override
  bool shouldRepaint(_TrendPainter old) =>
      !identical(old.values, values) ||
      old.line != line ||
      old.limits.length != limits.length;
}

(double, double) _range(List<double> values) {
  var lo = values.first;
  var hi = values.first;
  for (final v in values) {
    if (v < lo) lo = v;
    if (v > hi) hi = v;
  }
  return (lo, hi);
}
