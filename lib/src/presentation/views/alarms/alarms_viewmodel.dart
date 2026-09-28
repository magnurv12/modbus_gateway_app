import 'dart:async';

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';
import 'alarms_state.dart';

/// View model da lista de alarmes.
class AlarmsViewModel extends ViewModel<AlarmsState> {
  final IGetPlantUseCase _getPlant;
  final IWatchAlarmsUseCase _watchAlarms;
  final IAcknowledgeAlarmUseCase _acknowledge;

  StreamSubscription<List<Alarm>>? _subscription;

  /// Cria um [AlarmsViewModel].
  AlarmsViewModel(this._getPlant, this._watchAlarms, this._acknowledge)
      : super(const AlarmsState.loading());

  @override
  void initViewModel() {
    super.initViewModel();
    unawaited(load());
  }

  /// Carrega e acompanha os alarmes.
  Future<void> load() async {
    emit(const AlarmsState.loading());
    final result = await _getPlant();
    if (result.isLeft) {
      emit(AlarmsState.error(result.left));
      return;
    }
    await _subscription?.cancel();
    _subscription = _watchAlarms(result.right).listen((alarms) {
      final current = state;
      emit(current is AlarmsStateLoaded
          ? current.copyWith(all: alarms)
          : AlarmsState.loaded(all: alarms));
    });
  }

  /// Troca o filtro.
  void setFilter(AlarmFilter filter) {
    final current = state;
    if (current is AlarmsStateLoaded) emit(current.copyWith(filter: filter));
  }

  /// Reconhece um alarme.
  void acknowledge(String alarmId) => _acknowledge(alarmId: alarmId);

  /// Reconhece todos.
  void acknowledgeAll() => _acknowledge();

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
