import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../design_system/design_system.dart';

/// Indicador compacto de "ao vivo" para cabeçalhos.
class LiveIndicator extends StatelessWidget {
  /// Status da conexão.
  final LiveConnectionStatus status;

  /// Cria um [LiveIndicator].
  const LiveIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final (label, color, pulsing) = switch (status) {
      LiveConnectionStatus.online => ('Ao vivo', c.success, true),
      LiveConnectionStatus.connecting => ('Conectando', c.textMuted, false),
      LiveConnectionStatus.reconnecting => ('Sem conexão', c.badQuality, false),
      LiveConnectionStatus.paused => ('Pausado', c.textMuted, false),
    };
    return Container(
      padding: EdgeInsets.only(
        left: context.spacing.xs,
        right: context.spacing.md,
      ),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: context.radius.pill,
        border: Border.all(color: c.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DsStatusDot(color: color, pulsing: pulsing),
          Text(
            label,
            style: context.text.labelMedium?.copyWith(color: c.textSecondary),
          ),
        ],
      ),
    );
  }
}
