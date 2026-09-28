import 'package:either_dart/either.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';
import '../repositories/repositories.dart';

/// Caso de uso: obter a definição da planta.
abstract class IGetPlantUseCase {
  /// Executa o caso de uso.
  Future<Either<Failure, Plant>> call();
}

/// Implementação de [IGetPlantUseCase].
class GetPlantUseCase implements IGetPlantUseCase {
  final IPlantRepository _repository;

  /// Cria um [GetPlantUseCase].
  GetPlantUseCase(this._repository);

  @override
  Future<Either<Failure, Plant>> call() => _repository.getPlant();
}

/// Caso de uso: acompanhar os valores ao vivo da planta.
abstract class IWatchPlantLiveUseCase {
  /// Stream com o estado ao vivo (emite o atual imediatamente).
  Stream<PlantLiveState> call(Plant plant);
}

/// Implementação de [IWatchPlantLiveUseCase].
class WatchPlantLiveUseCase implements IWatchPlantLiveUseCase {
  final ILiveDataRepository _repository;

  /// Cria um [WatchPlantLiveUseCase].
  WatchPlantLiveUseCase(this._repository);

  @override
  Stream<PlantLiveState> call(Plant plant) => _repository.watch(plant);
}

/// Caso de uso: pausar/retomar o streaming (ciclo de vida do app).
abstract class ISetLiveStreamActiveUseCase {
  /// Executa o caso de uso.
  void call({required bool active});
}

/// Implementação de [ISetLiveStreamActiveUseCase].
class SetLiveStreamActiveUseCase implements ISetLiveStreamActiveUseCase {
  final ILiveDataRepository _repository;

  /// Cria um [SetLiveStreamActiveUseCase].
  SetLiveStreamActiveUseCase(this._repository);

  @override
  void call({required bool active}) => _repository.setActive(active);
}

/// Caso de uso: tentar reconectar agora, sem esperar o backoff.
abstract class IReconnectLiveStreamUseCase {
  /// Executa o caso de uso.
  void call();
}

/// Implementação de [IReconnectLiveStreamUseCase].
class ReconnectLiveStreamUseCase implements IReconnectLiveStreamUseCase {
  final ILiveDataRepository _repository;

  /// Cria um [ReconnectLiveStreamUseCase].
  ReconnectLiveStreamUseCase(this._repository);

  @override
  void call() => _repository.reconnectNow();
}
