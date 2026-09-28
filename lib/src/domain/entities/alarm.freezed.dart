// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlarmRule {

 AlarmCondition get condition; AlarmSeverity get severity; String get message;/// Limite em unidade de engenharia (para [AlarmCondition.above]/below).
 double? get limit;
/// Create a copy of AlarmRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmRuleCopyWith<AlarmRule> get copyWith => _$AlarmRuleCopyWithImpl<AlarmRule>(this as AlarmRule, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmRule&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.message, message) || other.message == message)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,condition,severity,message,limit);

@override
String toString() {
  return 'AlarmRule(condition: $condition, severity: $severity, message: $message, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $AlarmRuleCopyWith<$Res>  {
  factory $AlarmRuleCopyWith(AlarmRule value, $Res Function(AlarmRule) _then) = _$AlarmRuleCopyWithImpl;
@useResult
$Res call({
 AlarmCondition condition, AlarmSeverity severity, String message, double? limit
});




}
/// @nodoc
class _$AlarmRuleCopyWithImpl<$Res>
    implements $AlarmRuleCopyWith<$Res> {
  _$AlarmRuleCopyWithImpl(this._self, this._then);

  final AlarmRule _self;
  final $Res Function(AlarmRule) _then;

/// Create a copy of AlarmRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? condition = null,Object? severity = null,Object? message = null,Object? limit = freezed,}) {
  return _then(_self.copyWith(
condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as AlarmCondition,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlarmSeverity,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlarmRule].
extension AlarmRulePatterns on AlarmRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlarmRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlarmRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlarmRule value)  $default,){
final _that = this;
switch (_that) {
case _AlarmRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlarmRule value)?  $default,){
final _that = this;
switch (_that) {
case _AlarmRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AlarmCondition condition,  AlarmSeverity severity,  String message,  double? limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlarmRule() when $default != null:
return $default(_that.condition,_that.severity,_that.message,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AlarmCondition condition,  AlarmSeverity severity,  String message,  double? limit)  $default,) {final _that = this;
switch (_that) {
case _AlarmRule():
return $default(_that.condition,_that.severity,_that.message,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AlarmCondition condition,  AlarmSeverity severity,  String message,  double? limit)?  $default,) {final _that = this;
switch (_that) {
case _AlarmRule() when $default != null:
return $default(_that.condition,_that.severity,_that.message,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class _AlarmRule implements AlarmRule {
  const _AlarmRule({required this.condition, required this.severity, required this.message, this.limit});
  

@override final  AlarmCondition condition;
@override final  AlarmSeverity severity;
@override final  String message;
/// Limite em unidade de engenharia (para [AlarmCondition.above]/below).
@override final  double? limit;

/// Create a copy of AlarmRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlarmRuleCopyWith<_AlarmRule> get copyWith => __$AlarmRuleCopyWithImpl<_AlarmRule>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlarmRule&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.message, message) || other.message == message)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,condition,severity,message,limit);

@override
String toString() {
  return 'AlarmRule(condition: $condition, severity: $severity, message: $message, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$AlarmRuleCopyWith<$Res> implements $AlarmRuleCopyWith<$Res> {
  factory _$AlarmRuleCopyWith(_AlarmRule value, $Res Function(_AlarmRule) _then) = __$AlarmRuleCopyWithImpl;
@override @useResult
$Res call({
 AlarmCondition condition, AlarmSeverity severity, String message, double? limit
});




}
/// @nodoc
class __$AlarmRuleCopyWithImpl<$Res>
    implements _$AlarmRuleCopyWith<$Res> {
  __$AlarmRuleCopyWithImpl(this._self, this._then);

  final _AlarmRule _self;
  final $Res Function(_AlarmRule) _then;

/// Create a copy of AlarmRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? condition = null,Object? severity = null,Object? message = null,Object? limit = freezed,}) {
  return _then(_AlarmRule(
condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as AlarmCondition,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlarmSeverity,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$Alarm {

/// Identificador estável: `<tagId>:<índice da regra>`.
 String get id; String get tagId; String get tagName; String get equipmentId; String get equipmentTag; AlarmSeverity get severity; String get message; DateTime get raisedAt;/// Condição ainda presente.
 bool get active; bool get acknowledged; DateTime? get clearedAt;/// Valor analógico que disparou o alarme (em unidade de engenharia).
 double? get triggerValue;/// Limite violado, para regras analógicas.
 double? get limit; String get unit; int get decimals;
/// Create a copy of Alarm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmCopyWith<Alarm> get copyWith => _$AlarmCopyWithImpl<Alarm>(this as Alarm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Alarm&&(identical(other.id, id) || other.id == id)&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.tagName, tagName) || other.tagName == tagName)&&(identical(other.equipmentId, equipmentId) || other.equipmentId == equipmentId)&&(identical(other.equipmentTag, equipmentTag) || other.equipmentTag == equipmentTag)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.message, message) || other.message == message)&&(identical(other.raisedAt, raisedAt) || other.raisedAt == raisedAt)&&(identical(other.active, active) || other.active == active)&&(identical(other.acknowledged, acknowledged) || other.acknowledged == acknowledged)&&(identical(other.clearedAt, clearedAt) || other.clearedAt == clearedAt)&&(identical(other.triggerValue, triggerValue) || other.triggerValue == triggerValue)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.decimals, decimals) || other.decimals == decimals));
}


@override
int get hashCode => Object.hash(runtimeType,id,tagId,tagName,equipmentId,equipmentTag,severity,message,raisedAt,active,acknowledged,clearedAt,triggerValue,limit,unit,decimals);

@override
String toString() {
  return 'Alarm(id: $id, tagId: $tagId, tagName: $tagName, equipmentId: $equipmentId, equipmentTag: $equipmentTag, severity: $severity, message: $message, raisedAt: $raisedAt, active: $active, acknowledged: $acknowledged, clearedAt: $clearedAt, triggerValue: $triggerValue, limit: $limit, unit: $unit, decimals: $decimals)';
}


}

/// @nodoc
abstract mixin class $AlarmCopyWith<$Res>  {
  factory $AlarmCopyWith(Alarm value, $Res Function(Alarm) _then) = _$AlarmCopyWithImpl;
@useResult
$Res call({
 String id, String tagId, String tagName, String equipmentId, String equipmentTag, AlarmSeverity severity, String message, DateTime raisedAt, bool active, bool acknowledged, DateTime? clearedAt, double? triggerValue, double? limit, String unit, int decimals
});




}
/// @nodoc
class _$AlarmCopyWithImpl<$Res>
    implements $AlarmCopyWith<$Res> {
  _$AlarmCopyWithImpl(this._self, this._then);

  final Alarm _self;
  final $Res Function(Alarm) _then;

/// Create a copy of Alarm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tagId = null,Object? tagName = null,Object? equipmentId = null,Object? equipmentTag = null,Object? severity = null,Object? message = null,Object? raisedAt = null,Object? active = null,Object? acknowledged = null,Object? clearedAt = freezed,Object? triggerValue = freezed,Object? limit = freezed,Object? unit = null,Object? decimals = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,tagName: null == tagName ? _self.tagName : tagName // ignore: cast_nullable_to_non_nullable
as String,equipmentId: null == equipmentId ? _self.equipmentId : equipmentId // ignore: cast_nullable_to_non_nullable
as String,equipmentTag: null == equipmentTag ? _self.equipmentTag : equipmentTag // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlarmSeverity,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,raisedAt: null == raisedAt ? _self.raisedAt : raisedAt // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,acknowledged: null == acknowledged ? _self.acknowledged : acknowledged // ignore: cast_nullable_to_non_nullable
as bool,clearedAt: freezed == clearedAt ? _self.clearedAt : clearedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,triggerValue: freezed == triggerValue ? _self.triggerValue : triggerValue // ignore: cast_nullable_to_non_nullable
as double?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as double?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,decimals: null == decimals ? _self.decimals : decimals // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Alarm].
extension AlarmPatterns on Alarm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Alarm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Alarm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Alarm value)  $default,){
final _that = this;
switch (_that) {
case _Alarm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Alarm value)?  $default,){
final _that = this;
switch (_that) {
case _Alarm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tagId,  String tagName,  String equipmentId,  String equipmentTag,  AlarmSeverity severity,  String message,  DateTime raisedAt,  bool active,  bool acknowledged,  DateTime? clearedAt,  double? triggerValue,  double? limit,  String unit,  int decimals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Alarm() when $default != null:
return $default(_that.id,_that.tagId,_that.tagName,_that.equipmentId,_that.equipmentTag,_that.severity,_that.message,_that.raisedAt,_that.active,_that.acknowledged,_that.clearedAt,_that.triggerValue,_that.limit,_that.unit,_that.decimals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tagId,  String tagName,  String equipmentId,  String equipmentTag,  AlarmSeverity severity,  String message,  DateTime raisedAt,  bool active,  bool acknowledged,  DateTime? clearedAt,  double? triggerValue,  double? limit,  String unit,  int decimals)  $default,) {final _that = this;
switch (_that) {
case _Alarm():
return $default(_that.id,_that.tagId,_that.tagName,_that.equipmentId,_that.equipmentTag,_that.severity,_that.message,_that.raisedAt,_that.active,_that.acknowledged,_that.clearedAt,_that.triggerValue,_that.limit,_that.unit,_that.decimals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tagId,  String tagName,  String equipmentId,  String equipmentTag,  AlarmSeverity severity,  String message,  DateTime raisedAt,  bool active,  bool acknowledged,  DateTime? clearedAt,  double? triggerValue,  double? limit,  String unit,  int decimals)?  $default,) {final _that = this;
switch (_that) {
case _Alarm() when $default != null:
return $default(_that.id,_that.tagId,_that.tagName,_that.equipmentId,_that.equipmentTag,_that.severity,_that.message,_that.raisedAt,_that.active,_that.acknowledged,_that.clearedAt,_that.triggerValue,_that.limit,_that.unit,_that.decimals);case _:
  return null;

}
}

}

/// @nodoc


class _Alarm extends Alarm {
  const _Alarm({required this.id, required this.tagId, required this.tagName, required this.equipmentId, required this.equipmentTag, required this.severity, required this.message, required this.raisedAt, required this.active, this.acknowledged = false, this.clearedAt, this.triggerValue, this.limit, this.unit = '', this.decimals = 0}): super._();
  

/// Identificador estável: `<tagId>:<índice da regra>`.
@override final  String id;
@override final  String tagId;
@override final  String tagName;
@override final  String equipmentId;
@override final  String equipmentTag;
@override final  AlarmSeverity severity;
@override final  String message;
@override final  DateTime raisedAt;
/// Condição ainda presente.
@override final  bool active;
@override@JsonKey() final  bool acknowledged;
@override final  DateTime? clearedAt;
/// Valor analógico que disparou o alarme (em unidade de engenharia).
@override final  double? triggerValue;
/// Limite violado, para regras analógicas.
@override final  double? limit;
@override@JsonKey() final  String unit;
@override@JsonKey() final  int decimals;

/// Create a copy of Alarm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlarmCopyWith<_Alarm> get copyWith => __$AlarmCopyWithImpl<_Alarm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Alarm&&(identical(other.id, id) || other.id == id)&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.tagName, tagName) || other.tagName == tagName)&&(identical(other.equipmentId, equipmentId) || other.equipmentId == equipmentId)&&(identical(other.equipmentTag, equipmentTag) || other.equipmentTag == equipmentTag)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.message, message) || other.message == message)&&(identical(other.raisedAt, raisedAt) || other.raisedAt == raisedAt)&&(identical(other.active, active) || other.active == active)&&(identical(other.acknowledged, acknowledged) || other.acknowledged == acknowledged)&&(identical(other.clearedAt, clearedAt) || other.clearedAt == clearedAt)&&(identical(other.triggerValue, triggerValue) || other.triggerValue == triggerValue)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.decimals, decimals) || other.decimals == decimals));
}


@override
int get hashCode => Object.hash(runtimeType,id,tagId,tagName,equipmentId,equipmentTag,severity,message,raisedAt,active,acknowledged,clearedAt,triggerValue,limit,unit,decimals);

@override
String toString() {
  return 'Alarm(id: $id, tagId: $tagId, tagName: $tagName, equipmentId: $equipmentId, equipmentTag: $equipmentTag, severity: $severity, message: $message, raisedAt: $raisedAt, active: $active, acknowledged: $acknowledged, clearedAt: $clearedAt, triggerValue: $triggerValue, limit: $limit, unit: $unit, decimals: $decimals)';
}


}

/// @nodoc
abstract mixin class _$AlarmCopyWith<$Res> implements $AlarmCopyWith<$Res> {
  factory _$AlarmCopyWith(_Alarm value, $Res Function(_Alarm) _then) = __$AlarmCopyWithImpl;
@override @useResult
$Res call({
 String id, String tagId, String tagName, String equipmentId, String equipmentTag, AlarmSeverity severity, String message, DateTime raisedAt, bool active, bool acknowledged, DateTime? clearedAt, double? triggerValue, double? limit, String unit, int decimals
});




}
/// @nodoc
class __$AlarmCopyWithImpl<$Res>
    implements _$AlarmCopyWith<$Res> {
  __$AlarmCopyWithImpl(this._self, this._then);

  final _Alarm _self;
  final $Res Function(_Alarm) _then;

/// Create a copy of Alarm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tagId = null,Object? tagName = null,Object? equipmentId = null,Object? equipmentTag = null,Object? severity = null,Object? message = null,Object? raisedAt = null,Object? active = null,Object? acknowledged = null,Object? clearedAt = freezed,Object? triggerValue = freezed,Object? limit = freezed,Object? unit = null,Object? decimals = null,}) {
  return _then(_Alarm(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,tagName: null == tagName ? _self.tagName : tagName // ignore: cast_nullable_to_non_nullable
as String,equipmentId: null == equipmentId ? _self.equipmentId : equipmentId // ignore: cast_nullable_to_non_nullable
as String,equipmentTag: null == equipmentTag ? _self.equipmentTag : equipmentTag // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlarmSeverity,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,raisedAt: null == raisedAt ? _self.raisedAt : raisedAt // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,acknowledged: null == acknowledged ? _self.acknowledged : acknowledged // ignore: cast_nullable_to_non_nullable
as bool,clearedAt: freezed == clearedAt ? _self.clearedAt : clearedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,triggerValue: freezed == triggerValue ? _self.triggerValue : triggerValue // ignore: cast_nullable_to_non_nullable
as double?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as double?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,decimals: null == decimals ? _self.decimals : decimals // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
