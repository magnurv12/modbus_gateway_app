import 'package:either_dart/either.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';

/// Fonte da definição da planta (mapa de tags).
abstract class IPlantRepository {
  /// Carrega (e valida) a planta. O resultado é memorizado.
  Future<Either<Failure, Plant>> getPlant();
}
