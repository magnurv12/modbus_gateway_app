import 'dart:convert';

/// Mensagens enviadas pelo gateway em `/ws` (docs/websocket.md).
sealed class WsMessage {
  const WsMessage();

  /// Faz o parse de um frame de texto. Retorna `null` para tipos
  /// desconhecidos (compatibilidade com firmwares futuros).
  static WsMessage? tryParse(Object? frame) {
    if (frame is! String) return null;
    final Object? decoded;
    try {
      decoded = jsonDecode(frame);
    } on FormatException {
      return null;
    }
    if (decoded is! Map<String, dynamic>) return null;
    return fromJson(decoded);
  }

  /// Converte um JSON já decodificado.
  static WsMessage? fromJson(Map<String, dynamic> json) {
    return switch (json['type']) {
      'hello' => WsHello(
        clientId: json['clientId'],
        defaultSlave: json['defaultSlave'] as int? ?? 1,
      ),
      'subscribed' || 'interval' => WsSubscribed(
        id: json['id'] as String,
        effectiveIntervalMs:
            (json['effectiveIntervalMs'] ?? json['intervalMs'] ?? 0) as int,
      ),
      'snapshot' => WsSnapshot(
        id: json['id'] as String,
        startAddress: json['startAddress'] as int,
        values: [for (final v in json['values'] as List) _toInt(v)],
      ),
      'update' => WsUpdate(
        id: json['id'] as String,
        changes: [
          for (final pair in json['changes'] as List)
            (address: (pair as List)[0] as int, value: _toInt(pair[1])),
        ],
      ),
      'error' => WsError(id: json['id'] as String?, raw: json),
      'unsubscribed' => WsUnsubscribed(id: json['id'] as String),
      _ => null,
    };
  }

  static int _toInt(Object? v) => switch (v) {
    true => 1,
    false => 0,
    final num n => n.toInt(),
    _ => throw const FormatException('Valor inválido no streaming.'),
  };
}

/// Saudação ao conectar.
class WsHello extends WsMessage {
  /// Id do cliente atribuído pelo gateway.
  final Object? clientId;

  /// Escravo padrão configurado no firmware.
  final int defaultSlave;

  /// Cria um [WsHello].
  const WsHello({this.clientId, this.defaultSlave = 1});
}

/// Assinatura aceita (ou intervalo ajustado pelo orçamento do barramento).
class WsSubscribed extends WsMessage {
  /// Id da assinatura.
  final String id;

  /// Intervalo real de polling.
  final int effectiveIntervalMs;

  /// Cria um [WsSubscribed].
  const WsSubscribed({required this.id, required this.effectiveIntervalMs});
}

/// Fotografia completa da faixa assinada.
class WsSnapshot extends WsMessage {
  /// Id da assinatura.
  final String id;

  /// Primeiro endereço.
  final int startAddress;

  /// Valores (bits como 0/1).
  final List<int> values;

  /// Cria um [WsSnapshot].
  const WsSnapshot({
    required this.id,
    required this.startAddress,
    required this.values,
  });
}

/// Apenas os endereços que mudaram.
class WsUpdate extends WsMessage {
  /// Id da assinatura.
  final String id;

  /// Pares endereço/valor alterados.
  final List<({int address, int value})> changes;

  /// Cria um [WsUpdate].
  const WsUpdate({required this.id, required this.changes});
}

/// Erro de polling ou de requisição.
class WsError extends WsMessage {
  /// Assinatura afetada (`null` para erros de conexão).
  final String? id;

  /// JSON completo (código, mensagem, contexto Modbus, retryInMs).
  final Map<String, dynamic> raw;

  /// Cria um [WsError].
  const WsError({required this.id, required this.raw});
}

/// Assinatura removida.
class WsUnsubscribed extends WsMessage {
  /// Id da assinatura.
  final String id;

  /// Cria um [WsUnsubscribed].
  const WsUnsubscribed({required this.id});
}
