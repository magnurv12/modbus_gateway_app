import 'package:either_dart/either.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';
import '../repositories/repositories.dart';

/// Caso de uso: consultar a saúde do gateway.
abstract class IGetGatewayHealthUseCase {
  /// Executa o caso de uso.
  Future<Either<Failure, GatewayHealth>> call();
}

/// Implementação de [IGetGatewayHealthUseCase].
class GetGatewayHealthUseCase implements IGetGatewayHealthUseCase {
  final IGatewayRepository _repository;

  /// Cria um [GetGatewayHealthUseCase].
  GetGatewayHealthUseCase(this._repository);

  @override
  Future<Either<Failure, GatewayHealth>> call() => _repository.getHealth();
}

/// Caso de uso: leitura bruta de um bloco (explorador Modbus).
///
/// Valida os limites do protocolo **antes** de ocupar o barramento: o
/// gateway também valida, mas errar localmente é instantâneo e não gasta
/// uma das 8 vagas da fila de requisições.
abstract class IReadModbusBlockUseCase {
  /// Executa o caso de uso.
  Future<Either<Failure, ModbusBlock>> call({
    required ModbusTable table,
    required int start,
    required int count,
    int? slave,
  });
}

/// Implementação de [IReadModbusBlockUseCase].
class ReadModbusBlockUseCase implements IReadModbusBlockUseCase {
  final IGatewayRepository _repository;

  /// Cria um [ReadModbusBlockUseCase].
  ReadModbusBlockUseCase(this._repository);

  @override
  Future<Either<Failure, ModbusBlock>> call({
    required ModbusTable table,
    required int start,
    required int count,
    int? slave,
  }) async {
    final error =
        validateRange(table, start, count, table.maxReadCount) ??
        validateSlave(slave);
    if (error != null) return Left(error);

    return _repository.read(
      table: table,
      start: start,
      count: count,
      slave: slave,
    );
  }
}

/// Caso de uso: escrita bruta (explorador Modbus).
abstract class IWriteModbusValuesUseCase {
  /// Executa o caso de uso.
  Future<Either<Failure, ModbusBlock>> call({
    required ModbusTable table,
    required int start,
    required List<int> values,
    int? slave,
  });
}

/// Implementação de [IWriteModbusValuesUseCase].
class WriteModbusValuesUseCase implements IWriteModbusValuesUseCase {
  final IGatewayRepository _repository;

  /// Cria um [WriteModbusValuesUseCase].
  WriteModbusValuesUseCase(this._repository);

  @override
  Future<Either<Failure, ModbusBlock>> call({
    required ModbusTable table,
    required int start,
    required List<int> values,
    int? slave,
  }) async {
    if (!table.isWritable) return const Left(Failure.readOnly());

    final error =
        validateRange(table, start, values.length, ModbusTable.maxWriteCount) ??
        validateSlave(slave) ??
        _validateValues(table, values);
    if (error != null) return Left(error);

    return _repository.write(
      table: table,
      start: start,
      values: values,
      slave: slave,
    );
  }

  Failure? _validateValues(ModbusTable table, List<int> values) {
    final max = table.isBit ? 1 : ModbusTable.maxRegisterValue;
    if (values.any((v) => v < 0 || v > max)) {
      return Failure.validation(
        table.isBit
            ? 'Coils aceitam apenas 0 ou 1.'
            : 'Registradores aceitam valores de 0 a $max.',
      );
    }
    return null;
  }
}

/// Valida faixa de endereços segundo os limites do gateway.
Failure? validateRange(ModbusTable table, int start, int count, int maxCount) {
  if (start < 0 || start > ModbusTable.maxAddress) {
    return const Failure.validation(
      'Endereço inicial deve estar entre 0 e 65535.',
    );
  }
  if (count < 1 || count > maxCount) {
    return Failure.validation('Quantidade deve estar entre 1 e $maxCount.');
  }
  if (start + count > ModbusTable.maxAddress + 1) {
    return const Failure.validation('O bloco ultrapassa o endereço 65535.');
  }
  return null;
}

/// Valida o id do escravo (1–247; 0 é broadcast e não é aceito).
Failure? validateSlave(int? slave) {
  if (slave == null) return null;
  if (slave < 1 || slave > 247) {
    return const Failure.validation('Escravo deve estar entre 1 e 247.');
  }
  return null;
}
