import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Contexto Modbus devolvido pelo gateway em erros de barramento.
@freezed
abstract class ModbusErrorContext with _$ModbusErrorContext {
  /// Cria um [ModbusErrorContext].
  const factory ModbusErrorContext({
    String? table,
    int? slave,
    int? functionCode,
    int? address,

    /// Código do ModbusMaster: 1–4 exceções do escravo, 224–227 enlace.
    int? modbusCode,

    /// Nome do código, ex.: `ResponseTimedOut`, `IllegalDataAddress`.
    String? modbusError,
  }) = _ModbusErrorContext;
}

/// Falhas que atravessam as camadas até a apresentação.
///
/// Cada variante corresponde a uma *causa* que o operador consegue
/// entender e, quando possível, corrigir — não a um status HTTP.
@freezed
sealed class Failure with _$Failure {
  const Failure._();

  /// O app não alcançou o gateway (DNS/mDNS, Wi-Fi, gateway desligado).
  const factory Failure.gatewayUnreachable({@Default('') String detail}) =
      GatewayUnreachableFailure;

  /// O gateway não respondeu dentro do timeout HTTP.
  const factory Failure.requestTimeout() = RequestTimeoutFailure;

  /// O escravo Modbus não respondeu (HTTP 504 / `slave_timeout`).
  const factory Failure.slaveTimeout({ModbusErrorContext? context}) =
      SlaveTimeoutFailure;

  /// O escravo respondeu com exceção Modbus (endereço/valor/função ilegal,
  /// falha do dispositivo) ou resposta corrompida (HTTP 400/502).
  const factory Failure.modbusException({
    required String code,
    required String message,
    ModbusErrorContext? context,
  }) = ModbusExceptionFailure;

  /// Fila de requisições do gateway cheia (HTTP 503 / `busy`).
  const factory Failure.gatewayBusy() = GatewayBusyFailure;

  /// Escrita em tabela somente leitura (HTTP 405).
  const factory Failure.readOnly() = ReadOnlyFailure;

  /// Requisição rejeitada pelo gateway (HTTP 400/404/413).
  const factory Failure.invalidRequest({
    required String code,
    required String message,
  }) = InvalidRequestFailure;

  /// Validação local antes de ir ao barramento.
  const factory Failure.validation(String message) = ValidationFailure;

  /// Mapa da planta (plant.yaml) inválido.
  const factory Failure.configuration(String message) = ConfigurationFailure;

  /// Resposta fora do contrato da API.
  const factory Failure.unexpected({@Default('') String detail}) =
      UnexpectedFailure;

  /// Vale a pena tentar de novo sem mudar nada.
  bool get isTransient => switch (this) {
        GatewayUnreachableFailure() ||
        RequestTimeoutFailure() ||
        SlaveTimeoutFailure() ||
        GatewayBusyFailure() =>
          true,
        ModbusExceptionFailure(:final code) => code == 'bad_response',
        _ => false,
      };
}
