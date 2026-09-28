import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'network_exceptions.dart';

/// Cliente HTTP fino sobre `package:http` para a API JSON do gateway.
///
/// Responsável apenas por transporte: aplica timeout, decodifica JSON e
/// converte falhas de rede/HTTP nas exceções de [network_exceptions.dart].
/// A tradução para `Failure` de domínio acontece nos repositórios.
class ApiClient {
  final http.Client _client;
  final Uri _baseUrl;
  final Duration _timeout;

  /// Cria um [ApiClient].
  ApiClient(this._client, {required Uri baseUrl, required Duration timeout})
      : _baseUrl = baseUrl,
        _timeout = timeout;

  static const _jsonHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  /// `GET` em [path] com [query] opcional.
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? query,
  }) {
    final uri = _baseUrl.replace(path: path, queryParameters: query);
    return _send(() => _client.get(uri, headers: _jsonHeaders));
  }

  /// `PUT` em [path] com [body] serializado como JSON.
  Future<Map<String, dynamic>> put(
    String path,
    Object body, {
    Map<String, String>? query,
  }) {
    final uri = _baseUrl.replace(path: path, queryParameters: query);
    return _send(
      () => _client.put(uri, headers: _jsonHeaders, body: jsonEncode(body)),
    );
  }

  Future<Map<String, dynamic>> _send(
    Future<http.Response> Function() request,
  ) async {
    final http.Response response;
    try {
      response = await request().timeout(_timeout);
    } on TimeoutException {
      throw const RequestTimeoutException();
    } on http.ClientException catch (e) {
      // No IO, SocketException/HandshakeException chegam embrulhadas em
      // ClientException; no Web, erros de rede/CORS também.
      throw NetworkException(e.message);
    }

    final body = _decode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (body == null) {
        throw const InvalidResponseException('Corpo JSON ausente.');
      }
      return body;
    }
    throw ApiException(response.statusCode, body);
  }

  Map<String, dynamic>? _decode(String raw) {
    if (raw.trim().isEmpty) return null;
    try {
      final decoded = jsonDecode(raw);
      return decoded is Map<String, dynamic> ? decoded : null;
    } on FormatException {
      return null;
    }
  }
}
