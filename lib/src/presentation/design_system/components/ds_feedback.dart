import 'package:flutter/material.dart';

import '../theme/ds_context.dart';

/// Placeholder "esqueleto" com brilho, para carregamentos curtos.
class DsSkeleton extends StatefulWidget {
  /// Altura.
  final double height;

  /// Largura (`null` = expande).
  final double? width;

  /// Cria um [DsSkeleton].
  const DsSkeleton({super.key, this.height = 16, this.width});

  @override
  State<DsSkeleton> createState() => _DsSkeletonState();
}

class _DsSkeletonState extends State<DsSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Color.lerp(
            c.surfaceSunken,
            c.surfaceRaised,
            _controller.value,
          ),
          borderRadius: context.radius.sm,
        ),
      ),
    );
  }
}

/// Lista de cards-esqueleto para estados de carregamento de tela.
class DsLoadingView extends StatelessWidget {
  /// Quantidade de cards.
  final int cards;

  /// Cria um [DsLoadingView].
  const DsLoadingView({super.key, this.cards = 3});

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(s.page),
      itemCount: cards,
      separatorBuilder: (_, _) => SizedBox(height: s.md),
      itemBuilder: (context, _) => Container(
        padding: EdgeInsets.all(s.lg),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: context.radius.lg,
          border: Border.all(color: context.colors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DsSkeleton(width: 120, height: 12),
            SizedBox(height: s.md),
            const DsSkeleton(width: 180, height: 28),
            SizedBox(height: s.md),
            const DsSkeleton(height: 28),
          ],
        ),
      ),
    );
  }
}

/// Mensagem centralizada com ícone, título, texto e ação opcional.
///
/// Base para estados vazios e de erro.
class DsMessageView extends StatelessWidget {
  /// Ícone.
  final IconData icon;

  /// Título.
  final String title;

  /// Texto explicativo.
  final String message;

  /// Dica técnica/ação sugerida (em destaque sutil).
  final String? hint;

  /// Tom do ícone.
  final DsTone tone;

  /// Rótulo da ação.
  final String? actionLabel;

  /// Ação.
  final VoidCallback? onAction;

  /// Cria um [DsMessageView].
  const DsMessageView({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.hint,
    this.tone = DsTone.neutral,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    final color = tone.color(context.colors);
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(s.xxl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(s.lg),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withValues(alpha: 0.12),
                ),
                child: Icon(icon, size: 36, color: color),
              ),
              SizedBox(height: s.xl),
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.text.titleLarge,
              ),
              SizedBox(height: s.sm),
              Text(
                message,
                textAlign: TextAlign.center,
                style: context.text.bodyMedium,
              ),
              if (hint != null) ...[
                SizedBox(height: s.lg),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(s.md),
                  decoration: BoxDecoration(
                    color: context.colors.surfaceSunken,
                    borderRadius: context.radius.md,
                  ),
                  child: Text(
                    hint!,
                    style: context.ds.mono.copyWith(
                      fontSize: 12,
                      color: context.colors.textSecondary,
                    ),
                  ),
                ),
              ],
              if (onAction != null && actionLabel != null) ...[
                SizedBox(height: s.xl),
                FilledButton.icon(
                  onPressed: onAction,
                  icon: const Icon(Icons.refresh_rounded),
                  label: Text(actionLabel!),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Diálogo de confirmação para comandos que afetam o processo.
///
/// Em supervisório, todo comando que liga/desliga equipamento pede
/// confirmação explícita com o que vai acontecer.
Future<bool> showDsConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmLabel,
  DsTone tone = DsTone.accent,
  IconData icon = Icons.bolt_rounded,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) {
      final color = tone.color(context.colors);
      return AlertDialog(
        icon: Icon(icon, color: color, size: 32),
        title: Text(title, textAlign: TextAlign.center),
        content: Text(message, textAlign: TextAlign.center),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: color),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmLabel),
          ),
        ],
      );
    },
  );
  return result ?? false;
}

/// Snackbars padronizados.
extension DsSnackBar on BuildContext {
  /// Mostra um snackbar com ícone e tom semântico.
  void showDsSnackBar(
    String message, {
    DsTone tone = DsTone.neutral,
    IconData? icon,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final color = tone.color(colors);
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(icon ?? Icons.info_outline_rounded, color: color, size: 20),
              SizedBox(width: spacing.md),
              Expanded(child: Text(message)),
            ],
          ),
          action: actionLabel == null
              ? null
              : SnackBarAction(
                  label: actionLabel,
                  onPressed: onAction ?? () {},
                ),
        ),
      );
  }
}
