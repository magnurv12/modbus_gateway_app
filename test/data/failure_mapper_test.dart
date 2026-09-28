import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:modbus_gateway_app/src/core/network/network_exceptions.dart';
import 'package:modbus_gateway_app/src/data/data.dart';
import 'package:modbus_gateway_app/src/domain/domain.dart';

void main() {
  group('FailureMapper.fromApi (contrato docs/openapi.yaml)', () {
    test('504 slave_timeout carrega o contexto Modbus', () {
      final failure = FailureMapper.fromApi(504, {
        'error': 'slave_timeout',
        'message': 'The Modbus slave did not respond',
        'table': 'holding',
        'slave': 1,
        'functionCode': 3,
        'address': 1,
        'count': 2,
        'modbusCode': 226,
        'modbusError': 'ResponseTimedOut',
      });

      expect(failure, isA<SlaveTimeoutFailure>());
      final context = (failure as SlaveTimeoutFailure).context!;
      expect(context.modbusCode, 226);
      expect(context.functionCode, 3);
      expect(context.slave, 1);
    });

    test('502 slave_failure vira exceção Modbus', () {
      final failure = FailureMapper.fromApi(502, {
        'error': 'slave_failure',
        'message': 'The Modbus slave reported a device failure',
        'modbusCode': 4,
      });
      expect(failure, isA<ModbusExceptionFailure>());
      expect((failure as ModbusExceptionFailure).code, 'slave_failure');
    });

    test('503 busy é transitório', () {
      final failure = FailureMapper.fromApi(503, {'error': 'busy'});
      expect(failure, isA<GatewayBusyFailure>());
      expect(failure.isTransient, isTrue);
    });

    test('405 read_only', () {
      expect(
        FailureMapper.fromApi(405, {'error': 'read_only'}),
        isA<ReadOnlyFailure>(),
      );
    });

    test('400 missing_parameter preserva código e mensagem', () {
      final failure = FailureMapper.fromApi(400, {
        'error': 'missing_parameter',
        'message': "Query parameter 'start' is required",
      });
      expect(
        failure,
        const Failure.invalidRequest(
          code: 'missing_parameter',
          message: "Query parameter 'start' is required",
        ),
      );
      expect(failure.isTransient, isFalse);
    });

    test('corpo ausente ainda mapeia pelo status', () {
      expect(FailureMapper.fromApi(504, null), isA<SlaveTimeoutFailure>());
      expect(FailureMapper.fromApi(413, null), isA<InvalidRequestFailure>());
    });
  });

  group('FailureMapper.fromException', () {
    test('rede e timeout', () {
      expect(
        FailureMapper.fromException(
          const NetworkException('Failed host lookup'),
        ),
        const Failure.gatewayUnreachable(detail: 'Failed host lookup'),
      );
      expect(
        FailureMapper.fromException(const RequestTimeoutException()),
        isA<RequestTimeoutFailure>(),
      );
      expect(
        FailureMapper.fromException(TimeoutException('ws')),
        isA<RequestTimeoutFailure>(),
      );
    });

    test('resposta fora do contrato', () {
      expect(
        FailureMapper.fromException(const FormatException('x')),
        isA<UnexpectedFailure>(),
      );
    });
  });

  test('erro de streaming por assinatura', () {
    final failure = FailureMapper.fromStreamError({
      'type': 'error',
      'id': 'motor1',
      'error': 'illegal_address',
      'message': '...',
      'modbusCode': 2,
    });
    expect(failure, isA<ModbusExceptionFailure>());
  });
}
