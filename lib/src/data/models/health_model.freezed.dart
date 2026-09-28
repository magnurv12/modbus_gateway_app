// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HealthModel {

 int get uptimeMs; int get freeHeap; String get resetReason; WifiModel get wifi; FirmwareModel get firmware; ModbusStatsModel get modbus; StreamStatsModel get stream; bool get modbusLinkUp;
/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthModelCopyWith<HealthModel> get copyWith => _$HealthModelCopyWithImpl<HealthModel>(this as HealthModel, _$identity);

  /// Serializes this HealthModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthModel&&(identical(other.uptimeMs, uptimeMs) || other.uptimeMs == uptimeMs)&&(identical(other.freeHeap, freeHeap) || other.freeHeap == freeHeap)&&(identical(other.resetReason, resetReason) || other.resetReason == resetReason)&&(identical(other.wifi, wifi) || other.wifi == wifi)&&(identical(other.firmware, firmware) || other.firmware == firmware)&&(identical(other.modbus, modbus) || other.modbus == modbus)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.modbusLinkUp, modbusLinkUp) || other.modbusLinkUp == modbusLinkUp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uptimeMs,freeHeap,resetReason,wifi,firmware,modbus,stream,modbusLinkUp);

@override
String toString() {
  return 'HealthModel(uptimeMs: $uptimeMs, freeHeap: $freeHeap, resetReason: $resetReason, wifi: $wifi, firmware: $firmware, modbus: $modbus, stream: $stream, modbusLinkUp: $modbusLinkUp)';
}


}

/// @nodoc
abstract mixin class $HealthModelCopyWith<$Res>  {
  factory $HealthModelCopyWith(HealthModel value, $Res Function(HealthModel) _then) = _$HealthModelCopyWithImpl;
@useResult
$Res call({
 int uptimeMs, int freeHeap, String resetReason, WifiModel wifi, FirmwareModel firmware, ModbusStatsModel modbus, StreamStatsModel stream, bool modbusLinkUp
});


$WifiModelCopyWith<$Res> get wifi;$FirmwareModelCopyWith<$Res> get firmware;$ModbusStatsModelCopyWith<$Res> get modbus;$StreamStatsModelCopyWith<$Res> get stream;

}
/// @nodoc
class _$HealthModelCopyWithImpl<$Res>
    implements $HealthModelCopyWith<$Res> {
  _$HealthModelCopyWithImpl(this._self, this._then);

  final HealthModel _self;
  final $Res Function(HealthModel) _then;

/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uptimeMs = null,Object? freeHeap = null,Object? resetReason = null,Object? wifi = null,Object? firmware = null,Object? modbus = null,Object? stream = null,Object? modbusLinkUp = null,}) {
  return _then(_self.copyWith(
uptimeMs: null == uptimeMs ? _self.uptimeMs : uptimeMs // ignore: cast_nullable_to_non_nullable
as int,freeHeap: null == freeHeap ? _self.freeHeap : freeHeap // ignore: cast_nullable_to_non_nullable
as int,resetReason: null == resetReason ? _self.resetReason : resetReason // ignore: cast_nullable_to_non_nullable
as String,wifi: null == wifi ? _self.wifi : wifi // ignore: cast_nullable_to_non_nullable
as WifiModel,firmware: null == firmware ? _self.firmware : firmware // ignore: cast_nullable_to_non_nullable
as FirmwareModel,modbus: null == modbus ? _self.modbus : modbus // ignore: cast_nullable_to_non_nullable
as ModbusStatsModel,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as StreamStatsModel,modbusLinkUp: null == modbusLinkUp ? _self.modbusLinkUp : modbusLinkUp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WifiModelCopyWith<$Res> get wifi {
  
  return $WifiModelCopyWith<$Res>(_self.wifi, (value) {
    return _then(_self.copyWith(wifi: value));
  });
}/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirmwareModelCopyWith<$Res> get firmware {
  
  return $FirmwareModelCopyWith<$Res>(_self.firmware, (value) {
    return _then(_self.copyWith(firmware: value));
  });
}/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModbusStatsModelCopyWith<$Res> get modbus {
  
  return $ModbusStatsModelCopyWith<$Res>(_self.modbus, (value) {
    return _then(_self.copyWith(modbus: value));
  });
}/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreamStatsModelCopyWith<$Res> get stream {
  
  return $StreamStatsModelCopyWith<$Res>(_self.stream, (value) {
    return _then(_self.copyWith(stream: value));
  });
}
}


/// Adds pattern-matching-related methods to [HealthModel].
extension HealthModelPatterns on HealthModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthModel value)  $default,){
final _that = this;
switch (_that) {
case _HealthModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthModel value)?  $default,){
final _that = this;
switch (_that) {
case _HealthModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int uptimeMs,  int freeHeap,  String resetReason,  WifiModel wifi,  FirmwareModel firmware,  ModbusStatsModel modbus,  StreamStatsModel stream,  bool modbusLinkUp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthModel() when $default != null:
return $default(_that.uptimeMs,_that.freeHeap,_that.resetReason,_that.wifi,_that.firmware,_that.modbus,_that.stream,_that.modbusLinkUp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int uptimeMs,  int freeHeap,  String resetReason,  WifiModel wifi,  FirmwareModel firmware,  ModbusStatsModel modbus,  StreamStatsModel stream,  bool modbusLinkUp)  $default,) {final _that = this;
switch (_that) {
case _HealthModel():
return $default(_that.uptimeMs,_that.freeHeap,_that.resetReason,_that.wifi,_that.firmware,_that.modbus,_that.stream,_that.modbusLinkUp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int uptimeMs,  int freeHeap,  String resetReason,  WifiModel wifi,  FirmwareModel firmware,  ModbusStatsModel modbus,  StreamStatsModel stream,  bool modbusLinkUp)?  $default,) {final _that = this;
switch (_that) {
case _HealthModel() when $default != null:
return $default(_that.uptimeMs,_that.freeHeap,_that.resetReason,_that.wifi,_that.firmware,_that.modbus,_that.stream,_that.modbusLinkUp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthModel extends HealthModel {
  const _HealthModel({required this.uptimeMs, required this.freeHeap, this.resetReason = 'unknown', this.wifi = const WifiModel(), this.firmware = const FirmwareModel(), this.modbus = const ModbusStatsModel(), this.stream = const StreamStatsModel(), this.modbusLinkUp = false}): super._();
  factory _HealthModel.fromJson(Map<String, dynamic> json) => _$HealthModelFromJson(json);

@override final  int uptimeMs;
@override final  int freeHeap;
@override@JsonKey() final  String resetReason;
@override@JsonKey() final  WifiModel wifi;
@override@JsonKey() final  FirmwareModel firmware;
@override@JsonKey() final  ModbusStatsModel modbus;
@override@JsonKey() final  StreamStatsModel stream;
@override@JsonKey() final  bool modbusLinkUp;

/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthModelCopyWith<_HealthModel> get copyWith => __$HealthModelCopyWithImpl<_HealthModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthModel&&(identical(other.uptimeMs, uptimeMs) || other.uptimeMs == uptimeMs)&&(identical(other.freeHeap, freeHeap) || other.freeHeap == freeHeap)&&(identical(other.resetReason, resetReason) || other.resetReason == resetReason)&&(identical(other.wifi, wifi) || other.wifi == wifi)&&(identical(other.firmware, firmware) || other.firmware == firmware)&&(identical(other.modbus, modbus) || other.modbus == modbus)&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.modbusLinkUp, modbusLinkUp) || other.modbusLinkUp == modbusLinkUp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uptimeMs,freeHeap,resetReason,wifi,firmware,modbus,stream,modbusLinkUp);

@override
String toString() {
  return 'HealthModel(uptimeMs: $uptimeMs, freeHeap: $freeHeap, resetReason: $resetReason, wifi: $wifi, firmware: $firmware, modbus: $modbus, stream: $stream, modbusLinkUp: $modbusLinkUp)';
}


}

/// @nodoc
abstract mixin class _$HealthModelCopyWith<$Res> implements $HealthModelCopyWith<$Res> {
  factory _$HealthModelCopyWith(_HealthModel value, $Res Function(_HealthModel) _then) = __$HealthModelCopyWithImpl;
@override @useResult
$Res call({
 int uptimeMs, int freeHeap, String resetReason, WifiModel wifi, FirmwareModel firmware, ModbusStatsModel modbus, StreamStatsModel stream, bool modbusLinkUp
});


@override $WifiModelCopyWith<$Res> get wifi;@override $FirmwareModelCopyWith<$Res> get firmware;@override $ModbusStatsModelCopyWith<$Res> get modbus;@override $StreamStatsModelCopyWith<$Res> get stream;

}
/// @nodoc
class __$HealthModelCopyWithImpl<$Res>
    implements _$HealthModelCopyWith<$Res> {
  __$HealthModelCopyWithImpl(this._self, this._then);

  final _HealthModel _self;
  final $Res Function(_HealthModel) _then;

/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uptimeMs = null,Object? freeHeap = null,Object? resetReason = null,Object? wifi = null,Object? firmware = null,Object? modbus = null,Object? stream = null,Object? modbusLinkUp = null,}) {
  return _then(_HealthModel(
uptimeMs: null == uptimeMs ? _self.uptimeMs : uptimeMs // ignore: cast_nullable_to_non_nullable
as int,freeHeap: null == freeHeap ? _self.freeHeap : freeHeap // ignore: cast_nullable_to_non_nullable
as int,resetReason: null == resetReason ? _self.resetReason : resetReason // ignore: cast_nullable_to_non_nullable
as String,wifi: null == wifi ? _self.wifi : wifi // ignore: cast_nullable_to_non_nullable
as WifiModel,firmware: null == firmware ? _self.firmware : firmware // ignore: cast_nullable_to_non_nullable
as FirmwareModel,modbus: null == modbus ? _self.modbus : modbus // ignore: cast_nullable_to_non_nullable
as ModbusStatsModel,stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as StreamStatsModel,modbusLinkUp: null == modbusLinkUp ? _self.modbusLinkUp : modbusLinkUp // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WifiModelCopyWith<$Res> get wifi {
  
  return $WifiModelCopyWith<$Res>(_self.wifi, (value) {
    return _then(_self.copyWith(wifi: value));
  });
}/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirmwareModelCopyWith<$Res> get firmware {
  
  return $FirmwareModelCopyWith<$Res>(_self.firmware, (value) {
    return _then(_self.copyWith(firmware: value));
  });
}/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModbusStatsModelCopyWith<$Res> get modbus {
  
  return $ModbusStatsModelCopyWith<$Res>(_self.modbus, (value) {
    return _then(_self.copyWith(modbus: value));
  });
}/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StreamStatsModelCopyWith<$Res> get stream {
  
  return $StreamStatsModelCopyWith<$Res>(_self.stream, (value) {
    return _then(_self.copyWith(stream: value));
  });
}
}


/// @nodoc
mixin _$WifiModel {

 String get ssid; int get rssi; String get ip; String get hostname; String get mac; int get channel;
/// Create a copy of WifiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiModelCopyWith<WifiModel> get copyWith => _$WifiModelCopyWithImpl<WifiModel>(this as WifiModel, _$identity);

  /// Serializes this WifiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiModel&&(identical(other.ssid, ssid) || other.ssid == ssid)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.hostname, hostname) || other.hostname == hostname)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.channel, channel) || other.channel == channel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ssid,rssi,ip,hostname,mac,channel);

@override
String toString() {
  return 'WifiModel(ssid: $ssid, rssi: $rssi, ip: $ip, hostname: $hostname, mac: $mac, channel: $channel)';
}


}

/// @nodoc
abstract mixin class $WifiModelCopyWith<$Res>  {
  factory $WifiModelCopyWith(WifiModel value, $Res Function(WifiModel) _then) = _$WifiModelCopyWithImpl;
@useResult
$Res call({
 String ssid, int rssi, String ip, String hostname, String mac, int channel
});




}
/// @nodoc
class _$WifiModelCopyWithImpl<$Res>
    implements $WifiModelCopyWith<$Res> {
  _$WifiModelCopyWithImpl(this._self, this._then);

  final WifiModel _self;
  final $Res Function(WifiModel) _then;

/// Create a copy of WifiModel
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


/// Adds pattern-matching-related methods to [WifiModel].
extension WifiModelPatterns on WifiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WifiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WifiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WifiModel value)  $default,){
final _that = this;
switch (_that) {
case _WifiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WifiModel value)?  $default,){
final _that = this;
switch (_that) {
case _WifiModel() when $default != null:
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
case _WifiModel() when $default != null:
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
case _WifiModel():
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
case _WifiModel() when $default != null:
return $default(_that.ssid,_that.rssi,_that.ip,_that.hostname,_that.mac,_that.channel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WifiModel implements WifiModel {
  const _WifiModel({this.ssid = '', this.rssi = 0, this.ip = '', this.hostname = '', this.mac = '', this.channel = 0});
  factory _WifiModel.fromJson(Map<String, dynamic> json) => _$WifiModelFromJson(json);

@override@JsonKey() final  String ssid;
@override@JsonKey() final  int rssi;
@override@JsonKey() final  String ip;
@override@JsonKey() final  String hostname;
@override@JsonKey() final  String mac;
@override@JsonKey() final  int channel;

/// Create a copy of WifiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WifiModelCopyWith<_WifiModel> get copyWith => __$WifiModelCopyWithImpl<_WifiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WifiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WifiModel&&(identical(other.ssid, ssid) || other.ssid == ssid)&&(identical(other.rssi, rssi) || other.rssi == rssi)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.hostname, hostname) || other.hostname == hostname)&&(identical(other.mac, mac) || other.mac == mac)&&(identical(other.channel, channel) || other.channel == channel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ssid,rssi,ip,hostname,mac,channel);

@override
String toString() {
  return 'WifiModel(ssid: $ssid, rssi: $rssi, ip: $ip, hostname: $hostname, mac: $mac, channel: $channel)';
}


}

/// @nodoc
abstract mixin class _$WifiModelCopyWith<$Res> implements $WifiModelCopyWith<$Res> {
  factory _$WifiModelCopyWith(_WifiModel value, $Res Function(_WifiModel) _then) = __$WifiModelCopyWithImpl;
@override @useResult
$Res call({
 String ssid, int rssi, String ip, String hostname, String mac, int channel
});




}
/// @nodoc
class __$WifiModelCopyWithImpl<$Res>
    implements _$WifiModelCopyWith<$Res> {
  __$WifiModelCopyWithImpl(this._self, this._then);

  final _WifiModel _self;
  final $Res Function(_WifiModel) _then;

/// Create a copy of WifiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ssid = null,Object? rssi = null,Object? ip = null,Object? hostname = null,Object? mac = null,Object? channel = null,}) {
  return _then(_WifiModel(
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
mixin _$FirmwareModel {

 String get version; String get buildTime; String get arduinoCore; String get idf; String get chip;
/// Create a copy of FirmwareModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirmwareModelCopyWith<FirmwareModel> get copyWith => _$FirmwareModelCopyWithImpl<FirmwareModel>(this as FirmwareModel, _$identity);

  /// Serializes this FirmwareModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirmwareModel&&(identical(other.version, version) || other.version == version)&&(identical(other.buildTime, buildTime) || other.buildTime == buildTime)&&(identical(other.arduinoCore, arduinoCore) || other.arduinoCore == arduinoCore)&&(identical(other.idf, idf) || other.idf == idf)&&(identical(other.chip, chip) || other.chip == chip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,buildTime,arduinoCore,idf,chip);

@override
String toString() {
  return 'FirmwareModel(version: $version, buildTime: $buildTime, arduinoCore: $arduinoCore, idf: $idf, chip: $chip)';
}


}

/// @nodoc
abstract mixin class $FirmwareModelCopyWith<$Res>  {
  factory $FirmwareModelCopyWith(FirmwareModel value, $Res Function(FirmwareModel) _then) = _$FirmwareModelCopyWithImpl;
@useResult
$Res call({
 String version, String buildTime, String arduinoCore, String idf, String chip
});




}
/// @nodoc
class _$FirmwareModelCopyWithImpl<$Res>
    implements $FirmwareModelCopyWith<$Res> {
  _$FirmwareModelCopyWithImpl(this._self, this._then);

  final FirmwareModel _self;
  final $Res Function(FirmwareModel) _then;

/// Create a copy of FirmwareModel
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


/// Adds pattern-matching-related methods to [FirmwareModel].
extension FirmwareModelPatterns on FirmwareModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FirmwareModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FirmwareModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FirmwareModel value)  $default,){
final _that = this;
switch (_that) {
case _FirmwareModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FirmwareModel value)?  $default,){
final _that = this;
switch (_that) {
case _FirmwareModel() when $default != null:
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
case _FirmwareModel() when $default != null:
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
case _FirmwareModel():
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
case _FirmwareModel() when $default != null:
return $default(_that.version,_that.buildTime,_that.arduinoCore,_that.idf,_that.chip);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FirmwareModel implements FirmwareModel {
  const _FirmwareModel({this.version = 'unknown', this.buildTime = '', this.arduinoCore = '', this.idf = '', this.chip = ''});
  factory _FirmwareModel.fromJson(Map<String, dynamic> json) => _$FirmwareModelFromJson(json);

@override@JsonKey() final  String version;
@override@JsonKey() final  String buildTime;
@override@JsonKey() final  String arduinoCore;
@override@JsonKey() final  String idf;
@override@JsonKey() final  String chip;

/// Create a copy of FirmwareModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FirmwareModelCopyWith<_FirmwareModel> get copyWith => __$FirmwareModelCopyWithImpl<_FirmwareModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FirmwareModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirmwareModel&&(identical(other.version, version) || other.version == version)&&(identical(other.buildTime, buildTime) || other.buildTime == buildTime)&&(identical(other.arduinoCore, arduinoCore) || other.arduinoCore == arduinoCore)&&(identical(other.idf, idf) || other.idf == idf)&&(identical(other.chip, chip) || other.chip == chip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,buildTime,arduinoCore,idf,chip);

@override
String toString() {
  return 'FirmwareModel(version: $version, buildTime: $buildTime, arduinoCore: $arduinoCore, idf: $idf, chip: $chip)';
}


}

/// @nodoc
abstract mixin class _$FirmwareModelCopyWith<$Res> implements $FirmwareModelCopyWith<$Res> {
  factory _$FirmwareModelCopyWith(_FirmwareModel value, $Res Function(_FirmwareModel) _then) = __$FirmwareModelCopyWithImpl;
@override @useResult
$Res call({
 String version, String buildTime, String arduinoCore, String idf, String chip
});




}
/// @nodoc
class __$FirmwareModelCopyWithImpl<$Res>
    implements _$FirmwareModelCopyWith<$Res> {
  __$FirmwareModelCopyWithImpl(this._self, this._then);

  final _FirmwareModel _self;
  final $Res Function(_FirmwareModel) _then;

/// Create a copy of FirmwareModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? buildTime = null,Object? arduinoCore = null,Object? idf = null,Object? chip = null,}) {
  return _then(_FirmwareModel(
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
mixin _$ModbusStatsModel {

 int get okCount; int get errorCount; String get lastResult; int? get lastSlave; int? get lastAttemptAt; int? get lastSuccessAt; int get cacheHits; ModbusConfigModel get config;
/// Create a copy of ModbusStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModbusStatsModelCopyWith<ModbusStatsModel> get copyWith => _$ModbusStatsModelCopyWithImpl<ModbusStatsModel>(this as ModbusStatsModel, _$identity);

  /// Serializes this ModbusStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModbusStatsModel&&(identical(other.okCount, okCount) || other.okCount == okCount)&&(identical(other.errorCount, errorCount) || other.errorCount == errorCount)&&(identical(other.lastResult, lastResult) || other.lastResult == lastResult)&&(identical(other.lastSlave, lastSlave) || other.lastSlave == lastSlave)&&(identical(other.lastAttemptAt, lastAttemptAt) || other.lastAttemptAt == lastAttemptAt)&&(identical(other.lastSuccessAt, lastSuccessAt) || other.lastSuccessAt == lastSuccessAt)&&(identical(other.cacheHits, cacheHits) || other.cacheHits == cacheHits)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,okCount,errorCount,lastResult,lastSlave,lastAttemptAt,lastSuccessAt,cacheHits,config);

@override
String toString() {
  return 'ModbusStatsModel(okCount: $okCount, errorCount: $errorCount, lastResult: $lastResult, lastSlave: $lastSlave, lastAttemptAt: $lastAttemptAt, lastSuccessAt: $lastSuccessAt, cacheHits: $cacheHits, config: $config)';
}


}

/// @nodoc
abstract mixin class $ModbusStatsModelCopyWith<$Res>  {
  factory $ModbusStatsModelCopyWith(ModbusStatsModel value, $Res Function(ModbusStatsModel) _then) = _$ModbusStatsModelCopyWithImpl;
@useResult
$Res call({
 int okCount, int errorCount, String lastResult, int? lastSlave, int? lastAttemptAt, int? lastSuccessAt, int cacheHits, ModbusConfigModel config
});


$ModbusConfigModelCopyWith<$Res> get config;

}
/// @nodoc
class _$ModbusStatsModelCopyWithImpl<$Res>
    implements $ModbusStatsModelCopyWith<$Res> {
  _$ModbusStatsModelCopyWithImpl(this._self, this._then);

  final ModbusStatsModel _self;
  final $Res Function(ModbusStatsModel) _then;

/// Create a copy of ModbusStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? okCount = null,Object? errorCount = null,Object? lastResult = null,Object? lastSlave = freezed,Object? lastAttemptAt = freezed,Object? lastSuccessAt = freezed,Object? cacheHits = null,Object? config = null,}) {
  return _then(_self.copyWith(
okCount: null == okCount ? _self.okCount : okCount // ignore: cast_nullable_to_non_nullable
as int,errorCount: null == errorCount ? _self.errorCount : errorCount // ignore: cast_nullable_to_non_nullable
as int,lastResult: null == lastResult ? _self.lastResult : lastResult // ignore: cast_nullable_to_non_nullable
as String,lastSlave: freezed == lastSlave ? _self.lastSlave : lastSlave // ignore: cast_nullable_to_non_nullable
as int?,lastAttemptAt: freezed == lastAttemptAt ? _self.lastAttemptAt : lastAttemptAt // ignore: cast_nullable_to_non_nullable
as int?,lastSuccessAt: freezed == lastSuccessAt ? _self.lastSuccessAt : lastSuccessAt // ignore: cast_nullable_to_non_nullable
as int?,cacheHits: null == cacheHits ? _self.cacheHits : cacheHits // ignore: cast_nullable_to_non_nullable
as int,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ModbusConfigModel,
  ));
}
/// Create a copy of ModbusStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModbusConfigModelCopyWith<$Res> get config {
  
  return $ModbusConfigModelCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [ModbusStatsModel].
extension ModbusStatsModelPatterns on ModbusStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModbusStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModbusStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModbusStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _ModbusStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModbusStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ModbusStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int okCount,  int errorCount,  String lastResult,  int? lastSlave,  int? lastAttemptAt,  int? lastSuccessAt,  int cacheHits,  ModbusConfigModel config)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModbusStatsModel() when $default != null:
return $default(_that.okCount,_that.errorCount,_that.lastResult,_that.lastSlave,_that.lastAttemptAt,_that.lastSuccessAt,_that.cacheHits,_that.config);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int okCount,  int errorCount,  String lastResult,  int? lastSlave,  int? lastAttemptAt,  int? lastSuccessAt,  int cacheHits,  ModbusConfigModel config)  $default,) {final _that = this;
switch (_that) {
case _ModbusStatsModel():
return $default(_that.okCount,_that.errorCount,_that.lastResult,_that.lastSlave,_that.lastAttemptAt,_that.lastSuccessAt,_that.cacheHits,_that.config);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int okCount,  int errorCount,  String lastResult,  int? lastSlave,  int? lastAttemptAt,  int? lastSuccessAt,  int cacheHits,  ModbusConfigModel config)?  $default,) {final _that = this;
switch (_that) {
case _ModbusStatsModel() when $default != null:
return $default(_that.okCount,_that.errorCount,_that.lastResult,_that.lastSlave,_that.lastAttemptAt,_that.lastSuccessAt,_that.cacheHits,_that.config);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModbusStatsModel implements ModbusStatsModel {
  const _ModbusStatsModel({this.okCount = 0, this.errorCount = 0, this.lastResult = 'NoRequestYet', this.lastSlave, this.lastAttemptAt, this.lastSuccessAt, this.cacheHits = 0, this.config = const ModbusConfigModel()});
  factory _ModbusStatsModel.fromJson(Map<String, dynamic> json) => _$ModbusStatsModelFromJson(json);

@override@JsonKey() final  int okCount;
@override@JsonKey() final  int errorCount;
@override@JsonKey() final  String lastResult;
@override final  int? lastSlave;
@override final  int? lastAttemptAt;
@override final  int? lastSuccessAt;
@override@JsonKey() final  int cacheHits;
@override@JsonKey() final  ModbusConfigModel config;

/// Create a copy of ModbusStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModbusStatsModelCopyWith<_ModbusStatsModel> get copyWith => __$ModbusStatsModelCopyWithImpl<_ModbusStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModbusStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModbusStatsModel&&(identical(other.okCount, okCount) || other.okCount == okCount)&&(identical(other.errorCount, errorCount) || other.errorCount == errorCount)&&(identical(other.lastResult, lastResult) || other.lastResult == lastResult)&&(identical(other.lastSlave, lastSlave) || other.lastSlave == lastSlave)&&(identical(other.lastAttemptAt, lastAttemptAt) || other.lastAttemptAt == lastAttemptAt)&&(identical(other.lastSuccessAt, lastSuccessAt) || other.lastSuccessAt == lastSuccessAt)&&(identical(other.cacheHits, cacheHits) || other.cacheHits == cacheHits)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,okCount,errorCount,lastResult,lastSlave,lastAttemptAt,lastSuccessAt,cacheHits,config);

@override
String toString() {
  return 'ModbusStatsModel(okCount: $okCount, errorCount: $errorCount, lastResult: $lastResult, lastSlave: $lastSlave, lastAttemptAt: $lastAttemptAt, lastSuccessAt: $lastSuccessAt, cacheHits: $cacheHits, config: $config)';
}


}

/// @nodoc
abstract mixin class _$ModbusStatsModelCopyWith<$Res> implements $ModbusStatsModelCopyWith<$Res> {
  factory _$ModbusStatsModelCopyWith(_ModbusStatsModel value, $Res Function(_ModbusStatsModel) _then) = __$ModbusStatsModelCopyWithImpl;
@override @useResult
$Res call({
 int okCount, int errorCount, String lastResult, int? lastSlave, int? lastAttemptAt, int? lastSuccessAt, int cacheHits, ModbusConfigModel config
});


@override $ModbusConfigModelCopyWith<$Res> get config;

}
/// @nodoc
class __$ModbusStatsModelCopyWithImpl<$Res>
    implements _$ModbusStatsModelCopyWith<$Res> {
  __$ModbusStatsModelCopyWithImpl(this._self, this._then);

  final _ModbusStatsModel _self;
  final $Res Function(_ModbusStatsModel) _then;

/// Create a copy of ModbusStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? okCount = null,Object? errorCount = null,Object? lastResult = null,Object? lastSlave = freezed,Object? lastAttemptAt = freezed,Object? lastSuccessAt = freezed,Object? cacheHits = null,Object? config = null,}) {
  return _then(_ModbusStatsModel(
okCount: null == okCount ? _self.okCount : okCount // ignore: cast_nullable_to_non_nullable
as int,errorCount: null == errorCount ? _self.errorCount : errorCount // ignore: cast_nullable_to_non_nullable
as int,lastResult: null == lastResult ? _self.lastResult : lastResult // ignore: cast_nullable_to_non_nullable
as String,lastSlave: freezed == lastSlave ? _self.lastSlave : lastSlave // ignore: cast_nullable_to_non_nullable
as int?,lastAttemptAt: freezed == lastAttemptAt ? _self.lastAttemptAt : lastAttemptAt // ignore: cast_nullable_to_non_nullable
as int?,lastSuccessAt: freezed == lastSuccessAt ? _self.lastSuccessAt : lastSuccessAt // ignore: cast_nullable_to_non_nullable
as int?,cacheHits: null == cacheHits ? _self.cacheHits : cacheHits // ignore: cast_nullable_to_non_nullable
as int,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ModbusConfigModel,
  ));
}

/// Create a copy of ModbusStatsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModbusConfigModelCopyWith<$Res> get config {
  
  return $ModbusConfigModelCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// @nodoc
mixin _$ModbusConfigModel {

 int get baud; String get format; int get responseTimeoutMs; int get defaultSlave;
/// Create a copy of ModbusConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModbusConfigModelCopyWith<ModbusConfigModel> get copyWith => _$ModbusConfigModelCopyWithImpl<ModbusConfigModel>(this as ModbusConfigModel, _$identity);

  /// Serializes this ModbusConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModbusConfigModel&&(identical(other.baud, baud) || other.baud == baud)&&(identical(other.format, format) || other.format == format)&&(identical(other.responseTimeoutMs, responseTimeoutMs) || other.responseTimeoutMs == responseTimeoutMs)&&(identical(other.defaultSlave, defaultSlave) || other.defaultSlave == defaultSlave));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baud,format,responseTimeoutMs,defaultSlave);

@override
String toString() {
  return 'ModbusConfigModel(baud: $baud, format: $format, responseTimeoutMs: $responseTimeoutMs, defaultSlave: $defaultSlave)';
}


}

/// @nodoc
abstract mixin class $ModbusConfigModelCopyWith<$Res>  {
  factory $ModbusConfigModelCopyWith(ModbusConfigModel value, $Res Function(ModbusConfigModel) _then) = _$ModbusConfigModelCopyWithImpl;
@useResult
$Res call({
 int baud, String format, int responseTimeoutMs, int defaultSlave
});




}
/// @nodoc
class _$ModbusConfigModelCopyWithImpl<$Res>
    implements $ModbusConfigModelCopyWith<$Res> {
  _$ModbusConfigModelCopyWithImpl(this._self, this._then);

  final ModbusConfigModel _self;
  final $Res Function(ModbusConfigModel) _then;

/// Create a copy of ModbusConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baud = null,Object? format = null,Object? responseTimeoutMs = null,Object? defaultSlave = null,}) {
  return _then(_self.copyWith(
baud: null == baud ? _self.baud : baud // ignore: cast_nullable_to_non_nullable
as int,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,responseTimeoutMs: null == responseTimeoutMs ? _self.responseTimeoutMs : responseTimeoutMs // ignore: cast_nullable_to_non_nullable
as int,defaultSlave: null == defaultSlave ? _self.defaultSlave : defaultSlave // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ModbusConfigModel].
extension ModbusConfigModelPatterns on ModbusConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModbusConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModbusConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModbusConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _ModbusConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModbusConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _ModbusConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int baud,  String format,  int responseTimeoutMs,  int defaultSlave)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModbusConfigModel() when $default != null:
return $default(_that.baud,_that.format,_that.responseTimeoutMs,_that.defaultSlave);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int baud,  String format,  int responseTimeoutMs,  int defaultSlave)  $default,) {final _that = this;
switch (_that) {
case _ModbusConfigModel():
return $default(_that.baud,_that.format,_that.responseTimeoutMs,_that.defaultSlave);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int baud,  String format,  int responseTimeoutMs,  int defaultSlave)?  $default,) {final _that = this;
switch (_that) {
case _ModbusConfigModel() when $default != null:
return $default(_that.baud,_that.format,_that.responseTimeoutMs,_that.defaultSlave);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModbusConfigModel implements ModbusConfigModel {
  const _ModbusConfigModel({this.baud = 9600, this.format = '8N1', this.responseTimeoutMs = 0, this.defaultSlave = 1});
  factory _ModbusConfigModel.fromJson(Map<String, dynamic> json) => _$ModbusConfigModelFromJson(json);

@override@JsonKey() final  int baud;
@override@JsonKey() final  String format;
@override@JsonKey() final  int responseTimeoutMs;
@override@JsonKey() final  int defaultSlave;

/// Create a copy of ModbusConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModbusConfigModelCopyWith<_ModbusConfigModel> get copyWith => __$ModbusConfigModelCopyWithImpl<_ModbusConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModbusConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModbusConfigModel&&(identical(other.baud, baud) || other.baud == baud)&&(identical(other.format, format) || other.format == format)&&(identical(other.responseTimeoutMs, responseTimeoutMs) || other.responseTimeoutMs == responseTimeoutMs)&&(identical(other.defaultSlave, defaultSlave) || other.defaultSlave == defaultSlave));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baud,format,responseTimeoutMs,defaultSlave);

@override
String toString() {
  return 'ModbusConfigModel(baud: $baud, format: $format, responseTimeoutMs: $responseTimeoutMs, defaultSlave: $defaultSlave)';
}


}

/// @nodoc
abstract mixin class _$ModbusConfigModelCopyWith<$Res> implements $ModbusConfigModelCopyWith<$Res> {
  factory _$ModbusConfigModelCopyWith(_ModbusConfigModel value, $Res Function(_ModbusConfigModel) _then) = __$ModbusConfigModelCopyWithImpl;
@override @useResult
$Res call({
 int baud, String format, int responseTimeoutMs, int defaultSlave
});




}
/// @nodoc
class __$ModbusConfigModelCopyWithImpl<$Res>
    implements _$ModbusConfigModelCopyWith<$Res> {
  __$ModbusConfigModelCopyWithImpl(this._self, this._then);

  final _ModbusConfigModel _self;
  final $Res Function(_ModbusConfigModel) _then;

/// Create a copy of ModbusConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baud = null,Object? format = null,Object? responseTimeoutMs = null,Object? defaultSlave = null,}) {
  return _then(_ModbusConfigModel(
baud: null == baud ? _self.baud : baud // ignore: cast_nullable_to_non_nullable
as int,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,responseTimeoutMs: null == responseTimeoutMs ? _self.responseTimeoutMs : responseTimeoutMs // ignore: cast_nullable_to_non_nullable
as int,defaultSlave: null == defaultSlave ? _self.defaultSlave : defaultSlave // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$StreamStatsModel {

 int get clients; int get subscriptions; int get pollBlocks; double get busLoadPct;
/// Create a copy of StreamStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamStatsModelCopyWith<StreamStatsModel> get copyWith => _$StreamStatsModelCopyWithImpl<StreamStatsModel>(this as StreamStatsModel, _$identity);

  /// Serializes this StreamStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamStatsModel&&(identical(other.clients, clients) || other.clients == clients)&&(identical(other.subscriptions, subscriptions) || other.subscriptions == subscriptions)&&(identical(other.pollBlocks, pollBlocks) || other.pollBlocks == pollBlocks)&&(identical(other.busLoadPct, busLoadPct) || other.busLoadPct == busLoadPct));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clients,subscriptions,pollBlocks,busLoadPct);

@override
String toString() {
  return 'StreamStatsModel(clients: $clients, subscriptions: $subscriptions, pollBlocks: $pollBlocks, busLoadPct: $busLoadPct)';
}


}

/// @nodoc
abstract mixin class $StreamStatsModelCopyWith<$Res>  {
  factory $StreamStatsModelCopyWith(StreamStatsModel value, $Res Function(StreamStatsModel) _then) = _$StreamStatsModelCopyWithImpl;
@useResult
$Res call({
 int clients, int subscriptions, int pollBlocks, double busLoadPct
});




}
/// @nodoc
class _$StreamStatsModelCopyWithImpl<$Res>
    implements $StreamStatsModelCopyWith<$Res> {
  _$StreamStatsModelCopyWithImpl(this._self, this._then);

  final StreamStatsModel _self;
  final $Res Function(StreamStatsModel) _then;

/// Create a copy of StreamStatsModel
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


/// Adds pattern-matching-related methods to [StreamStatsModel].
extension StreamStatsModelPatterns on StreamStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _StreamStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _StreamStatsModel() when $default != null:
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
case _StreamStatsModel() when $default != null:
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
case _StreamStatsModel():
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
case _StreamStatsModel() when $default != null:
return $default(_that.clients,_that.subscriptions,_that.pollBlocks,_that.busLoadPct);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamStatsModel implements StreamStatsModel {
  const _StreamStatsModel({this.clients = 0, this.subscriptions = 0, this.pollBlocks = 0, this.busLoadPct = 0.0});
  factory _StreamStatsModel.fromJson(Map<String, dynamic> json) => _$StreamStatsModelFromJson(json);

@override@JsonKey() final  int clients;
@override@JsonKey() final  int subscriptions;
@override@JsonKey() final  int pollBlocks;
@override@JsonKey() final  double busLoadPct;

/// Create a copy of StreamStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamStatsModelCopyWith<_StreamStatsModel> get copyWith => __$StreamStatsModelCopyWithImpl<_StreamStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamStatsModel&&(identical(other.clients, clients) || other.clients == clients)&&(identical(other.subscriptions, subscriptions) || other.subscriptions == subscriptions)&&(identical(other.pollBlocks, pollBlocks) || other.pollBlocks == pollBlocks)&&(identical(other.busLoadPct, busLoadPct) || other.busLoadPct == busLoadPct));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clients,subscriptions,pollBlocks,busLoadPct);

@override
String toString() {
  return 'StreamStatsModel(clients: $clients, subscriptions: $subscriptions, pollBlocks: $pollBlocks, busLoadPct: $busLoadPct)';
}


}

/// @nodoc
abstract mixin class _$StreamStatsModelCopyWith<$Res> implements $StreamStatsModelCopyWith<$Res> {
  factory _$StreamStatsModelCopyWith(_StreamStatsModel value, $Res Function(_StreamStatsModel) _then) = __$StreamStatsModelCopyWithImpl;
@override @useResult
$Res call({
 int clients, int subscriptions, int pollBlocks, double busLoadPct
});




}
/// @nodoc
class __$StreamStatsModelCopyWithImpl<$Res>
    implements _$StreamStatsModelCopyWith<$Res> {
  __$StreamStatsModelCopyWithImpl(this._self, this._then);

  final _StreamStatsModel _self;
  final $Res Function(_StreamStatsModel) _then;

/// Create a copy of StreamStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clients = null,Object? subscriptions = null,Object? pollBlocks = null,Object? busLoadPct = null,}) {
  return _then(_StreamStatsModel(
clients: null == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as int,subscriptions: null == subscriptions ? _self.subscriptions : subscriptions // ignore: cast_nullable_to_non_nullable
as int,pollBlocks: null == pollBlocks ? _self.pollBlocks : pollBlocks // ignore: cast_nullable_to_non_nullable
as int,busLoadPct: null == busLoadPct ? _self.busLoadPct : busLoadPct // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
