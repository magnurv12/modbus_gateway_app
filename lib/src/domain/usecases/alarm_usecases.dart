import '../entities/entities.dart';
import '../repositories/repositories.dart';

/// Caso de uso: acompanhar a lista de alarmes.
abstract class IWatchAlarmsUseCase {
  /// Stream com a lista de alarmes ordenada por prioridade.
  Stream<List<Alarm>> call(Plant plant);
}

/// Implementação de [IWatchAlarmsUseCase].
class WatchAlarmsUseCase implements IWatchAlarmsUseCase {
  final IAlarmRepository _repository;

  /// Cria um [WatchAlarmsUseCase].
  WatchAlarmsUseCase(this._repository);

  @override
  Stream<List<Alarm>> call(Plant plant) => _repository.watch(plant);
}

/// Caso de uso: reconhecer um alarme (ou todos, com `alarmId == null`).
abstract class IAcknowledgeAlarmUseCase {
  /// Executa o caso de uso.
  void call({String? alarmId});
}

/// Implementação de [IAcknowledgeAlarmUseCase].
class AcknowledgeAlarmUseCase implements IAcknowledgeAlarmUseCase {
  final IAlarmRepository _repository;

  /// Cria um [AcknowledgeAlarmUseCase].
  AcknowledgeAlarmUseCase(this._repository);

  @override
  void call({String? alarmId}) {
    if (alarmId == null) {
      _repository.acknowledgeAll();
    } else {
      _repository.acknowledge(alarmId);
    }
  }
}
