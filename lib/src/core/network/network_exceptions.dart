/// Resposta HTTP fora da faixa 2xx.
class ApiException implements Exception {
  /// Status HTTP.
  final int statusCode;

  /// Corpo JSON de erro (`{"error": "...", "message": "...", ...}`), se houver.
  final Map<String, dynamic>? body;

  /// Cria uma [ApiException].
  const ApiException(this.statusCode, [this.body]);

  /// Código de erro da API (`slave_timeout`, `busy`, ...).
  String? get errorCode => body?['error'] as String?;

  /// Mensagem legível enviada pelo gateway.
  String? get message => body?['message'] as String?;

  @override
  String toString() => 'ApiException($statusCode, $errorCode: $message)';
}

/// Sem rota até o gateway (DNS/mDNS, Wi-Fi, conexão recusada, CORS).
class NetworkException implements Exception {
  /// Detalhe técnico, para diagnóstico.
  final String detail;

  /// Cria uma [NetworkException].
  const NetworkException([this.detail = '']);

  @override
  String toString() => 'NetworkException($detail)';
}

/// A requisição passou do timeout configurado no ambiente.
class RequestTimeoutException implements Exception {
  /// Cria uma [RequestTimeoutException].
  const RequestTimeoutException();
}

/// Resposta 2xx que não segue o contrato da API.
class InvalidResponseException implements Exception {
  /// O que estava errado.
  final String detail;

  /// Cria uma [InvalidResponseException].
  const InvalidResponseException(this.detail);

  @override
  String toString() => 'InvalidResponseException($detail)';
}
