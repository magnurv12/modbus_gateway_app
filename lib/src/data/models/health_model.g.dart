// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HealthModel _$HealthModelFromJson(Map<String, dynamic> json) => _HealthModel(
  uptimeMs: (json['uptimeMs'] as num).toInt(),
  freeHeap: (json['freeHeap'] as num).toInt(),
  resetReason: json['resetReason'] as String? ?? 'unknown',
  wifi: json['wifi'] == null
      ? const WifiModel()
      : WifiModel.fromJson(json['wifi'] as Map<String, dynamic>),
  firmware: json['firmware'] == null
      ? const FirmwareModel()
      : FirmwareModel.fromJson(json['firmware'] as Map<String, dynamic>),
  modbus: json['modbus'] == null
      ? const ModbusStatsModel()
      : ModbusStatsModel.fromJson(json['modbus'] as Map<String, dynamic>),
  stream: json['stream'] == null
      ? const StreamStatsModel()
      : StreamStatsModel.fromJson(json['stream'] as Map<String, dynamic>),
  modbusLinkUp: json['modbusLinkUp'] as bool? ?? false,
);

Map<String, dynamic> _$HealthModelToJson(_HealthModel instance) =>
    <String, dynamic>{
      'uptimeMs': instance.uptimeMs,
      'freeHeap': instance.freeHeap,
      'resetReason': instance.resetReason,
      'wifi': instance.wifi,
      'firmware': instance.firmware,
      'modbus': instance.modbus,
      'stream': instance.stream,
      'modbusLinkUp': instance.modbusLinkUp,
    };

_WifiModel _$WifiModelFromJson(Map<String, dynamic> json) => _WifiModel(
  ssid: json['ssid'] as String? ?? '',
  rssi: (json['rssi'] as num?)?.toInt() ?? 0,
  ip: json['ip'] as String? ?? '',
  hostname: json['hostname'] as String? ?? '',
  mac: json['mac'] as String? ?? '',
  channel: (json['channel'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$WifiModelToJson(_WifiModel instance) =>
    <String, dynamic>{
      'ssid': instance.ssid,
      'rssi': instance.rssi,
      'ip': instance.ip,
      'hostname': instance.hostname,
      'mac': instance.mac,
      'channel': instance.channel,
    };

_FirmwareModel _$FirmwareModelFromJson(Map<String, dynamic> json) =>
    _FirmwareModel(
      version: json['version'] as String? ?? 'unknown',
      buildTime: json['buildTime'] as String? ?? '',
      arduinoCore: json['arduinoCore'] as String? ?? '',
      idf: json['idf'] as String? ?? '',
      chip: json['chip'] as String? ?? '',
    );

Map<String, dynamic> _$FirmwareModelToJson(_FirmwareModel instance) =>
    <String, dynamic>{
      'version': instance.version,
      'buildTime': instance.buildTime,
      'arduinoCore': instance.arduinoCore,
      'idf': instance.idf,
      'chip': instance.chip,
    };

_ModbusStatsModel _$ModbusStatsModelFromJson(Map<String, dynamic> json) =>
    _ModbusStatsModel(
      okCount: (json['okCount'] as num?)?.toInt() ?? 0,
      errorCount: (json['errorCount'] as num?)?.toInt() ?? 0,
      lastResult: json['lastResult'] as String? ?? 'NoRequestYet',
      lastSlave: (json['lastSlave'] as num?)?.toInt(),
      lastAttemptAt: (json['lastAttemptAt'] as num?)?.toInt(),
      lastSuccessAt: (json['lastSuccessAt'] as num?)?.toInt(),
      cacheHits: (json['cacheHits'] as num?)?.toInt() ?? 0,
      config: json['config'] == null
          ? const ModbusConfigModel()
          : ModbusConfigModel.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModbusStatsModelToJson(_ModbusStatsModel instance) =>
    <String, dynamic>{
      'okCount': instance.okCount,
      'errorCount': instance.errorCount,
      'lastResult': instance.lastResult,
      'lastSlave': instance.lastSlave,
      'lastAttemptAt': instance.lastAttemptAt,
      'lastSuccessAt': instance.lastSuccessAt,
      'cacheHits': instance.cacheHits,
      'config': instance.config,
    };

_ModbusConfigModel _$ModbusConfigModelFromJson(Map<String, dynamic> json) =>
    _ModbusConfigModel(
      baud: (json['baud'] as num?)?.toInt() ?? 9600,
      format: json['format'] as String? ?? '8N1',
      responseTimeoutMs: (json['responseTimeoutMs'] as num?)?.toInt() ?? 0,
      defaultSlave: (json['defaultSlave'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$ModbusConfigModelToJson(_ModbusConfigModel instance) =>
    <String, dynamic>{
      'baud': instance.baud,
      'format': instance.format,
      'responseTimeoutMs': instance.responseTimeoutMs,
      'defaultSlave': instance.defaultSlave,
    };

_StreamStatsModel _$StreamStatsModelFromJson(Map<String, dynamic> json) =>
    _StreamStatsModel(
      clients: (json['clients'] as num?)?.toInt() ?? 0,
      subscriptions: (json['subscriptions'] as num?)?.toInt() ?? 0,
      pollBlocks: (json['pollBlocks'] as num?)?.toInt() ?? 0,
      busLoadPct: (json['busLoadPct'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$StreamStatsModelToJson(_StreamStatsModel instance) =>
    <String, dynamic>{
      'clients': instance.clients,
      'subscriptions': instance.subscriptions,
      'pollBlocks': instance.pollBlocks,
      'busLoadPct': instance.busLoadPct,
    };
