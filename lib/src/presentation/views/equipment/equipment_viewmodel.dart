import 'dart:async';

import 'package:either_dart/either.dart';

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';
import '../../shared/formatters.dart';
import 'equipment_state.dart';

/// View model do detalhe de equipamento: leituras ao vivo, comandos e
/// setpoints.
class EquipmentViewModel extends ViewModel<EquipmentState>
    with ViewModelEffects<EquipmentState, EquipmentEffect> {
  /// Id do equipamento exibido.
  final String equipmentId;

  final IGetPlantUseCase _getPlant;
  final IWatchPlantLiveUseCase _watchLive;
  final IWatchAlarmsUseCase _watchAlarms;
  final IWriteTagUseCase _writeTag;
  final IPulseTagUseCase _pulseTag;
  final IAcknowledgeAlarmUseCase _acknowledge;

  StreamSubscription<PlantLiveState>? _liveSub;
  StreamSubscription<List<Alarm>>? _alarmSub;

  /// Cria um [EquipmentViewModel].
  EquipmentViewModel(
    this.equipmentId,
    this._getPlant,
    this._watchLive,
    this._watchAlarms,
    this._writeTag,
    this._pulseTag,
    this._acknowledge,
  ) : super(const EquipmentState.loading());

  @override
  void initViewModel() {
    super.initViewModel();
    unawaited(load());
  }

  /// Carrega o equipamento e assina os dados ao vivo.
  Future<void> load() async {
    emit(const EquipmentState.loading());
    final result = await _getPlant();
    if (result.isLeft) {
      emit(EquipmentState.error(result.left));
      return;
    }
    final plant = result.right;
    final equipment = plant.equipmentById(equipmentId);
    if (equipment == null) {
      emit(EquipmentState.notFound(equipmentId));
      return;
    }

    final firstTrend = equipment.tags
        .where((t) => !t.isBoolean && t.role == TagRole.measurement)
        .firstOrNull;
    emit(EquipmentState.loaded(
      equipment: equipment,
      live: PlantLiveState.initial,
      alarms: const [],
      trendTagId: firstTrend?.id,
    ));

    await _liveSub?.cancel();
    await _alarmSub?.cancel();
    _liveSub = _watchLive(plant).listen((live) {
      _update((s) => s.copyWith(live: live));
    });
    _alarmSub = _watchAlarms(plant).listen((alarms) {
      _update((s) => s.copyWith(
            alarms: alarms.where((a) => a.equipmentId == equipment.id).toList(),
          ));
    });
  }

  /// Troca a tag do gráfico de tendência.
  void selectTrend(String tagId) => _update((s) => s.copyWith(trendTagId: tagId));

  /// Liga/desliga uma coil.
  Future<void> setCommand(TagDefinition tag, bool on) => _runWrite(
        tag,
        () => _writeTag(tag, TagValue.boolean(on)),
        success: '${tag.name}: ${on ? tag.onLabel : tag.offLabel}',
        retry: () => setCommand(tag, on),
      );

  /// Pulso em coil momentânea.
  Future<void> pulse(TagDefinition tag) => _runWrite(
        tag,
        () => _pulseTag(tag),
        success: '${tag.name} enviado',
        retry: () => pulse(tag),
      );

  /// Escreve um setpoint em unidade de engenharia.
  Future<void> writeSetpoint(TagDefinition tag, double value) => _runWrite(
        tag,
        () => _writeTag(tag, TagValue.number(value)),
        success: '${tag.name}: '
            '${Formatters.withUnit(value, tag.unit, decimals: tag.decimals)}',
        retry: () => writeSetpoint(tag, value),
      );

  /// Reconhece um alarme do equipamento.
  void acknowledge(String alarmId) => _acknowledge(alarmId: alarmId);

  Future<void> _runWrite(
    TagDefinition tag,
    Future<Either<Failure, ModbusBlock>> Function() write, {
    required String success,
    required void Function() retry,
  }) async {
    final current = state;
    if (current is! EquipmentStateLoaded ||
        current.pendingWrites.contains(tag.id)) {
      return; // evita duplo toque enviando o comando duas vezes
    }
    _update((s) => s.copyWith(pendingWrites: {...s.pendingWrites, tag.id}));

    final result = await write();

    _update((s) => s.copyWith(
          pendingWrites: {...s.pendingWrites}..remove(tag.id),
        ));
    result.fold(
      (failure) => emitEffect(WriteFailed(failure, retry)),
      (_) => emitEffect(WriteConfirmed(success)),
    );
  }

  void _update(EquipmentStateLoaded Function(EquipmentStateLoaded) change) {
    final current = state;
    if (current is EquipmentStateLoaded) emit(change(current));
  }

  @override
  Future<void> close() async {
    await _liveSub?.cancel();
    await _alarmSub?.cancel();
    return super.close();
  }
}
