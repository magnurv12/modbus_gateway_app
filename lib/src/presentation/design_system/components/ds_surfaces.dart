import 'package:flutter/material.dart';

import '../theme/ds_context.dart';

/// Card base do design system.
///
/// [accentColor] desenha uma borda de estado (ex.: alarme ativo) — é a
/// única forma de um card "chamar atenção", mantendo o resto neutro.
class DsCard extends StatelessWidget {
  /// Conteúdo.
  final Widget child;

  /// Toque no card (mostra ripple quando definido).
  final VoidCallback? onTap;

  /// Espaçamento interno; padrão `spacing.lg`.
  final EdgeInsetsGeometry? padding;

  /// Cor de borda de estado.
  final Color? accentColor;

  /// Cor de fundo alternativa.
  final Color? color;

  /// Cria um [DsCard].
  const DsCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.accentColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = context.radius.lg;
    return AnimatedContainer(
      duration: context.motion.normal,
      decoration: BoxDecoration(
        color: color ?? colors.surface,
        borderRadius: radius,
        border: Border.all(
          color: accentColor ?? colors.border,
          width: accentColor == null ? 1 : 1.5,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: Padding(
            padding: padding ?? EdgeInsets.all(context.spacing.lg),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Cabeçalho de seção: overline + título opcional + ação à direita.
class DsSectionHeader extends StatelessWidget {
  /// Texto da seção.
  final String title;

  /// Complemento à direita do título (ex.: contagem).
  final String? caption;

  /// Ação à direita.
  final Widget? trailing;

  /// Cria um [DsSectionHeader].
  const DsSectionHeader(this.title, {super.key, this.caption, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.spacing.xl,
        bottom: context.spacing.sm,
      ),
      child: Row(
        children: [
          Text(title.toUpperCase(), style: context.ds.overline),
          if (caption != null) ...[
            SizedBox(width: context.spacing.sm),
            Text(caption!, style: context.ds.overline.copyWith(
              color: context.colors.textSecondary,
            )),
          ],
          const Spacer(),
          ?trailing,
        ],
      ),
    );
  }
}

/// Badge/pílula de status com tom semântico.
class DsBadge extends StatelessWidget {
  /// Texto.
  final String label;

  /// Tom.
  final DsTone tone;

  /// Ícone opcional à esquerda.
  final IconData? icon;

  /// Fundo sólido (para severidades críticas) em vez de contorno.
  final bool filled;

  /// Cria um [DsBadge].
  const DsBadge({
    super.key,
    required this.label,
    this.tone = DsTone.neutral,
    this.icon,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = tone.color(context.colors);
    final foreground = filled ? context.colors.background : color;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.sm,
        vertical: context.spacing.xxs + 1,
      ),
      decoration: BoxDecoration(
        color: filled ? color : color.withValues(alpha: 0.12),
        borderRadius: context.radius.pill,
        border: Border.all(color: color.withValues(alpha: filled ? 1 : 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 13, color: foreground),
            SizedBox(width: context.spacing.xs),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
              color: foreground,
            ),
          ),
        ],
      ),
    );
  }
}

/// Ponto de status com pulso opcional (ex.: conexão ao vivo).
class DsStatusDot extends StatefulWidget {
  /// Cor do ponto.
  final Color color;

  /// Anima um halo pulsante.
  final bool pulsing;

  /// Diâmetro.
  final double size;

  /// Cria um [DsStatusDot].
  const DsStatusDot({
    super.key,
    required this.color,
    this.pulsing = false,
    this.size = 8,
  });

  @override
  State<DsStatusDot> createState() => _DsStatusDotState();
}

class _DsStatusDotState extends State<DsStatusDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  );

  @override
  void initState() {
    super.initState();
    if (widget.pulsing) _controller.repeat();
  }

  @override
  void didUpdateWidget(covariant DsStatusDot oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pulsing && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.pulsing && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    return SizedBox.square(
      dimension: size * 2.2,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value;
          return Stack(
            alignment: Alignment.center,
            children: [
              if (widget.pulsing)
                Container(
                  width: size + size * 1.2 * t,
                  height: size + size * 1.2 * t,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.color.withValues(alpha: 0.35 * (1 - t)),
                  ),
                ),
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.color,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
