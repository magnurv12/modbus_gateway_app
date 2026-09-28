import 'dart:async';

import 'package:json_annotation/json_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../core/network/network_exceptions.dart';
import '../../domain/domain.dart';

/// Traduz exceções de infraestrutura para [Failure] de domínio.
///
/// Ponto único de mapeamento: todos os repositórios passam por aqui, então
/// o mesmo erro do gateway sempre vira a mesma mensagem para o operador.
abstract final class FailureMapper {
  /// Códigos de erro do gateway que representam exceção do escravo ou do
  /// enlace Modbus (e não erro do cliente).
  static const _modbusCodes = {
    'illegal_function',
    'illegal_address',
    'illegal_value',
    'slave_failure',
    'bad_response',
  };

  /// Converte qualquer erro em [Failure].
  static Failure fromException(Object error) {
    return switch (error) {
      final Failure failure => failure,
      final ApiException e => fromApi(e.statusCode, e.body),
      NetworkException(:final detail) =>
        Failure.gatewayUnreachable(detail: detail),
      WebSocketChannelException(:final message) =>
        Failure.gatewayUnreachable(detail: message ?? ''),
      RequestTimeoutException() || TimeoutException() =>
        const Failure.requestTimeout(),
      InvalidResponseException(:final detail) =>
        Failure.unexpected(detail: detail),
      CheckedFromJsonException(:final message) =>
        Failure.unexpected(detail: 'Resposta fora do contrato: $message'),
      FormatException(:final message) => Failure.unexpected(detail: message),
      TypeError() => const Failure.unexpected(
          detail: 'Resposta com tipo inesperado.',
        ),
      _ => Failure.unexpected(detail: error.toString()),
    };
  }

  /// Converte um erro da API (status HTTP + corpo JSON) em [Failure].
  static Failure fromApi(int statusCode, Map<String, dynamic>? body) {
    final code = body?['error'] as String? ?? '';
    final message = body?['message'] as String? ?? '';
    final context = _context(body);

    if (code == 'slave_timeout' || statusCode == 504) {
      return Failure.slaveTimeout(context: context);
    }
    if (_modbusCodes.contains(code) ||
        statusCode == 502 ||
        context?.modbusCode != null) {
      return Failure.modbusException(
        code: code.isEmpty ? 'bad_response' : code,
        message: message,
        context: context,
      );
    }
    return switch (statusCode) {
      405 => const Failure.readOnly(),
      503 => const Failure.gatewayBusy(),
      400 || 404 || 413 => Failure.invalidRequest(
          code: code.isEmpty ? 'http_$statusCode' : code,
          message: message,
        ),
      _ => Failure.unexpected(detail: 'HTTP $statusCode $code $message'.trim()),
    };
  }

  /// Converte o `error` de uma mensagem WebSocket em [Failure].
  static Failure fromStreamError(Map<String, dynamic> message) {
    final code = message['error'] as String? ?? '';
    return switch (code) {
      'busy' => const Failure.gatewayBusy(),
      'slave_timeout' => Failure.slaveTimeout(context: _context(message)),
      _ when _modbusCodes.contains(code) => Failure.modbusException(
          code: code,
          message: message['message'] as String? ?? '',
          context: _context(message),
        ),
      _ => Failure.invalidRequest(
          code: code,
          message: message['message'] as String? ?? '',
        ),
    };
  }

  static ModbusErrorContext? _context(Map<String, dynamic>? body) {
    if (body == null) return null;
    final modbusCode = body['modbusCode'];
    final slave = body['slave'];
    if (modbusCode == null && slave == null) return null;
    return ModbusErrorContext(
      table: body['table'] as String?,
      slave: slave is int ? slave : null,
      functionCode: body['functionCode'] as int?,
      address: (body['address'] ?? body['startAddress']) as int?,
      modbusCode: modbusCode is int ? modbusCode : null,
      modbusError: body['modbusError'] as String?,
    );
  }
}
