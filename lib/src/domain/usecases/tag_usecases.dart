import 'package:either_dart/either.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';
import '../repositories/repositories.dart';
import '../services/services.dart';

/// Caso de uso: escrever um valor de engenharia em uma tag (comando ou
/// setpoint). A escrita só retorna sucesso depois que o escravo confirma.
abstract class IWriteTagUseCase {
  /// Executa o caso de uso.
  Future<Either<Failure, ModbusBlock>> call(TagDefinition tag, TagValue value);
}

/// Implementação de [IWriteTagUseCase].
class WriteTagUseCase implements IWriteTagUseCase {
  final IGatewayRepository _repository;
  final TagCodec _codec;

  /// Cria um [WriteTagUseCase].
  WriteTagUseCase(this._repository, this._codec);

  @override
  Future<Either<Failure, ModbusBlock>> call(
    TagDefinition tag,
    TagValue value,
  ) async {
    final encoded = _codec.encode(tag, value);
    if (encoded.isLeft) return Left(encoded.left);

    return _repository.write(
      table: tag.table,
      start: tag.address,
      values: encoded.right,
      slave: tag.slave,
    );
  }
}

/// Caso de uso: pulso em coil momentânea (ex.: reset de falha) —
/// escreve `true`, aguarda [pulseWidth] e escreve `false`.
abstract class IPulseTagUseCase {
  /// Executa o caso de uso.
  Future<Either<Failure, ModbusBlock>> call(TagDefinition tag);
}

/// Implementação de [IPulseTagUseCase].
class PulseTagUseCase implements IPulseTagUseCase {
  final IWriteTagUseCase _write;

  /// Largura do pulso.
  final Duration pulseWidth;

  /// Cria um [PulseTagUseCase].
  PulseTagUseCase(
    this._write, {
    this.pulseWidth = const Duration(milliseconds: 500),
  });

  @override
  Future<Either<Failure, ModbusBlock>> call(TagDefinition tag) async {
    if (!tag.isBoolean || !tag.isWritable) {
      return const Left(Failure.validation('Pulso só se aplica a coils.'));
    }
    final rising = await _write(tag, const TagValue.boolean(true));
    if (rising.isLeft) return rising;

    await Future<void>.delayed(pulseWidth);
    return _write(tag, const TagValue.boolean(false));
  }
}
