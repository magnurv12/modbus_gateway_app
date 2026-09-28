import 'dart:async';

import 'package:collection/collection.dart';

import '../../domain/domain.dart';

/// Implementação em memória de [IAlarmRepository].
///
/// Observa o estado ao vivo e delega as regras ao [AlarmTracker] (domínio);
/// aqui fica só a orquestração da stream e o estado compartilhado de
/// reconhecimento.
class AlarmRepositoryImpl implements IAlarmRepository {
  final ILiveDataRepository _live;
  final AlarmTracker _tracker;
  final DateTime Function() _now;

  final StreamController<List<Alarm>> _alarms =
      StreamController<List<Alarm>>.broadcast();
  StreamSubscription<PlantLiveState>? _subscription;
  List<Alarm> _current = const [];

  static const _equality = ListEquality<Alarm>();

  /// Cria um [AlarmRepositoryImpl].
  AlarmRepositoryImpl(this._live, this._tracker, {DateTime Function()? now})
      : _now = now ?? DateTime.now;

  @override
  Stream<List<Alarm>> watch(Plant plant) async* {
    _subscription ??= _live.watch(plant).listen(
          (state) => _publish(_tracker.update(plant, state, _now())),
        );
    yield _current;
    yield* _alarms.stream;
  }

  @override
  void acknowledge(String alarmId) {
    if (_tracker.acknowledge(alarmId)) _publish(_tracker.alarms);
  }

  @override
  void acknowledgeAll() {
    _tracker.acknowledgeAll();
    _publish(_tracker.alarms);
  }

  void _publish(List<Alarm> alarms) {
    if (_equality.equals(alarms, _current)) return;
    _current = alarms;
    if (!_alarms.isClosed) _alarms.add(alarms);
  }
}
