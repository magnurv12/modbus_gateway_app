import 'dart:async';

import 'package:flutter/widgets.dart' show AppLifecycleState;

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';
import 'shell_state.dart';

/// View model da moldura: carrega a planta, mantém o streaming vivo e
/// resume conexão/alarmes para a navegação.
class ShellViewModel extends ViewModel<ShellState> {
  final IGetPlantUseCase _getPlant;
  final IWatchPlantLiveUseCase _watchLive;
  final IWatchAlarmsUseCase _watchAlarms;
  final ISetLiveStreamActiveUseCase _setActive;
  final IReconnectLiveStreamUseCase _reconnect;

  StreamSubscription<PlantLiveState>? _liveSub;
  StreamSubscription<List<Alarm>>? _alarmSub;

  /// Cria um [ShellViewModel].
  ShellViewModel(
    this._getPlant,
    this._watchLive,
    this._watchAlarms,
    this._setActive,
    this._reconnect,
  ) : super(const ShellState.loading());

  @override
  void initViewModel() {
    super.initViewModel();
    unawaited(load());
  }

  /// Carrega a planta e começa a acompanhar conexão e alarmes.
  Future<void> load() async {
    emit(const ShellState.loading());
    final result = await _getPlant();
    result.fold(
      (failure) => emit(ShellState.error(failure)),
      (plant) {
        emit(const ShellState.ready(status: LiveConnectionStatus.connecting));
        unawaited(_liveSub?.cancel());
        unawaited(_alarmSub?.cancel());
        _liveSub = _watchLive(plant).listen(_onLive);
        _alarmSub = _watchAlarms(plant).listen(_onAlarms);
      },
    );
  }

  /// Pausa o streaming em segundo plano: libera uma das 4 vagas de cliente
  /// do gateway e poupa bateria.
  void onLifecycleChanged(AppLifecycleState lifecycle) {
    switch (lifecycle) {
      case AppLifecycleState.resumed:
        _setActive(active: true);
      case AppLifecycleState.paused || AppLifecycleState.hidden:
        _setActive(active: false);
      case AppLifecycleState.inactive || AppLifecycleState.detached:
        break;
    }
  }

  /// Reconectar agora.
  void reconnect() => _reconnect();

  void _onLive(PlantLiveState live) {
    final current = state;
    if (current is! ShellStateReady) return;
    if (current.status == live.status &&
        current.connectionFailure == live.connectionFailure &&
        current.nextRetryAt == live.nextRetryAt) {
      return; // ignora atualizações de valores: o shell não mostra valores
    }
    emit(current.copyWith(
      status: live.status,
      connectionFailure: live.connectionFailure,
      nextRetryAt: live.nextRetryAt,
    ));
  }

  void _onAlarms(List<Alarm> alarms) {
    final current = state;
    if (current is! ShellStateReady) return;
    final pending = alarms.where((a) => !a.acknowledged).toList();
    emit(current.copyWith(
      pendingAlarms: pending.length,
      topSeverity: pending.isEmpty
          ? null
          : pending
              .map((a) => a.severity)
              .reduce((a, b) => a.priority <= b.priority ? a : b),
    ));
  }

  @override
  Future<void> close() async {
    await _liveSub?.cancel();
    await _alarmSub?.cancel();
    return super.close();
  }
}
