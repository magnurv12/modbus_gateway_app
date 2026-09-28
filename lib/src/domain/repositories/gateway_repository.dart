import 'package:either_dart/either.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';

/// Acesso request/response ao gateway (REST).
abstract class IGatewayRepository {
  /// Estado do gateway e do enlace Modbus.
  Future<Either<Failure, GatewayHealth>> getHealth();

  /// Lê [count] endereços de [table] a partir de [start].
  Future<Either<Failure, ModbusBlock>> read({
    required ModbusTable table,
    required int start,
    required int count,
    int? slave,
  });

  /// Escreve [values] a partir de [start] e devolve o bloco confirmado pelo
  /// escravo. Um único valor usa FC 05/06; vários usam FC 15/16.
  Future<Either<Failure, ModbusBlock>> write({
    required ModbusTable table,
    required int start,
    required List<int> values,
    int? slave,
  });
}
