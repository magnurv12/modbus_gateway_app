import 'dart:async';

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';
import '../../shared/presenters.dart';
import 'dashboard_state.dart';

/// View model da tela Planta.
class DashboardViewModel extends ViewModel<DashboardState> {
  final IGetPlantUseCase _getPlant;
  final IWatchPlantLiveUseCase _watchLive;
  final IWatchAlarmsUseCase _watchAlarms;

  StreamSubscription<PlantLiveState>? _liveSub;
  StreamSubscription<List<Alarm>>? _alarmSub;
  Plant? _plant;
  PlantLiveState _live = PlantLiveState.initial;
  List<Alarm> _alarms = const [];

  /// Cria um [DashboardViewModel].
  DashboardViewModel(this._getPlant, this._watchLive, this._watchAlarms)
      : super(const DashboardState.loading());

  @override
  void initViewModel() {
    super.initViewModel();
    unawaited(load());
  }

  /// Carrega a planta e assina dados ao vivo e alarmes.
  Future<void> load() async {
    emit(const DashboardState.loading());
    final result = await _getPlant();
    if (result.isLeft) {
      emit(DashboardState.error(result.left));
      return;
    }
    final plant = result.right;
    _plant = plant;
    await _liveSub?.cancel();
    await _alarmSub?.cancel();
    _liveSub = _watchLive(plant).listen((live) {
      _live = live;
      _publish();
    });
    _alarmSub = _watchAlarms(plant).listen((alarms) {
      _alarms = alarms;
      _publish();
    });
  }

  void _publish() {
    final plant = _plant;
    if (plant == null) return;
    emit(DashboardState.loaded(
      plant: plant,
      live: _live,
      alarms: _alarms,
      equipments: [
        for (final equipment in plant.equipments) summarize(equipment),
      ],
    ));
  }

  /// Regras de apresentação do card de um equipamento.
  EquipmentSummary summarize(Equipment equipment) {
    final pending = _alarms
        .where((a) => a.equipmentId == equipment.id && a.needsAttention)
        .toList();
    final worst = pending.isEmpty
        ? null
        : pending
            .map((a) => a.severity)
            .reduce((a, b) => a.priority <= b.priority ? a : b);

    final readings = [for (final t in equipment.tags) _live.reading(t.id)];
    final EquipmentCondition condition;
    if (pending.isNotEmpty) {
      condition = EquipmentCondition.alarm;
    } else if (readings.every((r) => r == null)) {
      condition = EquipmentCondition.waiting;
    } else if (readings.any((r) => r == null || r.quality != TagQuality.good)) {
      condition = EquipmentCondition.communication;
    } else {
      condition = EquipmentCondition.normal;
    }

    return EquipmentSummary(
      equipment: equipment,
      condition: condition,
      worstAlarm: worst,
      pendingAlarms: pending.length,
      stateTag: equipment.stateTag,
    );
  }

  @override
  Future<void> close() async {
    await _liveSub?.cancel();
    await _alarmSub?.cancel();
    return super.close();
  }
}
