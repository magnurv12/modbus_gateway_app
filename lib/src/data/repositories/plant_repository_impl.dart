import 'package:either_dart/either.dart';

import '../../domain/domain.dart';
import '../datasources/datasources.dart';
import '../models/models.dart';

/// Implementação de [IPlantRepository] com memorização do resultado.
///
/// Memoriza a *Future* (e não só o valor): várias telas pedem a planta ao
/// mesmo tempo na abertura do app, e todas devem esperar a mesma leitura.
/// Falhas não ficam em cache, para "tentar novamente" funcionar.
class PlantRepositoryImpl implements IPlantRepository {
  final IPlantDataSource _dataSource;
  Future<Either<Failure, Plant>>? _pending;

  /// Cria um [PlantRepositoryImpl].
  PlantRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, Plant>> getPlant() {
    return _pending ??= _load().then((result) {
      if (result.isLeft) _pending = null;
      return result;
    });
  }

  Future<Either<Failure, Plant>> _load() async {
    try {
      return Right(await _dataSource.loadPlant());
    } on PlantConfigException catch (e) {
      return Left(Failure.configuration(e.toString()));
    } catch (e) {
      return Left(Failure.configuration('Não foi possível ler o mapa: $e'));
    }
  }
}
