import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';

part 'dashboard_state.freezed.dart';

/// Condição geral de um equipamento no painel.
enum EquipmentCondition {
  /// Tudo normal.
  normal,

  /// Há alarme ativo ou não reconhecido.
  alarm,

  /// Alguma tag sem comunicação/qualidade ruim.
  communication,

  /// Ainda sem leituras.
  waiting,
}

/// Resumo de um equipamento já pronto para exibição.
@freezed
abstract class EquipmentSummary with _$EquipmentSummary {
  /// Cria um [EquipmentSummary].
  const factory EquipmentSummary({
    required Equipment equipment,
    required EquipmentCondition condition,

    /// Pior severidade pendente, se houver.
    AlarmSeverity? worstAlarm,
    @Default(0) int pendingAlarms,

    /// Tag que representa o estado do equipamento (ex.: "Em operação").
    TagDefinition? stateTag,
  }) = _EquipmentSummary;
}

/// Estado da tela Planta.
@freezed
sealed class DashboardState extends ViewModelState with _$DashboardState {
  const DashboardState._();

  /// Carregando.
  const factory DashboardState.loading() = DashboardStateLoading;

  /// Falha ao carregar a planta.
  const factory DashboardState.error(Failure failure) = DashboardStateError;

  /// Planta com dados ao vivo.
  const factory DashboardState.loaded({
    required Plant plant,
    required PlantLiveState live,
    required List<EquipmentSummary> equipments,
    required List<Alarm> alarms,
  }) = DashboardStateLoaded;
}
