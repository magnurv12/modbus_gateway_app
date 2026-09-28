// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modbus_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModbusBlock {

 ModbusTable get table; int get slave; int get functionCode; int get startAddress; List<int> get values;/// `true` quando o gateway respondeu do cache de streaming.
 bool get cached;/// Idade do valor em cache, quando [cached].
 int? get ageMs;
/// Create a copy of ModbusBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModbusBlockCopyWith<ModbusBlock> get copyWith => _$ModbusBlockCopyWithImpl<ModbusBlock>(this as ModbusBlock, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModbusBlock&&(identical(other.table, table) || other.table == table)&&(identical(other.slave, slave) || other.slave == slave)&&(identical(other.functionCode, functionCode) || other.functionCode == functionCode)&&(identical(other.startAddress, startAddress) || other.startAddress == startAddress)&&const DeepCollectionEquality().equals(other.values, values)&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.ageMs, ageMs) || other.ageMs == ageMs));
}


@override
int get hashCode => Object.hash(runtimeType,table,slave,functionCode,startAddress,const DeepCollectionEquality().hash(values),cached,ageMs);

@override
String toString() {
  return 'ModbusBlock(table: $table, slave: $slave, functionCode: $functionCode, startAddress: $startAddress, values: $values, cached: $cached, ageMs: $ageMs)';
}


}

/// @nodoc
abstract mixin class $ModbusBlockCopyWith<$Res>  {
  factory $ModbusBlockCopyWith(ModbusBlock value, $Res Function(ModbusBlock) _then) = _$ModbusBlockCopyWithImpl;
@useResult
$Res call({
 ModbusTable table, int slave, int functionCode, int startAddress, List<int> values, bool cached, int? ageMs
});




}
/// @nodoc
class _$ModbusBlockCopyWithImpl<$Res>
    implements $ModbusBlockCopyWith<$Res> {
  _$ModbusBlockCopyWithImpl(this._self, this._then);

  final ModbusBlock _self;
  final $Res Function(ModbusBlock) _then;

/// Create a copy of ModbusBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? table = null,Object? slave = null,Object? functionCode = null,Object? startAddress = null,Object? values = null,Object? cached = null,Object? ageMs = freezed,}) {
  return _then(_self.copyWith(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as ModbusTable,slave: null == slave ? _self.slave : slave // ignore: cast_nullable_to_non_nullable
as int,functionCode: null == functionCode ? _self.functionCode : functionCode // ignore: cast_nullable_to_non_nullable
as int,startAddress: null == startAddress ? _self.startAddress : startAddress // ignore: cast_nullable_to_non_nullable
as int,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<int>,cached: null == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool,ageMs: freezed == ageMs ? _self.ageMs : ageMs // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModbusBlock].
extension ModbusBlockPatterns on ModbusBlock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModbusBlock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModbusBlock() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModbusBlock value)  $default,){
final _that = this;
switch (_that) {
case _ModbusBlock():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModbusBlock value)?  $default,){
final _that = this;
switch (_that) {
case _ModbusBlock() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ModbusTable table,  int slave,  int functionCode,  int startAddress,  List<int> values,  bool cached,  int? ageMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModbusBlock() when $default != null:
return $default(_that.table,_that.slave,_that.functionCode,_that.startAddress,_that.values,_that.cached,_that.ageMs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ModbusTable table,  int slave,  int functionCode,  int startAddress,  List<int> values,  bool cached,  int? ageMs)  $default,) {final _that = this;
switch (_that) {
case _ModbusBlock():
return $default(_that.table,_that.slave,_that.functionCode,_that.startAddress,_that.values,_that.cached,_that.ageMs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ModbusTable table,  int slave,  int functionCode,  int startAddress,  List<int> values,  bool cached,  int? ageMs)?  $default,) {final _that = this;
switch (_that) {
case _ModbusBlock() when $default != null:
return $default(_that.table,_that.slave,_that.functionCode,_that.startAddress,_that.values,_that.cached,_that.ageMs);case _:
  return null;

}
}

}

/// @nodoc


class _ModbusBlock extends ModbusBlock {
  const _ModbusBlock({required this.table, required this.slave, required this.functionCode, required this.startAddress, required final  List<int> values, this.cached = false, this.ageMs}): _values = values,super._();
  

@override final  ModbusTable table;
@override final  int slave;
@override final  int functionCode;
@override final  int startAddress;
 final  List<int> _values;
@override List<int> get values {
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_values);
}

/// `true` quando o gateway respondeu do cache de streaming.
@override@JsonKey() final  bool cached;
/// Idade do valor em cache, quando [cached].
@override final  int? ageMs;

/// Create a copy of ModbusBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModbusBlockCopyWith<_ModbusBlock> get copyWith => __$ModbusBlockCopyWithImpl<_ModbusBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModbusBlock&&(identical(other.table, table) || other.table == table)&&(identical(other.slave, slave) || other.slave == slave)&&(identical(other.functionCode, functionCode) || other.functionCode == functionCode)&&(identical(other.startAddress, startAddress) || other.startAddress == startAddress)&&const DeepCollectionEquality().equals(other._values, _values)&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.ageMs, ageMs) || other.ageMs == ageMs));
}


@override
int get hashCode => Object.hash(runtimeType,table,slave,functionCode,startAddress,const DeepCollectionEquality().hash(_values),cached,ageMs);

@override
String toString() {
  return 'ModbusBlock(table: $table, slave: $slave, functionCode: $functionCode, startAddress: $startAddress, values: $values, cached: $cached, ageMs: $ageMs)';
}


}

/// @nodoc
abstract mixin class _$ModbusBlockCopyWith<$Res> implements $ModbusBlockCopyWith<$Res> {
  factory _$ModbusBlockCopyWith(_ModbusBlock value, $Res Function(_ModbusBlock) _then) = __$ModbusBlockCopyWithImpl;
@override @useResult
$Res call({
 ModbusTable table, int slave, int functionCode, int startAddress, List<int> values, bool cached, int? ageMs
});




}
/// @nodoc
class __$ModbusBlockCopyWithImpl<$Res>
    implements _$ModbusBlockCopyWith<$Res> {
  __$ModbusBlockCopyWithImpl(this._self, this._then);

  final _ModbusBlock _self;
  final $Res Function(_ModbusBlock) _then;

/// Create a copy of ModbusBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? table = null,Object? slave = null,Object? functionCode = null,Object? startAddress = null,Object? values = null,Object? cached = null,Object? ageMs = freezed,}) {
  return _then(_ModbusBlock(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as ModbusTable,slave: null == slave ? _self.slave : slave // ignore: cast_nullable_to_non_nullable
as int,functionCode: null == functionCode ? _self.functionCode : functionCode // ignore: cast_nullable_to_non_nullable
as int,startAddress: null == startAddress ? _self.startAddress : startAddress // ignore: cast_nullable_to_non_nullable
as int,values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<int>,cached: null == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool,ageMs: freezed == ageMs ? _self.ageMs : ageMs // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
