import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';

part 'shell_state.freezed.dart';

/// Estado da moldura do app (navegação + conexão + alarmes).
@freezed
sealed class ShellState extends ViewModelState with _$ShellState {
  const ShellState._();

  /// Carregando o mapa da planta.
  const factory ShellState.loading() = ShellStateLoading;

  /// Mapa da planta inválido — nada funciona sem ele.
  const factory ShellState.error(Failure failure) = ShellStateError;

  /// Pronto.
  const factory ShellState.ready({
    required LiveConnectionStatus status,
    Failure? connectionFailure,
    DateTime? nextRetryAt,

    /// Alarmes que exigem atenção (ativos ou não reconhecidos).
    @Default(0) int pendingAlarms,

    /// Maior severidade entre os não reconhecidos (cor do badge).
    AlarmSeverity? topSeverity,
  }) = ShellStateReady;
}
