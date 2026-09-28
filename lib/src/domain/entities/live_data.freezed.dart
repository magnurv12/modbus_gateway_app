// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TagValue {

 Object get value;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagValue&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'TagValue(value: $value)';
}


}

/// @nodoc
class $TagValueCopyWith<$Res>  {
$TagValueCopyWith(TagValue _, $Res Function(TagValue) __);
}


/// Adds pattern-matching-related methods to [TagValue].
extension TagValuePatterns on TagValue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NumberTagValue value)?  number,TResult Function( BooleanTagValue value)?  boolean,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NumberTagValue() when number != null:
return number(_that);case BooleanTagValue() when boolean != null:
return boolean(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NumberTagValue value)  number,required TResult Function( BooleanTagValue value)  boolean,}){
final _that = this;
switch (_that) {
case NumberTagValue():
return number(_that);case BooleanTagValue():
return boolean(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NumberTagValue value)?  number,TResult? Function( BooleanTagValue value)?  boolean,}){
final _that = this;
switch (_that) {
case NumberTagValue() when number != null:
return number(_that);case BooleanTagValue() when boolean != null:
return boolean(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( double value)?  number,TResult Function( bool value)?  boolean,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NumberTagValue() when number != null:
return number(_that.value);case BooleanTagValue() when boolean != null:
return boolean(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( double value)  number,required TResult Function( bool value)  boolean,}) {final _that = this;
switch (_that) {
case NumberTagValue():
return number(_that.value);case BooleanTagValue():
return boolean(_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( double value)?  number,TResult? Function( bool value)?  boolean,}) {final _that = this;
switch (_that) {
case NumberTagValue() when number != null:
return number(_that.value);case BooleanTagValue() when boolean != null:
return boolean(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class NumberTagValue extends TagValue {
  const NumberTagValue(this.value): super._();
  

@override final  double value;

/// Create a copy of TagValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NumberTagValueCopyWith<NumberTagValue> get copyWith => _$NumberTagValueCopyWithImpl<NumberTagValue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NumberTagValue&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'TagValue.number(value: $value)';
}


}

/// @nodoc
abstract mixin class $NumberTagValueCopyWith<$Res> implements $TagValueCopyWith<$Res> {
  factory $NumberTagValueCopyWith(NumberTagValue value, $Res Function(NumberTagValue) _then) = _$NumberTagValueCopyWithImpl;
@useResult
$Res call({
 double value
});




}
/// @nodoc
class _$NumberTagValueCopyWithImpl<$Res>
    implements $NumberTagValueCopyWith<$Res> {
  _$NumberTagValueCopyWithImpl(this._self, this._then);

  final NumberTagValue _self;
  final $Res Function(NumberTagValue) _then;

/// Create a copy of TagValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(NumberTagValue(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class BooleanTagValue extends TagValue {
  const BooleanTagValue(this.value): super._();
  

@override final  bool value;

/// Create a copy of TagValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BooleanTagValueCopyWith<BooleanTagValue> get copyWith => _$BooleanTagValueCopyWithImpl<BooleanTagValue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BooleanTagValue&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'TagValue.boolean(value: $value)';
}


}

/// @nodoc
abstract mixin class $BooleanTagValueCopyWith<$Res> implements $TagValueCopyWith<$Res> {
  factory $BooleanTagValueCopyWith(BooleanTagValue value, $Res Function(BooleanTagValue) _then) = _$BooleanTagValueCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class _$BooleanTagValueCopyWithImpl<$Res>
    implements $BooleanTagValueCopyWith<$Res> {
  _$BooleanTagValueCopyWithImpl(this._self, this._then);

  final BooleanTagValue _self;
  final $Res Function(BooleanTagValue) _then;

/// Create a copy of TagValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(BooleanTagValue(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$TagReading {

 String get tagId; TagValue get value; DateTime get updatedAt; TagQuality get quality;/// Falha que degradou a qualidade, quando [quality] != good.
 Failure? get failure;
/// Create a copy of TagReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagReadingCopyWith<TagReading> get copyWith => _$TagReadingCopyWithImpl<TagReading>(this as TagReading, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagReading&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.value, value) || other.value == value)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,tagId,value,updatedAt,quality,failure);

@override
String toString() {
  return 'TagReading(tagId: $tagId, value: $value, updatedAt: $updatedAt, quality: $quality, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $TagReadingCopyWith<$Res>  {
  factory $TagReadingCopyWith(TagReading value, $Res Function(TagReading) _then) = _$TagReadingCopyWithImpl;
@useResult
$Res call({
 String tagId, TagValue value, DateTime updatedAt, TagQuality quality, Failure? failure
});


$TagValueCopyWith<$Res> get value;$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$TagReadingCopyWithImpl<$Res>
    implements $TagReadingCopyWith<$Res> {
  _$TagReadingCopyWithImpl(this._self, this._then);

  final TagReading _self;
  final $Res Function(TagReading) _then;

/// Create a copy of TagReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tagId = null,Object? value = null,Object? updatedAt = null,Object? quality = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as TagValue,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as TagQuality,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of TagReading
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagValueCopyWith<$Res> get value {
  
  return $TagValueCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}/// Create a copy of TagReading
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}


/// Adds pattern-matching-related methods to [TagReading].
extension TagReadingPatterns on TagReading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagReading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagReading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagReading value)  $default,){
final _that = this;
switch (_that) {
case _TagReading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagReading value)?  $default,){
final _that = this;
switch (_that) {
case _TagReading() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tagId,  TagValue value,  DateTime updatedAt,  TagQuality quality,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagReading() when $default != null:
return $default(_that.tagId,_that.value,_that.updatedAt,_that.quality,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tagId,  TagValue value,  DateTime updatedAt,  TagQuality quality,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _TagReading():
return $default(_that.tagId,_that.value,_that.updatedAt,_that.quality,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tagId,  TagValue value,  DateTime updatedAt,  TagQuality quality,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _TagReading() when $default != null:
return $default(_that.tagId,_that.value,_that.updatedAt,_that.quality,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _TagReading implements TagReading {
  const _TagReading({required this.tagId, required this.value, required this.updatedAt, this.quality = TagQuality.good, this.failure});
  

@override final  String tagId;
@override final  TagValue value;
@override final  DateTime updatedAt;
@override@JsonKey() final  TagQuality quality;
/// Falha que degradou a qualidade, quando [quality] != good.
@override final  Failure? failure;

/// Create a copy of TagReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagReadingCopyWith<_TagReading> get copyWith => __$TagReadingCopyWithImpl<_TagReading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagReading&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.value, value) || other.value == value)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,tagId,value,updatedAt,quality,failure);

@override
String toString() {
  return 'TagReading(tagId: $tagId, value: $value, updatedAt: $updatedAt, quality: $quality, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$TagReadingCopyWith<$Res> implements $TagReadingCopyWith<$Res> {
  factory _$TagReadingCopyWith(_TagReading value, $Res Function(_TagReading) _then) = __$TagReadingCopyWithImpl;
@override @useResult
$Res call({
 String tagId, TagValue value, DateTime updatedAt, TagQuality quality, Failure? failure
});


@override $TagValueCopyWith<$Res> get value;@override $FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$TagReadingCopyWithImpl<$Res>
    implements _$TagReadingCopyWith<$Res> {
  __$TagReadingCopyWithImpl(this._self, this._then);

  final _TagReading _self;
  final $Res Function(_TagReading) _then;

/// Create a copy of TagReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tagId = null,Object? value = null,Object? updatedAt = null,Object? quality = null,Object? failure = freezed,}) {
  return _then(_TagReading(
tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as TagValue,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as TagQuality,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of TagReading
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagValueCopyWith<$Res> get value {
  
  return $TagValueCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}/// Create a copy of TagReading
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

/// @nodoc
mixin _$TrendPoint {

 DateTime get time; double get value;
/// Create a copy of TrendPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrendPointCopyWith<TrendPoint> get copyWith => _$TrendPointCopyWithImpl<TrendPoint>(this as TrendPoint, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendPoint&&(identical(other.time, time) || other.time == time)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,time,value);

@override
String toString() {
  return 'TrendPoint(time: $time, value: $value)';
}


}

/// @nodoc
abstract mixin class $TrendPointCopyWith<$Res>  {
  factory $TrendPointCopyWith(TrendPoint value, $Res Function(TrendPoint) _then) = _$TrendPointCopyWithImpl;
@useResult
$Res call({
 DateTime time, double value
});




}
/// @nodoc
class _$TrendPointCopyWithImpl<$Res>
    implements $TrendPointCopyWith<$Res> {
  _$TrendPointCopyWithImpl(this._self, this._then);

  final TrendPoint _self;
  final $Res Function(TrendPoint) _then;

/// Create a copy of TrendPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? value = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TrendPoint].
extension TrendPointPatterns on TrendPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrendPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrendPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrendPoint value)  $default,){
final _that = this;
switch (_that) {
case _TrendPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrendPoint value)?  $default,){
final _that = this;
switch (_that) {
case _TrendPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime time,  double value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrendPoint() when $default != null:
return $default(_that.time,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime time,  double value)  $default,) {final _that = this;
switch (_that) {
case _TrendPoint():
return $default(_that.time,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime time,  double value)?  $default,) {final _that = this;
switch (_that) {
case _TrendPoint() when $default != null:
return $default(_that.time,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _TrendPoint implements TrendPoint {
  const _TrendPoint({required this.time, required this.value});
  

@override final  DateTime time;
@override final  double value;

/// Create a copy of TrendPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrendPointCopyWith<_TrendPoint> get copyWith => __$TrendPointCopyWithImpl<_TrendPoint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrendPoint&&(identical(other.time, time) || other.time == time)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,time,value);

@override
String toString() {
  return 'TrendPoint(time: $time, value: $value)';
}


}

/// @nodoc
abstract mixin class _$TrendPointCopyWith<$Res> implements $TrendPointCopyWith<$Res> {
  factory _$TrendPointCopyWith(_TrendPoint value, $Res Function(_TrendPoint) _then) = __$TrendPointCopyWithImpl;
@override @useResult
$Res call({
 DateTime time, double value
});




}
/// @nodoc
class __$TrendPointCopyWithImpl<$Res>
    implements _$TrendPointCopyWith<$Res> {
  __$TrendPointCopyWithImpl(this._self, this._then);

  final _TrendPoint _self;
  final $Res Function(_TrendPoint) _then;

/// Create a copy of TrendPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? value = null,}) {
  return _then(_TrendPoint(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$PlantLiveState {

 LiveConnectionStatus get status; Map<String, TagReading> get readings; Map<String, List<TrendPoint>> get trends;/// Última falha de conexão (limpa quando volta a ficar online).
 Failure? get connectionFailure;/// Próxima tentativa de reconexão, quando [status] == reconnecting.
 DateTime? get nextRetryAt;
/// Create a copy of PlantLiveState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantLiveStateCopyWith<PlantLiveState> get copyWith => _$PlantLiveStateCopyWithImpl<PlantLiveState>(this as PlantLiveState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlantLiveState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.readings, readings)&&const DeepCollectionEquality().equals(other.trends, trends)&&(identical(other.connectionFailure, connectionFailure) || other.connectionFailure == connectionFailure)&&(identical(other.nextRetryAt, nextRetryAt) || other.nextRetryAt == nextRetryAt));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(readings),const DeepCollectionEquality().hash(trends),connectionFailure,nextRetryAt);

@override
String toString() {
  return 'PlantLiveState(status: $status, readings: $readings, trends: $trends, connectionFailure: $connectionFailure, nextRetryAt: $nextRetryAt)';
}


}

/// @nodoc
abstract mixin class $PlantLiveStateCopyWith<$Res>  {
  factory $PlantLiveStateCopyWith(PlantLiveState value, $Res Function(PlantLiveState) _then) = _$PlantLiveStateCopyWithImpl;
@useResult
$Res call({
 LiveConnectionStatus status, Map<String, TagReading> readings, Map<String, List<TrendPoint>> trends, Failure? connectionFailure, DateTime? nextRetryAt
});


$FailureCopyWith<$Res>? get connectionFailure;

}
/// @nodoc
class _$PlantLiveStateCopyWithImpl<$Res>
    implements $PlantLiveStateCopyWith<$Res> {
  _$PlantLiveStateCopyWithImpl(this._self, this._then);

  final PlantLiveState _self;
  final $Res Function(PlantLiveState) _then;

/// Create a copy of PlantLiveState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? readings = null,Object? trends = null,Object? connectionFailure = freezed,Object? nextRetryAt = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LiveConnectionStatus,readings: null == readings ? _self.readings : readings // ignore: cast_nullable_to_non_nullable
as Map<String, TagReading>,trends: null == trends ? _self.trends : trends // ignore: cast_nullable_to_non_nullable
as Map<String, List<TrendPoint>>,connectionFailure: freezed == connectionFailure ? _self.connectionFailure : connectionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,nextRetryAt: freezed == nextRetryAt ? _self.nextRetryAt : nextRetryAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of PlantLiveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get connectionFailure {
    if (_self.connectionFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.connectionFailure!, (value) {
    return _then(_self.copyWith(connectionFailure: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlantLiveState].
extension PlantLiveStatePatterns on PlantLiveState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlantLiveState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlantLiveState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlantLiveState value)  $default,){
final _that = this;
switch (_that) {
case _PlantLiveState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlantLiveState value)?  $default,){
final _that = this;
switch (_that) {
case _PlantLiveState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LiveConnectionStatus status,  Map<String, TagReading> readings,  Map<String, List<TrendPoint>> trends,  Failure? connectionFailure,  DateTime? nextRetryAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlantLiveState() when $default != null:
return $default(_that.status,_that.readings,_that.trends,_that.connectionFailure,_that.nextRetryAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LiveConnectionStatus status,  Map<String, TagReading> readings,  Map<String, List<TrendPoint>> trends,  Failure? connectionFailure,  DateTime? nextRetryAt)  $default,) {final _that = this;
switch (_that) {
case _PlantLiveState():
return $default(_that.status,_that.readings,_that.trends,_that.connectionFailure,_that.nextRetryAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LiveConnectionStatus status,  Map<String, TagReading> readings,  Map<String, List<TrendPoint>> trends,  Failure? connectionFailure,  DateTime? nextRetryAt)?  $default,) {final _that = this;
switch (_that) {
case _PlantLiveState() when $default != null:
return $default(_that.status,_that.readings,_that.trends,_that.connectionFailure,_that.nextRetryAt);case _:
  return null;

}
}

}

/// @nodoc


class _PlantLiveState extends PlantLiveState {
  const _PlantLiveState({required this.status, final  Map<String, TagReading> readings = const <String, TagReading>{}, final  Map<String, List<TrendPoint>> trends = const <String, List<TrendPoint>>{}, this.connectionFailure, this.nextRetryAt}): _readings = readings,_trends = trends,super._();
  

@override final  LiveConnectionStatus status;
 final  Map<String, TagReading> _readings;
@override@JsonKey() Map<String, TagReading> get readings {
  if (_readings is EqualUnmodifiableMapView) return _readings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_readings);
}

 final  Map<String, List<TrendPoint>> _trends;
@override@JsonKey() Map<String, List<TrendPoint>> get trends {
  if (_trends is EqualUnmodifiableMapView) return _trends;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_trends);
}

/// Última falha de conexão (limpa quando volta a ficar online).
@override final  Failure? connectionFailure;
/// Próxima tentativa de reconexão, quando [status] == reconnecting.
@override final  DateTime? nextRetryAt;

/// Create a copy of PlantLiveState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlantLiveStateCopyWith<_PlantLiveState> get copyWith => __$PlantLiveStateCopyWithImpl<_PlantLiveState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlantLiveState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._readings, _readings)&&const DeepCollectionEquality().equals(other._trends, _trends)&&(identical(other.connectionFailure, connectionFailure) || other.connectionFailure == connectionFailure)&&(identical(other.nextRetryAt, nextRetryAt) || other.nextRetryAt == nextRetryAt));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_readings),const DeepCollectionEquality().hash(_trends),connectionFailure,nextRetryAt);

@override
String toString() {
  return 'PlantLiveState(status: $status, readings: $readings, trends: $trends, connectionFailure: $connectionFailure, nextRetryAt: $nextRetryAt)';
}


}

/// @nodoc
abstract mixin class _$PlantLiveStateCopyWith<$Res> implements $PlantLiveStateCopyWith<$Res> {
  factory _$PlantLiveStateCopyWith(_PlantLiveState value, $Res Function(_PlantLiveState) _then) = __$PlantLiveStateCopyWithImpl;
@override @useResult
$Res call({
 LiveConnectionStatus status, Map<String, TagReading> readings, Map<String, List<TrendPoint>> trends, Failure? connectionFailure, DateTime? nextRetryAt
});


@override $FailureCopyWith<$Res>? get connectionFailure;

}
/// @nodoc
class __$PlantLiveStateCopyWithImpl<$Res>
    implements _$PlantLiveStateCopyWith<$Res> {
  __$PlantLiveStateCopyWithImpl(this._self, this._then);

  final _PlantLiveState _self;
  final $Res Function(_PlantLiveState) _then;

/// Create a copy of PlantLiveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? readings = null,Object? trends = null,Object? connectionFailure = freezed,Object? nextRetryAt = freezed,}) {
  return _then(_PlantLiveState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LiveConnectionStatus,readings: null == readings ? _self._readings : readings // ignore: cast_nullable_to_non_nullable
as Map<String, TagReading>,trends: null == trends ? _self._trends : trends // ignore: cast_nullable_to_non_nullable
as Map<String, List<TrendPoint>>,connectionFailure: freezed == connectionFailure ? _self.connectionFailure : connectionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,nextRetryAt: freezed == nextRetryAt ? _self.nextRetryAt : nextRetryAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of PlantLiveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get connectionFailure {
    if (_self.connectionFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.connectionFailure!, (value) {
    return _then(_self.copyWith(connectionFailure: value));
  });
}
}

// dart format on
