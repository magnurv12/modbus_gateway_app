import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';

part 'alarms_state.freezed.dart';

/// Filtro da lista de alarmes.
enum AlarmFilter {
  /// Todos.
  all,

  /// Condição ainda presente.
  active,

  /// Aguardando reconhecimento.
  unacknowledged,
}

/// Estado da tela de alarmes.
@freezed
sealed class AlarmsState extends ViewModelState with _$AlarmsState {
  const AlarmsState._();

  /// Carregando.
  const factory AlarmsState.loading() = AlarmsStateLoading;

  /// Falha ao carregar a planta.
  const factory AlarmsState.error(Failure failure) = AlarmsStateError;

  /// Lista carregada.
  const factory AlarmsState.loaded({
    required List<Alarm> all,
    @Default(AlarmFilter.all) AlarmFilter filter,
  }) = AlarmsStateLoaded;
}

/// Derivações da lista para a view.
extension AlarmsStateLoadedX on AlarmsStateLoaded {
  /// Alarmes após o filtro.
  List<Alarm> get visible => switch (filter) {
    AlarmFilter.all => all,
    AlarmFilter.active => all.where((a) => a.active).toList(),
    AlarmFilter.unacknowledged => all.where((a) => !a.acknowledged).toList(),
  };

  /// Quantidade ativa por severidade.
  Map<AlarmSeverity, int> get activeBySeverity => {
    for (final severity in AlarmSeverity.values)
      severity: all.where((a) => a.active && a.severity == severity).length,
  };

  /// Quantidade não reconhecida.
  int get unacknowledgedCount => all.where((a) => !a.acknowledged).length;
}
