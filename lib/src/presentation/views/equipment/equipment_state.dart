import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';

part 'equipment_state.freezed.dart';

/// Estado da tela de equipamento.
@freezed
sealed class EquipmentState extends ViewModelState with _$EquipmentState {
  const EquipmentState._();

  /// Carregando.
  const factory EquipmentState.loading() = EquipmentStateLoading;

  /// Id inexistente no mapa (deep link antigo, mapa alterado).
  const factory EquipmentState.notFound(String equipmentId) =
      EquipmentStateNotFound;

  /// Falha ao carregar a planta.
  const factory EquipmentState.error(Failure failure) = EquipmentStateError;

  /// Equipamento com dados ao vivo.
  const factory EquipmentState.loaded({
    required Equipment equipment,
    required PlantLiveState live,
    required List<Alarm> alarms,

    /// Tags com escrita em andamento (mostram progresso e bloqueiam
    /// comandos repetidos).
    @Default(<String>{}) Set<String> pendingWrites,

    /// Tag exibida no gráfico de tendência.
    String? trendTagId,
  }) = EquipmentStateLoaded;
}

/// Efeitos de uso único da tela de equipamento.
sealed class EquipmentEffect {
  const EquipmentEffect();
}

/// Escrita confirmada pelo escravo.
class WriteConfirmed extends EquipmentEffect {
  /// Mensagem para o operador.
  final String message;

  /// Cria um [WriteConfirmed].
  const WriteConfirmed(this.message);
}

/// Escrita falhou.
class WriteFailed extends EquipmentEffect {
  /// Causa.
  final Failure failure;

  /// Repetir a mesma escrita.
  final void Function() retry;

  /// Cria um [WriteFailed].
  const WriteFailed(this.failure, this.retry);
}
