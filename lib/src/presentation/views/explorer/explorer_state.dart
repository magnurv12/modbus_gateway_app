import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';

part 'explorer_state.freezed.dart';

/// Situação da última operação.
enum ExplorerStatus {
  /// Nenhuma leitura feita ainda.
  idle,

  /// Leitura em andamento.
  loading,

  /// Última leitura OK.
  success,

  /// Última leitura falhou.
  failure,
}

/// Registro de uma transação no log do explorador.
@freezed
abstract class ExplorerLogEntry with _$ExplorerLogEntry {
  /// Cria um [ExplorerLogEntry].
  const factory ExplorerLogEntry({
    required DateTime at,
    required String operation,
    required bool ok,
    required Duration latency,
    String? detail,
  }) = _ExplorerLogEntry;
}

/// Estado do explorador Modbus.
///
/// Diferente das outras telas, não é uma união selada: o formulário
/// (tabela/escravo/faixa) e o último resultado precisam sobreviver a cada
/// mudança de status, então o status é um campo.
@freezed
abstract class ExplorerState extends ViewModelState with _$ExplorerState {
  const ExplorerState._();

  /// Cria um [ExplorerState].
  const factory ExplorerState({
    @Default(ModbusTable.holding) ModbusTable table,
    required int slave,
    @Default(0) int start,
    @Default(10) int count,
    @Default(ExplorerStatus.idle) ExplorerStatus status,
    ModbusBlock? block,
    Failure? failure,
    Duration? latency,

    /// Endereço com escrita em andamento.
    int? writingAddress,

    /// Leitura contínua ligada.
    @Default(false) bool autoRefresh,
    @Default(<ExplorerLogEntry>[]) List<ExplorerLogEntry> log,
  }) = _ExplorerState;

  /// Leitura em andamento.
  bool get isBusy => status == ExplorerStatus.loading;
}

/// Efeitos do explorador.
sealed class ExplorerEffect {
  const ExplorerEffect();
}

/// Escrita confirmada.
class ExplorerWriteConfirmed extends ExplorerEffect {
  /// Mensagem.
  final String message;

  /// Cria um [ExplorerWriteConfirmed].
  const ExplorerWriteConfirmed(this.message);
}

/// Escrita falhou.
class ExplorerWriteFailed extends ExplorerEffect {
  /// Causa.
  final Failure failure;

  /// Cria um [ExplorerWriteFailed].
  const ExplorerWriteFailed(this.failure);
}
