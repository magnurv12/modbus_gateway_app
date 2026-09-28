import 'package:either_dart/either.dart';

import '../../domain/domain.dart';
import '../datasources/datasources.dart';
import '../mappers/failure_mapper.dart';

/// Implementação de [IGatewayRepository] sobre [IGatewayDataSource].
class GatewayRepositoryImpl implements IGatewayRepository {
  final IGatewayDataSource _dataSource;

  /// Cria um [GatewayRepositoryImpl].
  GatewayRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, GatewayHealth>> getHealth() =>
      _guard(() async => (await _dataSource.getHealth()).toEntity());

  @override
  Future<Either<Failure, ModbusBlock>> read({
    required ModbusTable table,
    required int start,
    required int count,
    int? slave,
  }) =>
      _guard(() async =>
          (await _dataSource.read(table, start, count, slave: slave))
              .toEntity());

  @override
  Future<Either<Failure, ModbusBlock>> write({
    required ModbusTable table,
    required int start,
    required List<int> values,
    int? slave,
  }) =>
      _guard(() async =>
          (await _dataSource.write(table, start, values, slave: slave))
              .toEntity());

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action) async {
    try {
      return Right(await action());
    } catch (error) {
      return Left(FailureMapper.fromException(error));
    }
  }
}
