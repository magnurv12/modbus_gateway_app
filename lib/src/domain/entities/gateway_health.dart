import 'package:freezed_annotation/freezed_annotation.dart';

part 'gateway_health.freezed.dart';

/// Estado do gateway retornado por `GET /api/health`.
@freezed
abstract class GatewayHealth with _$GatewayHealth {
  const GatewayHealth._();

  /// Cria um [GatewayHealth].
  const factory GatewayHealth({
    required Duration uptime,
    required int freeHeapBytes,
    required String resetReason,
    required WifiInfo wifi,
    required FirmwareInfo firmware,
    required ModbusLinkStats modbus,
    required StreamStats stream,

    /// `true` se o escravo respondeu à última transação.
    required bool modbusLinkUp,
  }) = _GatewayHealth;

  /// Taxa de sucesso das transações Modbus (0..1), ou `null` sem tráfego.
  double? get successRate {
    final total = modbus.okCount + modbus.errorCount;
    if (total == 0) return null;
    return modbus.okCount / total;
  }
}

/// Informações da conexão Wi-Fi do gateway.
@freezed
abstract class WifiInfo with _$WifiInfo {
  const WifiInfo._();

  /// Cria um [WifiInfo].
  const factory WifiInfo({
    required String ssid,
    required int rssi,
    required String ip,
    required String hostname,
    required String mac,
    required int channel,
  }) = _WifiInfo;

  /// Qualidade do sinal em 0..4 barras a partir do RSSI (dBm).
  int get signalBars {
    if (rssi >= -55) return 4;
    if (rssi >= -65) return 3;
    if (rssi >= -75) return 2;
    if (rssi >= -85) return 1;
    return 0;
  }
}

/// Informações de firmware/hardware.
@freezed
abstract class FirmwareInfo with _$FirmwareInfo {
  /// Cria um [FirmwareInfo].
  const factory FirmwareInfo({
    required String version,
    required String buildTime,
    required String arduinoCore,
    required String idf,
    required String chip,
  }) = _FirmwareInfo;
}

/// Estatísticas do barramento Modbus (RS-485).
@freezed
abstract class ModbusLinkStats with _$ModbusLinkStats {
  /// Cria um [ModbusLinkStats].
  const factory ModbusLinkStats({
    required int okCount,
    required int errorCount,
    required String lastResult,
    int? lastSlave,
    int? lastAttemptAtMs,
    int? lastSuccessAtMs,
    required int cacheHits,
    required int baud,
    required String format,
    required int responseTimeoutMs,
  }) = _ModbusLinkStats;
}

/// Estatísticas do streaming WebSocket.
@freezed
abstract class StreamStats with _$StreamStats {
  /// Cria um [StreamStats].
  const factory StreamStats({
    required int clients,
    required int subscriptions,
    required int pollBlocks,

    /// Ocupação do barramento pelo polling (limitada a 70% no firmware).
    required double busLoadPct,
  }) = _StreamStats;
}
