import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../design_system/design_system.dart';
import '../presenters.dart';

/// Estado de erro de tela a partir de uma [Failure].
class FailureView extends StatelessWidget {
  /// Falha a exibir.
  final Failure failure;

  /// Tentar novamente (omitido quando não faz sentido repetir).
  final VoidCallback? onRetry;

  /// Cria um [FailureView].
  const FailureView({super.key, required this.failure, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return DsMessageView(
      icon: failure.icon,
      tone: failure.tone,
      title: failure.title,
      message: failure.message,
      hint: failure.technicalHint,
      actionLabel: onRetry == null ? null : 'Tentar novamente',
      onAction: onRetry,
    );
  }
}

/// Snackbar de falha padronizado.
extension FailureSnackBar on BuildContext {
  /// Mostra [failure] num snackbar.
  void showFailure(Failure failure, {VoidCallback? onRetry}) {
    showDsSnackBar(
      '${failure.title}. ${failure.message}',
      tone: failure.tone,
      icon: failure.icon,
      actionLabel: onRetry == null ? null : 'Repetir',
      onAction: onRetry,
    );
  }
}
