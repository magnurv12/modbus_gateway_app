// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'health_model.freezed.dart';
part 'health_model.g.dart';

/// Resposta de `GET /api/health`.
///
/// Blocos aninhados têm padrão vazio para tolerar firmwares mais antigos
/// que ainda não publicam `stream`/`firmware`.
@freezed
abstract class HealthModel with _$HealthModel {
  const HealthModel._();

  /// Cria um [HealthModel].
  const factory HealthModel({
    required int uptimeMs,
    required int freeHeap,
    @Default('unknown') String resetReason,
    @Default(WifiModel()) WifiModel wifi,
    @Default(FirmwareModel()) FirmwareModel firmware,
    @Default(ModbusStatsModel()) ModbusStatsModel modbus,
    @Default(StreamStatsModel()) StreamStatsModel stream,
    @Default(false) bool modbusLinkUp,
  }) = _HealthModel;

  /// Cria a partir do JSON da API.
  factory HealthModel.fromJson(Map<String, dynamic> json) =>
      _$HealthModelFromJson(json);

  /// Converte para a entidade de domínio.
  GatewayHealth toEntity() => GatewayHealth(
    uptime: Duration(milliseconds: uptimeMs),
    freeHeapBytes: freeHeap,
    resetReason: resetReason,
    modbusLinkUp: modbusLinkUp,
    wifi: WifiInfo(
      ssid: wifi.ssid,
      rssi: wifi.rssi,
      ip: wifi.ip,
      hostname: wifi.hostname,
      mac: wifi.mac,
      channel: wifi.channel,
    ),
    firmware: FirmwareInfo(
      version: firmware.version,
      buildTime: firmware.buildTime,
      arduinoCore: firmware.arduinoCore,
      idf: firmware.idf,
      chip: firmware.chip,
    ),
    modbus: ModbusLinkStats(
      okCount: modbus.okCount,
      errorCount: modbus.errorCount,
      lastResult: modbus.lastResult,
      lastSlave: modbus.lastSlave,
      lastAttemptAtMs: modbus.lastAttemptAt,
      lastSuccessAtMs: modbus.lastSuccessAt,
      cacheHits: modbus.cacheHits,
      baud: modbus.config.baud,
      format: modbus.config.format,
      responseTimeoutMs: modbus.config.responseTimeoutMs,
    ),
    stream: StreamStats(
      clients: stream.clients,
      subscriptions: stream.subscriptions,
      pollBlocks: stream.pollBlocks,
      busLoadPct: stream.busLoadPct,
    ),
  );
}

/// Bloco `wifi`.
@freezed
abstract class WifiModel with _$WifiModel {
  /// Cria um [WifiModel].
  const factory WifiModel({
    @Default('') String ssid,
    @Default(0) int rssi,
    @Default('') String ip,
    @Default('') String hostname,
    @Default('') String mac,
    @Default(0) int channel,
  }) = _WifiModel;

  /// Cria a partir do JSON.
  factory WifiModel.fromJson(Map<String, dynamic> json) =>
      _$WifiModelFromJson(json);
}

/// Bloco `firmware`.
@freezed
abstract class FirmwareModel with _$FirmwareModel {
  /// Cria um [FirmwareModel].
  const factory FirmwareModel({
    @Default('unknown') String version,
    @Default('') String buildTime,
    @Default('') String arduinoCore,
    @Default('') String idf,
    @Default('') String chip,
  }) = _FirmwareModel;

  /// Cria a partir do JSON.
  factory FirmwareModel.fromJson(Map<String, dynamic> json) =>
      _$FirmwareModelFromJson(json);
}

/// Bloco `modbus`.
@freezed
abstract class ModbusStatsModel with _$ModbusStatsModel {
  /// Cria um [ModbusStatsModel].
  const factory ModbusStatsModel({
    @Default(0) int okCount,
    @Default(0) int errorCount,
    @Default('NoRequestYet') String lastResult,
    int? lastSlave,
    int? lastAttemptAt,
    int? lastSuccessAt,
    @Default(0) int cacheHits,
    @Default(ModbusConfigModel()) ModbusConfigModel config,
  }) = _ModbusStatsModel;

  /// Cria a partir do JSON.
  factory ModbusStatsModel.fromJson(Map<String, dynamic> json) =>
      _$ModbusStatsModelFromJson(json);
}

/// Bloco `modbus.config`.
@freezed
abstract class ModbusConfigModel with _$ModbusConfigModel {
  /// Cria um [ModbusConfigModel].
  const factory ModbusConfigModel({
    @Default(9600) int baud,
    @Default('8N1') String format,
    @Default(0) int responseTimeoutMs,
    @Default(1) int defaultSlave,
  }) = _ModbusConfigModel;

  /// Cria a partir do JSON.
  factory ModbusConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ModbusConfigModelFromJson(json);
}

/// Bloco `stream`.
@freezed
abstract class StreamStatsModel with _$StreamStatsModel {
  /// Cria um [StreamStatsModel].
  const factory StreamStatsModel({
    @Default(0) int clients,
    @Default(0) int subscriptions,
    @Default(0) int pollBlocks,
    @Default(0.0) double busLoadPct,
  }) = _StreamStatsModel;

  /// Cria a partir do JSON.
  factory StreamStatsModel.fromJson(Map<String, dynamic> json) =>
      _$StreamStatsModelFromJson(json);
}
