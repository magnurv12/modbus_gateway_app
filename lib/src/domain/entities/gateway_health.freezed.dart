// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gateway_health.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GatewayHealth {

 Duration get uptime; int get freeHeapBytes; String get resetReason; WifiInfo get wifi; FirmwareInfo get firmware; ModbusLinkStats get modbus; StreamStats get stream;/// `true` se o escravo respondeu à última transação.
 bool get modbusLinkUp;
/// Create a copy of GatewayHealth
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayHealthCopyWith<GatewayHealth> get copyWith => _$GatewayHealthCopyWithImpl<GatewayHealth>(this as GatewayHealth, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayHealth&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.freeHeapBytes, freeHeapBytes) || other.freeHeapBytes == freeHeapBytes)&&(identical(other.resetReason, resetReason) || other.resetReason == resetReason)&&(identical(other.wifi, wifi) || other.wifi == wifi)&&(identical(other.firmware, firmware) || other.firmware == firmware)&&(identical(other.modbus, modbus) || other.modbus == modbus)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.modbusLinkUp, modbusLinkUp) || other.modbusLinkUp == modbusLinkUp));
}


@override
int get hashCode => Object.hash(runtimeType,uptime,freeHeapBytes,resetReason,wifi,firmware,modbus,stream,modbusLinkUp);

@override
String toString() {
  return 'GatewayHealth(uptime: $uptime, freeHeapBytes: $freeHeapBytes, resetReason: $resetReason, wifi: $wifi, firmware: $firmware, modbus: $modbus, stream: $stream, modbusLinkUp: $modbusLinkUp)';
}


}

/// @nodoc
abstract mixin class $GatewayHealthCopyWith<$Res>  {
  factory $GatewayHealthCopyWith(GatewayHealth value, $Res Function(GatewayHealth) _then) = _$GatewayHealthCopyWithImpl;
@useResult
$Res call({
 Duration uptime, int freeHeapBytes, String resetReason, WifiInfo wifi, FirmwareInfo firmware, ModbusLinkStats modbus, StreamStats stream, bool modbusLinkUp
});


$WifiInfoCopyWith<$Res> get wifi;$FirmwareInfoCopyWith<$Res> get firmware;$ModbusLinkStatsCopyWith<$Res> get modbus;$StreamStatsCopyWith<$Res> get stream;

}
/// @nodoc
class _$GatewayHealthCopyWithImpl<$Res>
    implements $GatewayHealthCopyWith<$Res> {
  _$GatewayHealthCopyWithImpl(this._self, this._then);

  final GatewayHealth _self;
  final $Res Function(GatewayHealth) _then;

/// Create a copy of GatewayHealth
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uptime = null,Object? freeHeapBytes = null,Object? resetReason = null,Object? wifi = null,Object? firmware = null,Object? modbus = null,Object? stream = null,Object? modbusLinkUp = null,}) {
  return _then(_self.copyWith(
uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as Duration,freeHeapBytes: null == freeHeapBytes ? _self.freeHeapBytes : freeHeapBytes // ignore: cast_nullable_to_non_nullable
as int,resetReason: null == resetReason ? _self.resetReason : resetReason // ignore: cast_nullable_to_non_nullable
as String,wifi: null == wifi ? _self.wifi : wifi // ignore: cast_nullable_to_non_nullable
as WifiInfo,firmware: null == firmware ? _self.firmware : firmware // ignore: cast_nullable_to_non_nullable
as FirmwareInfo,modbus: null == modbus ? _self.modbus : modbus // ignore: cast_nullable_to_non_nullable
as ModbusLinkStats,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as StreamStats,modbusLinkUp: null == modbusLinkUp ? _self.modbusLinkUp : modbusLinkUp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of GatewayHealth
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WifiInfoCopyWith<$Res> get wifi {
  
  return $WifiInfoCopyWith<$Res>(_self.wifi, (value) {
    return _then(_self.copyWith(wifi: value));
  });
}/// Create a copy of GatewayHealth
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirmwareInfoCopyWith<$Res> get firmware {
  
  return $FirmwareInfoCopyWith<$Res>(_self.firmware, (value) {
    return _then(_self.copyWith(firmware: value));
  });
}/// Create a copy of GatewayHealth
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModbusLinkStatsCopyWith<$Res> get modbus {
  
  return $ModbusLinkStatsCopyWith<$Res>(_self.modbus, (value) {
    return _then(_self.copyWith(modbus: value));
  });
}/// Create a copy of GatewayHealth
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreamStatsCopyWith<$Res> get stream {
  
  return $StreamStatsCopyWith<$Res>(_self.stream, (value) {
    return _then(_self.copyWith(stream: value));
  });
}
}


/// Adds pattern-matching-related methods to [GatewayHealth].
extension GatewayHealthPatterns on GatewayHealth {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GatewayHealth value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GatewayHealth() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GatewayHealth value)  $default,){
final _that = this;
switch (_that) {
case _GatewayHealth():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GatewayHealth value)?  $default,){
final _that = this;
switch (_that) {
case _GatewayHealth() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Duration uptime,  int freeHeapBytes,  String resetReason,  WifiInfo wifi,  FirmwareInfo firmware,  ModbusLinkStats modbus,  StreamStats stream,  bool modbusLinkUp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GatewayHealth() when $default != null:
return $default(_that.uptime,_that.freeHeapBytes,_that.resetReason,_that.wifi,_that.firmware,_that.modbus,_that.stream,_that.modbusLinkUp);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Duration uptime,  int freeHeapBytes,  String resetReason,  WifiInfo wifi,  FirmwareInfo firmware,  ModbusLinkStats modbus,  StreamStats stream,  bool modbusLinkUp)  $default,) {final _that = this;
switch (_that) {
case _GatewayHealth():
return $default(_that.uptime,_that.freeHeapBytes,_that.resetReason,_that.wifi,_that.firmware,_that.modbus,_that.stream,_that.modbusLinkUp);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Duration uptime,  int freeHeapBytes,  String resetReason,  WifiInfo wifi,  FirmwareInfo firmware,  ModbusLinkStats modbus,  StreamStats stream,  bool modbusLinkUp)?  $default,) {final _that = this;
switch (_that) {
case _GatewayHealth() when $default != null:
return $default(_that.uptime,_that.freeHeapBytes,_that.resetReason,_that.wifi,_that.firmware,_that.modbus,_that.stream,_that.modbusLinkUp);case _:
  return null;

}
}

}

/// @nodoc


class _GatewayHealth extends GatewayHealth {
  const _GatewayHealth({required this.uptime, required this.freeHeapBytes, required this.resetReason, required this.wifi, required this.firmware, required this.modbus, required this.stream, required this.modbusLinkUp}): super._();
  

@override final  Duration uptime;
@override final  int freeHeapBytes;
@override final  String resetReason;
@override final  WifiInfo wifi;
@override final  FirmwareInfo firmware;
@override final  ModbusLinkStats modbus;
@override final  StreamStats stream;
/// `true` se o escravo respondeu à última transação.
@override final  bool modbusLinkUp;

/// Create a copy of GatewayHealth
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GatewayHealthCopyWith<_GatewayHealth> get copyWith => __$GatewayHealthCopyWithImpl<_GatewayHealth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GatewayHealth&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.freeHeapBytes, freeHeapBytes) || other.freeHeapBytes == freeHeapBytes)&&(identical(other.resetReason, resetReason) || other.resetReason == resetReason)&&(identical(other.wifi, wifi) || other.wifi == wifi)&&(identical(other.firmware, firmware) || other.firmware == firmware)&&(identical(other.modbus, modbus) || other.modbus == modbus)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.modbusLinkUp, modbusLinkUp) || other.modbusLinkUp == modbusLinkUp));
}


@override
int get hashCode => Object.hash(runtimeType,uptime,freeHeapBytes,resetReason,wifi,firmware,modbus,stream,modbusLinkUp);

@override
String toString() {
  return 'GatewayHealth(uptime: $uptime, freeHeapBytes: $freeHeapBytes, resetReason: $resetReason, wifi: $wifi, firmware: $firmware, modbus: $modbus, stream: $stream, modbusLinkUp: $modbusLinkUp)';
}


}

/// @nodoc
abstract mixin class _$GatewayHealthCopyWith<$Res> implements $GatewayHealthCopyWith<$Res> {
  factory _$GatewayHealthCopyWith(_GatewayHealth value, $Res Function(_GatewayHealth) _then) = __$GatewayHealthCopyWithImpl;
@override @useResult
$Res call({
 Duration uptime, int freeHeapBytes, String resetReason, WifiInfo wifi, FirmwareInfo firmware, ModbusLinkStats modbus, StreamStats stream, bool modbusLinkUp
});


@override $WifiInfoCopyWith<$Res> get wifi;@override $FirmwareInfoCopyWith<$Res> get firmware;@override $ModbusLinkStatsCopyWith<$Res> get modbus;@override $StreamStatsCopyWith<$Res> get stream;

}
/// @nodoc
class __$GatewayHealthCopyWithImpl<$Res>
    implements _$GatewayHealthCopyWith<$Res> {
  __$GatewayHealthCopyWithImpl(this._self, this._then);

  final _GatewayHealth _self;
  final $Res Function(_GatewayHealth) _then;

/// Create a copy of GatewayHealth
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uptime = null,Object? freeHeapBytes = null,Object? resetReason = null,Object? wifi = null,Object? firmware = null,Object? modbus = null,Object? stream = null,Object? modbusLinkUp = null,}) {
  return _then(_GatewayHealth(
uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as Duration,freeHeapBytes: null == freeHeapBytes ? _self.freeHeapBytes : freeHeapBytes // ignore: cast_nullable_to_non_nullable
as int,resetReason: null == resetReason ? _self.resetReason : resetReason // ignore: cast_nullable_to_non_nullable
as String,wifi: null == wifi ? _self.wifi : wifi // ignore: cast_nullable_to_non_nullable
as WifiInfo,firmware: null == firmware ? _self.firmware : firmware // ignore: cast_nullable_to_non_nullable
as FirmwareInfo,modbus: null == modbus ? _self.modbus : modbus // ignore: cast_nullable_to_non_nullable
as ModbusLinkStats,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as StreamStats,modbusLinkUp: null == modbusLinkUp ? _self.modbusLinkUp : modbusLinkUp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of GatewayHealth
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WifiInfoCopyWith<$Res> get wifi {
  
  return $WifiInfoCopyWith<$Res>(_self.wifi, (value) {
    return _then(_self.copyWith(wifi: value));
  });
}/// Create a copy of GatewayHealth
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirmwareInfoCopyWith<$Res> get firmware {
  
  return $FirmwareInfoCopyWith<$Res>(_self.firmware, (value) {
    return _then(_self.copyWith(firmware: value));
  });
}/// Create a copy of GatewayHealth
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModbusLinkStatsCopyWith<$Res> get modbus {
  
  return $ModbusLinkStatsCopyWith<$Res>(_self.modbus, (value) {
    return _then(_self.copyWith(modbus: value));
  });
}/// Create a copy of GatewayHealth
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreamStatsCopyWith<$Res> get stream {
  
  return $StreamStatsCopyWith<$Res>(_self.stream, (value) {
    return _then(_self.copyWith(stream: value));
  });
}
}

/// @nodoc
mixin _$WifiInfo {

 String get ssid; int get rssi; String get ip; String get hostname; String get mac; int get channel;
/// Create a copy of WifiInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiInfoCopyWith<WifiInfo> get copyWith => _$WifiInfoCopyWithImpl<WifiInfo>(this as WifiInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiInfo&&(identical(other.ssid, ssid) || other.ssid == ssid)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.hostname, hostname) || other.hostname == hostname)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.channel, channel) || other.channel == channel));
}


@override
int get hashCode => Object.hash(runtimeType,ssid,rssi,ip,hostname,mac,channel);

@override
String toString() {
  return 'WifiInfo(ssid: $ssid, rssi: $rssi, ip: $ip, hostname: $hostname, mac: $mac, channel: $channel)';
}


}

/// @nodoc
abstract mixin class $WifiInfoCopyWith<$Res>  {
  factory $WifiInfoCopyWith(WifiInfo value, $Res Function(WifiInfo) _then) = _$WifiInfoCopyWithImpl;
@useResult
$Res call({
 String ssid, int rssi, String ip, String hostname, String mac, int channel
});




}
/// @nodoc
class _$WifiInfoCopyWithImpl<$Res>
    implements $WifiInfoCopyWith<$Res> {
  _$WifiInfoCopyWithImpl(this._self, this._then);

  final WifiInfo _self;
  final $Res Function(WifiInfo) _then;

/// Create a copy of WifiInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ssid = null,Object? rssi = null,Object? ip = null,Object? hostname = null,Object? mac = null,Object? channel = null,}) {
  return _then(_self.copyWith(
ssid: null == ssid ? _self.ssid : ssid // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,hostname: null == hostname ? _self.hostname : hostname // ignore: cast_nullable_to_non_nullable
as String,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WifiInfo].
extension WifiInfoPatterns on WifiInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WifiInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WifiInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WifiInfo value)  $default,){
final _that = this;
switch (_that) {
case _WifiInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WifiInfo value)?  $default,){
final _that = this;
switch (_that) {
case _WifiInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ssid,  int rssi,  String ip,  String hostname,  String mac,  int channel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WifiInfo() when $default != null:
return $default(_that.ssid,_that.rssi,_that.ip,_that.hostname,_that.mac,_that.channel);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ssid,  int rssi,  String ip,  String hostname,  String mac,  int channel)  $default,) {final _that = this;
switch (_that) {
case _WifiInfo():
return $default(_that.ssid,_that.rssi,_that.ip,_that.hostname,_that.mac,_that.channel);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ssid,  int rssi,  String ip,  String hostname,  String mac,  int channel)?  $default,) {final _that = this;
switch (_that) {
case _WifiInfo() when $default != null:
return $default(_that.ssid,_that.rssi,_that.ip,_that.hostname,_that.mac,_that.channel);case _:
  return null;

}
}

}

/// @nodoc


class _WifiInfo extends WifiInfo {
  const _WifiInfo({required this.ssid, required this.rssi, required this.ip, required this.hostname, required this.mac, required this.channel}): super._();
  

@override final  String ssid;
@override final  int rssi;
@override final  String ip;
@override final  String hostname;
@override final  String mac;
@override final  int channel;

/// Create a copy of WifiInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WifiInfoCopyWith<_WifiInfo> get copyWith => __$WifiInfoCopyWithImpl<_WifiInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WifiInfo&&(identical(other.ssid, ssid) || other.ssid == ssid)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.hostname, hostname) || other.hostname == hostname)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.channel, channel) || other.channel == channel));
}


@override
int get hashCode => Object.hash(runtimeType,ssid,rssi,ip,hostname,mac,channel);

@override
String toString() {
  return 'WifiInfo(ssid: $ssid, rssi: $rssi, ip: $ip, hostname: $hostname, mac: $mac, channel: $channel)';
}


}

/// @nodoc
abstract mixin class _$WifiInfoCopyWith<$Res> implements $WifiInfoCopyWith<$Res> {
  factory _$WifiInfoCopyWith(_WifiInfo value, $Res Function(_WifiInfo) _then) = __$WifiInfoCopyWithImpl;
@override @useResult
$Res call({
 String ssid, int rssi, String ip, String hostname, String mac, int channel
});




}
/// @nodoc
class __$WifiInfoCopyWithImpl<$Res>
    implements _$WifiInfoCopyWith<$Res> {
  __$WifiInfoCopyWithImpl(this._self, this._then);

  final _WifiInfo _self;
  final $Res Function(_WifiInfo) _then;

/// Create a copy of WifiInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ssid = null,Object? rssi = null,Object? ip = null,Object? hostname = null,Object? mac = null,Object? channel = null,}) {
  return _then(_WifiInfo(
ssid: null == ssid ? _self.ssid : ssid // ignore: cast_nullable_to_non_nullable
as String,rssi: null == rssi ? _self.rssi : rssi // ignore: cast_nullable_to_non_nullable
as int,ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,hostname: null == hostname ? _self.hostname : hostname // ignore: cast_nullable_to_non_nullable
as String,mac: null == mac ? _self.mac : mac // ignore: cast_nullable_to_non_nullable
as String,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$FirmwareInfo {

 String get version; String get buildTime; String get arduinoCore; String get idf; String get chip;
/// Create a copy of FirmwareInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirmwareInfoCopyWith<FirmwareInfo> get copyWith => _$FirmwareInfoCopyWithImpl<FirmwareInfo>(this as FirmwareInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirmwareInfo&&(identical(other.version, version) || other.version == version)&&(identical(other.buildTime, buildTime) || other.buildTime == buildTime)&&(identical(other.arduinoCore, arduinoCore) || other.arduinoCore == arduinoCore)&&(identical(other.idf, idf) || other.idf == idf)&&(identical(other.chip, chip) || other.chip == chip));
}


@override
int get hashCode => Object.hash(runtimeType,version,buildTime,arduinoCore,idf,chip);

@override
String toString() {
  return 'FirmwareInfo(version: $version, buildTime: $buildTime, arduinoCore: $arduinoCore, idf: $idf, chip: $chip)';
}


}

/// @nodoc
abstract mixin class $FirmwareInfoCopyWith<$Res>  {
  factory $FirmwareInfoCopyWith(FirmwareInfo value, $Res Function(FirmwareInfo) _then) = _$FirmwareInfoCopyWithImpl;
@useResult
$Res call({
 String version, String buildTime, String arduinoCore, String idf, String chip
});




}
/// @nodoc
class _$FirmwareInfoCopyWithImpl<$Res>
    implements $FirmwareInfoCopyWith<$Res> {
  _$FirmwareInfoCopyWithImpl(this._self, this._then);

  final FirmwareInfo _self;
  final $Res Function(FirmwareInfo) _then;

/// Create a copy of FirmwareInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? buildTime = null,Object? arduinoCore = null,Object? idf = null,Object? chip = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,buildTime: null == buildTime ? _self.buildTime : buildTime // ignore: cast_nullable_to_non_nullable
as String,arduinoCore: null == arduinoCore ? _self.arduinoCore : arduinoCore // ignore: cast_nullable_to_non_nullable
as String,idf: null == idf ? _self.idf : idf // ignore: cast_nullable_to_non_nullable
as String,chip: null == chip ? _self.chip : chip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FirmwareInfo].
extension FirmwareInfoPatterns on FirmwareInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FirmwareInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FirmwareInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FirmwareInfo value)  $default,){
final _that = this;
switch (_that) {
case _FirmwareInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FirmwareInfo value)?  $default,){
final _that = this;
switch (_that) {
case _FirmwareInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version,  String buildTime,  String arduinoCore,  String idf,  String chip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FirmwareInfo() when $default != null:
return $default(_that.version,_that.buildTime,_that.arduinoCore,_that.idf,_that.chip);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version,  String buildTime,  String arduinoCore,  String idf,  String chip)  $default,) {final _that = this;
switch (_that) {
case _FirmwareInfo():
return $default(_that.version,_that.buildTime,_that.arduinoCore,_that.idf,_that.chip);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version,  String buildTime,  String arduinoCore,  String idf,  String chip)?  $default,) {final _that = this;
switch (_that) {
case _FirmwareInfo() when $default != null:
return $default(_that.version,_that.buildTime,_that.arduinoCore,_that.idf,_that.chip);case _:
  return null;

}
}

}

/// @nodoc


class _FirmwareInfo implements FirmwareInfo {
  const _FirmwareInfo({required this.version, required this.buildTime, required this.arduinoCore, required this.idf, required this.chip});
  

@override final  String version;
@override final  String buildTime;
@override final  String arduinoCore;
@override final  String idf;
@override final  String chip;

/// Create a copy of FirmwareInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FirmwareInfoCopyWith<_FirmwareInfo> get copyWith => __$FirmwareInfoCopyWithImpl<_FirmwareInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirmwareInfo&&(identical(other.version, version) || other.version == version)&&(identical(other.buildTime, buildTime) || other.buildTime == buildTime)&&(identical(other.arduinoCore, arduinoCore) || other.arduinoCore == arduinoCore)&&(identical(other.idf, idf) || other.idf == idf)&&(identical(other.chip, chip) || other.chip == chip));
}


@override
int get hashCode => Object.hash(runtimeType,version,buildTime,arduinoCore,idf,chip);

@override
String toString() {
  return 'FirmwareInfo(version: $version, buildTime: $buildTime, arduinoCore: $arduinoCore, idf: $idf, chip: $chip)';
}


}

/// @nodoc
abstract mixin class _$FirmwareInfoCopyWith<$Res> implements $FirmwareInfoCopyWith<$Res> {
  factory _$FirmwareInfoCopyWith(_FirmwareInfo value, $Res Function(_FirmwareInfo) _then) = __$FirmwareInfoCopyWithImpl;
@override @useResult
$Res call({
 String version, String buildTime, String arduinoCore, String idf, String chip
});




}
/// @nodoc
class __$FirmwareInfoCopyWithImpl<$Res>
    implements _$FirmwareInfoCopyWith<$Res> {
  __$FirmwareInfoCopyWithImpl(this._self, this._then);

  final _FirmwareInfo _self;
  final $Res Function(_FirmwareInfo) _then;

/// Create a copy of FirmwareInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? buildTime = null,Object? arduinoCore = null,Object? idf = null,Object? chip = null,}) {
  return _then(_FirmwareInfo(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,buildTime: null == buildTime ? _self.buildTime : buildTime // ignore: cast_nullable_to_non_nullable
as String,arduinoCore: null == arduinoCore ? _self.arduinoCore : arduinoCore // ignore: cast_nullable_to_non_nullable
as String,idf: null == idf ? _self.idf : idf // ignore: cast_nullable_to_non_nullable
as String,chip: null == chip ? _self.chip : chip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ModbusLinkStats {

 int get okCount; int get errorCount; String get lastResult; int? get lastSlave; int? get lastAttemptAtMs; int? get lastSuccessAtMs; int get cacheHits; int get baud; String get format; int get responseTimeoutMs;
/// Create a copy of ModbusLinkStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModbusLinkStatsCopyWith<ModbusLinkStats> get copyWith => _$ModbusLinkStatsCopyWithImpl<ModbusLinkStats>(this as ModbusLinkStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModbusLinkStats&&(identical(other.okCount, okCount) || other.okCount == okCount)&&(identical(other.errorCount, errorCount) || other.errorCount == errorCount)&&(identical(other.lastResult, lastResult) || other.lastResult == lastResult)&&(identical(other.lastSlave, lastSlave) || other.lastSlave == lastSlave)&&(identical(other.lastAttemptAtMs, lastAttemptAtMs) || other.lastAttemptAtMs == lastAttemptAtMs)&&(identical(other.lastSuccessAtMs, lastSuccessAtMs) || other.lastSuccessAtMs == lastSuccessAtMs)&&(identical(other.cacheHits, cacheHits) || other.cacheHits == cacheHits)&&(identical(other.baud, baud) || other.baud == baud)&&(identical(other.format, format) || other.format == format)&&(identical(other.responseTimeoutMs, responseTimeoutMs) || other.responseTimeoutMs == responseTimeoutMs));
}


@override
int get hashCode => Object.hash(runtimeType,okCount,errorCount,lastResult,lastSlave,lastAttemptAtMs,lastSuccessAtMs,cacheHits,baud,format,responseTimeoutMs);

@override
String toString() {
  return 'ModbusLinkStats(okCount: $okCount, errorCount: $errorCount, lastResult: $lastResult, lastSlave: $lastSlave, lastAttemptAtMs: $lastAttemptAtMs, lastSuccessAtMs: $lastSuccessAtMs, cacheHits: $cacheHits, baud: $baud, format: $format, responseTimeoutMs: $responseTimeoutMs)';
}


}

/// @nodoc
abstract mixin class $ModbusLinkStatsCopyWith<$Res>  {
  factory $ModbusLinkStatsCopyWith(ModbusLinkStats value, $Res Function(ModbusLinkStats) _then) = _$ModbusLinkStatsCopyWithImpl;
@useResult
$Res call({
 int okCount, int errorCount, String lastResult, int? lastSlave, int? lastAttemptAtMs, int? lastSuccessAtMs, int cacheHits, int baud, String format, int responseTimeoutMs
});




}
/// @nodoc
class _$ModbusLinkStatsCopyWithImpl<$Res>
    implements $ModbusLinkStatsCopyWith<$Res> {
  _$ModbusLinkStatsCopyWithImpl(this._self, this._then);

  final ModbusLinkStats _self;
  final $Res Function(ModbusLinkStats) _then;

/// Create a copy of ModbusLinkStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? okCount = null,Object? errorCount = null,Object? lastResult = null,Object? lastSlave = freezed,Object? lastAttemptAtMs = freezed,Object? lastSuccessAtMs = freezed,Object? cacheHits = null,Object? baud = null,Object? format = null,Object? responseTimeoutMs = null,}) {
  return _then(_self.copyWith(
okCount: null == okCount ? _self.okCount : okCount // ignore: cast_nullable_to_non_nullable
as int,errorCount: null == errorCount ? _self.errorCount : errorCount // ignore: cast_nullable_to_non_nullable
as int,lastResult: null == lastResult ? _self.lastResult : lastResult // ignore: cast_nullable_to_non_nullable
as String,lastSlave: freezed == lastSlave ? _self.lastSlave : lastSlave // ignore: cast_nullable_to_non_nullable
as int?,lastAttemptAtMs: freezed == lastAttemptAtMs ? _self.lastAttemptAtMs : lastAttemptAtMs // ignore: cast_nullable_to_non_nullable
as int?,lastSuccessAtMs: freezed == lastSuccessAtMs ? _self.lastSuccessAtMs : lastSuccessAtMs // ignore: cast_nullable_to_non_nullable
as int?,cacheHits: null == cacheHits ? _self.cacheHits : cacheHits // ignore: cast_nullable_to_non_nullable
as int,baud: null == baud ? _self.baud : baud // ignore: cast_nullable_to_non_nullable
as int,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,responseTimeoutMs: null == responseTimeoutMs ? _self.responseTimeoutMs : responseTimeoutMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ModbusLinkStats].
extension ModbusLinkStatsPatterns on ModbusLinkStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModbusLinkStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModbusLinkStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModbusLinkStats value)  $default,){
final _that = this;
switch (_that) {
case _ModbusLinkStats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModbusLinkStats value)?  $default,){
final _that = this;
switch (_that) {
case _ModbusLinkStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int okCount,  int errorCount,  String lastResult,  int? lastSlave,  int? lastAttemptAtMs,  int? lastSuccessAtMs,  int cacheHits,  int baud,  String format,  int responseTimeoutMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModbusLinkStats() when $default != null:
return $default(_that.okCount,_that.errorCount,_that.lastResult,_that.lastSlave,_that.lastAttemptAtMs,_that.lastSuccessAtMs,_that.cacheHits,_that.baud,_that.format,_that.responseTimeoutMs);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int okCount,  int errorCount,  String lastResult,  int? lastSlave,  int? lastAttemptAtMs,  int? lastSuccessAtMs,  int cacheHits,  int baud,  String format,  int responseTimeoutMs)  $default,) {final _that = this;
switch (_that) {
case _ModbusLinkStats():
return $default(_that.okCount,_that.errorCount,_that.lastResult,_that.lastSlave,_that.lastAttemptAtMs,_that.lastSuccessAtMs,_that.cacheHits,_that.baud,_that.format,_that.responseTimeoutMs);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int okCount,  int errorCount,  String lastResult,  int? lastSlave,  int? lastAttemptAtMs,  int? lastSuccessAtMs,  int cacheHits,  int baud,  String format,  int responseTimeoutMs)?  $default,) {final _that = this;
switch (_that) {
case _ModbusLinkStats() when $default != null:
return $default(_that.okCount,_that.errorCount,_that.lastResult,_that.lastSlave,_that.lastAttemptAtMs,_that.lastSuccessAtMs,_that.cacheHits,_that.baud,_that.format,_that.responseTimeoutMs);case _:
  return null;

}
}

}

/// @nodoc


class _ModbusLinkStats implements ModbusLinkStats {
  const _ModbusLinkStats({required this.okCount, required this.errorCount, required this.lastResult, this.lastSlave, this.lastAttemptAtMs, this.lastSuccessAtMs, required this.cacheHits, required this.baud, required this.format, required this.responseTimeoutMs});
  

@override final  int okCount;
@override final  int errorCount;
@override final  String lastResult;
@override final  int? lastSlave;
@override final  int? lastAttemptAtMs;
@override final  int? lastSuccessAtMs;
@override final  int cacheHits;
@override final  int baud;
@override final  String format;
@override final  int responseTimeoutMs;

/// Create a copy of ModbusLinkStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModbusLinkStatsCopyWith<_ModbusLinkStats> get copyWith => __$ModbusLinkStatsCopyWithImpl<_ModbusLinkStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModbusLinkStats&&(identical(other.okCount, okCount) || other.okCount == okCount)&&(identical(other.errorCount, errorCount) || other.errorCount == errorCount)&&(identical(other.lastResult, lastResult) || other.lastResult == lastResult)&&(identical(other.lastSlave, lastSlave) || other.lastSlave == lastSlave)&&(identical(other.lastAttemptAtMs, lastAttemptAtMs) || other.lastAttemptAtMs == lastAttemptAtMs)&&(identical(other.lastSuccessAtMs, lastSuccessAtMs) || other.lastSuccessAtMs == lastSuccessAtMs)&&(identical(other.cacheHits, cacheHits) || other.cacheHits == cacheHits)&&(identical(other.baud, baud) || other.baud == baud)&&(identical(other.format, format) || other.format == format)&&(identical(other.responseTimeoutMs, responseTimeoutMs) || other.responseTimeoutMs == responseTimeoutMs));
}


@override
int get hashCode => Object.hash(runtimeType,okCount,errorCount,lastResult,lastSlave,lastAttemptAtMs,lastSuccessAtMs,cacheHits,baud,format,responseTimeoutMs);

@override
String toString() {
  return 'ModbusLinkStats(okCount: $okCount, errorCount: $errorCount, lastResult: $lastResult, lastSlave: $lastSlave, lastAttemptAtMs: $lastAttemptAtMs, lastSuccessAtMs: $lastSuccessAtMs, cacheHits: $cacheHits, baud: $baud, format: $format, responseTimeoutMs: $responseTimeoutMs)';
}


}

/// @nodoc
abstract mixin class _$ModbusLinkStatsCopyWith<$Res> implements $ModbusLinkStatsCopyWith<$Res> {
  factory _$ModbusLinkStatsCopyWith(_ModbusLinkStats value, $Res Function(_ModbusLinkStats) _then) = __$ModbusLinkStatsCopyWithImpl;
@override @useResult
$Res call({
 int okCount, int errorCount, String lastResult, int? lastSlave, int? lastAttemptAtMs, int? lastSuccessAtMs, int cacheHits, int baud, String format, int responseTimeoutMs
});




}
/// @nodoc
class __$ModbusLinkStatsCopyWithImpl<$Res>
    implements _$ModbusLinkStatsCopyWith<$Res> {
  __$ModbusLinkStatsCopyWithImpl(this._self, this._then);

  final _ModbusLinkStats _self;
  final $Res Function(_ModbusLinkStats) _then;

/// Create a copy of ModbusLinkStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? okCount = null,Object? errorCount = null,Object? lastResult = null,Object? lastSlave = freezed,Object? lastAttemptAtMs = freezed,Object? lastSuccessAtMs = freezed,Object? cacheHits = null,Object? baud = null,Object? format = null,Object? responseTimeoutMs = null,}) {
  return _then(_ModbusLinkStats(
okCount: null == okCount ? _self.okCount : okCount // ignore: cast_nullable_to_non_nullable
as int,errorCount: null == errorCount ? _self.errorCount : errorCount // ignore: cast_nullable_to_non_nullable
as int,lastResult: null == lastResult ? _self.lastResult : lastResult // ignore: cast_nullable_to_non_nullable
as String,lastSlave: freezed == lastSlave ? _self.lastSlave : lastSlave // ignore: cast_nullable_to_non_nullable
as int?,lastAttemptAtMs: freezed == lastAttemptAtMs ? _self.lastAttemptAtMs : lastAttemptAtMs // ignore: cast_nullable_to_non_nullable
as int?,lastSuccessAtMs: freezed == lastSuccessAtMs ? _self.lastSuccessAtMs : lastSuccessAtMs // ignore: cast_nullable_to_non_nullable
as int?,cacheHits: null == cacheHits ? _self.cacheHits : cacheHits // ignore: cast_nullable_to_non_nullable
as int,baud: null == baud ? _self.baud : baud // ignore: cast_nullable_to_non_nullable
as int,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,responseTimeoutMs: null == responseTimeoutMs ? _self.responseTimeoutMs : responseTimeoutMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$StreamStats {

 int get clients; int get subscriptions; int get pollBlocks;/// Ocupação do barramento pelo polling (limitada a 70% no firmware).
 double get busLoadPct;
/// Create a copy of StreamStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamStatsCopyWith<StreamStats> get copyWith => _$StreamStatsCopyWithImpl<StreamStats>(this as StreamStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamStats&&(identical(other.clients, clients) || other.clients == clients)&&(identical(other.subscriptions, subscriptions) || other.subscriptions == subscriptions)&&(identical(other.pollBlocks, pollBlocks) || other.pollBlocks == pollBlocks)&&(identical(other.busLoadPct, busLoadPct) || other.busLoadPct == busLoadPct));
}


@override
int get hashCode => Object.hash(runtimeType,clients,subscriptions,pollBlocks,busLoadPct);

@override
String toString() {
  return 'StreamStats(clients: $clients, subscriptions: $subscriptions, pollBlocks: $pollBlocks, busLoadPct: $busLoadPct)';
}


}

/// @nodoc
abstract mixin class $StreamStatsCopyWith<$Res>  {
  factory $StreamStatsCopyWith(StreamStats value, $Res Function(StreamStats) _then) = _$StreamStatsCopyWithImpl;
@useResult
$Res call({
 int clients, int subscriptions, int pollBlocks, double busLoadPct
});




}
/// @nodoc
class _$StreamStatsCopyWithImpl<$Res>
    implements $StreamStatsCopyWith<$Res> {
  _$StreamStatsCopyWithImpl(this._self, this._then);

  final StreamStats _self;
  final $Res Function(StreamStats) _then;

/// Create a copy of StreamStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clients = null,Object? subscriptions = null,Object? pollBlocks = null,Object? busLoadPct = null,}) {
  return _then(_self.copyWith(
clients: null == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as int,subscriptions: null == subscriptions ? _self.subscriptions : subscriptions // ignore: cast_nullable_to_non_nullable
as int,pollBlocks: null == pollBlocks ? _self.pollBlocks : pollBlocks // ignore: cast_nullable_to_non_nullable
as int,busLoadPct: null == busLoadPct ? _self.busLoadPct : busLoadPct // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [StreamStats].
extension StreamStatsPatterns on StreamStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamStats value)  $default,){
final _that = this;
switch (_that) {
case _StreamStats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamStats value)?  $default,){
final _that = this;
switch (_that) {
case _StreamStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int clients,  int subscriptions,  int pollBlocks,  double busLoadPct)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamStats() when $default != null:
return $default(_that.clients,_that.subscriptions,_that.pollBlocks,_that.busLoadPct);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int clients,  int subscriptions,  int pollBlocks,  double busLoadPct)  $default,) {final _that = this;
switch (_that) {
case _StreamStats():
return $default(_that.clients,_that.subscriptions,_that.pollBlocks,_that.busLoadPct);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int clients,  int subscriptions,  int pollBlocks,  double busLoadPct)?  $default,) {final _that = this;
switch (_that) {
case _StreamStats() when $default != null:
return $default(_that.clients,_that.subscriptions,_that.pollBlocks,_that.busLoadPct);case _:
  return null;

}
}

}

/// @nodoc


class _StreamStats implements StreamStats {
  const _StreamStats({required this.clients, required this.subscriptions, required this.pollBlocks, required this.busLoadPct});
  

@override final  int clients;
@override final  int subscriptions;
@override final  int pollBlocks;
/// Ocupação do barramento pelo polling (limitada a 70% no firmware).
@override final  double busLoadPct;

/// Create a copy of StreamStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamStatsCopyWith<_StreamStats> get copyWith => __$StreamStatsCopyWithImpl<_StreamStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamStats&&(identical(other.clients, clients) || other.clients == clients)&&(identical(other.subscriptions, subscriptions) || other.subscriptions == subscriptions)&&(identical(other.pollBlocks, pollBlocks) || other.pollBlocks == pollBlocks)&&(identical(other.busLoadPct, busLoadPct) || other.busLoadPct == busLoadPct));
}


@override
int get hashCode => Object.hash(runtimeType,clients,subscriptions,pollBlocks,busLoadPct);

@override
String toString() {
  return 'StreamStats(clients: $clients, subscriptions: $subscriptions, pollBlocks: $pollBlocks, busLoadPct: $busLoadPct)';
}


}

/// @nodoc
abstract mixin class _$StreamStatsCopyWith<$Res> implements $StreamStatsCopyWith<$Res> {
  factory _$StreamStatsCopyWith(_StreamStats value, $Res Function(_StreamStats) _then) = __$StreamStatsCopyWithImpl;
@override @useResult
$Res call({
 int clients, int subscriptions, int pollBlocks, double busLoadPct
});




}
/// @nodoc
class __$StreamStatsCopyWithImpl<$Res>
    implements _$StreamStatsCopyWith<$Res> {
  __$StreamStatsCopyWithImpl(this._self, this._then);

  final _StreamStats _self;
  final $Res Function(_StreamStats) _then;

/// Create a copy of StreamStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clients = null,Object? subscriptions = null,Object? pollBlocks = null,Object? busLoadPct = null,}) {
  return _then(_StreamStats(
clients: null == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as int,subscriptions: null == subscriptions ? _self.subscriptions : subscriptions // ignore: cast_nullable_to_non_nullable
as int,pollBlocks: null == pollBlocks ? _self.pollBlocks : pollBlocks // ignore: cast_nullable_to_non_nullable
as int,busLoadPct: null == busLoadPct ? _self.busLoadPct : busLoadPct // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
