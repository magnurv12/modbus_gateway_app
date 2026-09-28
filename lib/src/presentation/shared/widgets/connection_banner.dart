import 'dart:async';

import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../design_system/design_system.dart';
import '../presenters.dart';

/// Faixa global de estado da conexão ao vivo.
///
/// Some quando está tudo online; quando cai, mostra a causa, a contagem
/// regressiva da próxima tentativa e um botão para reconectar já.
class ConnectionBanner extends StatefulWidget {
  /// Status atual.
  final LiveConnectionStatus status;

  /// Causa da desconexão.
  final Failure? failure;

  /// Próxima tentativa automática.
  final DateTime? nextRetryAt;

  /// Reconectar agora.
  final VoidCallback onReconnect;

  /// Cria um [ConnectionBanner].
  const ConnectionBanner({
    super.key,
    required this.status,
    required this.failure,
    required this.nextRetryAt,
    required this.onReconnect,
  });

  @override
  State<ConnectionBanner> createState() => _ConnectionBannerState();
}

class _ConnectionBannerState extends State<ConnectionBanner> {
  Timer? _ticker;

  bool get _visible =>
      widget.status == LiveConnectionStatus.reconnecting ||
      (widget.status == LiveConnectionStatus.online && widget.failure != null);

  @override
  void initState() {
    super.initState();
    _syncTicker();
  }

  @override
  void didUpdateWidget(covariant ConnectionBanner oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncTicker();
  }

  void _syncTicker() {
    final needsTicker = widget.nextRetryAt != null;
    if (needsTicker && _ticker == null) {
      _ticker = Timer.periodic(
        const Duration(seconds: 1),
        (_) => setState(() {}),
      );
    } else if (!needsTicker) {
      _ticker?.cancel();
      _ticker = null;
    }
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final s = context.spacing;
    final failure = widget.failure;
    final retryIn = widget.nextRetryAt?.difference(DateTime.now()).inSeconds;

    return AnimatedSize(
      duration: context.motion.normal,
      curve: context.motion.curve,
      alignment: Alignment.topCenter,
      child: !_visible
          ? const SizedBox(width: double.infinity)
          : Material(
              color: c.badQuality.withValues(alpha: 0.14),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(s.lg, s.sm, s.sm, s.sm),
                  child: Row(
                    children: [
                      Icon(
                        failure?.icon ?? Icons.sync_problem_rounded,
                        size: 20,
                        color: c.badQuality,
                      ),
                      SizedBox(width: s.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              failure?.title ?? 'Reconectando…',
                              style: context.text.labelLarge?.copyWith(
                                color: c.textPrimary,
                              ),
                            ),
                            Text(
                              retryIn != null && retryIn > 0
                                  ? 'Valores congelados · nova tentativa em ${retryIn}s'
                                  : 'Valores congelados · tentando agora…',
                              style: context.text.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: widget.onReconnect,
                        child: const Text('Reconectar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
