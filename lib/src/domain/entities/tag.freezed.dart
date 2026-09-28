// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TagDefinition {

 String get id; String get name; ModbusTable get table; int get address;/// Escravo Modbus; `null` usa o padrão do ambiente.
 int? get slave; TagDataType get dataType; WordOrder get wordOrder;/// `engenharia = bruto * scale + offset`.
 double get scale; double get offset; int get decimals; String get unit;/// Faixa de engenharia (usada em gauges e validação de escrita).
 double? get min; double? get max;/// Destacada no card do equipamento.
 bool get primary;/// Coil de pulso: o app escreve `true` e, em seguida, `false`.
 bool get momentary; String get onLabel; String get offLabel; List<AlarmRule> get alarms;
/// Create a copy of TagDefinition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagDefinitionCopyWith<TagDefinition> get copyWith => _$TagDefinitionCopyWithImpl<TagDefinition>(this as TagDefinition, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagDefinition&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.table, table) || other.table == table)&&(identical(other.address, address) || other.address == address)&&(identical(other.slave, slave) || other.slave == slave)&&(identical(other.dataType, dataType) || other.dataType == dataType)&&(identical(other.wordOrder, wordOrder) || other.wordOrder == wordOrder)&&(identical(other.scale, scale) || other.scale == scale)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.decimals, decimals) || other.decimals == decimals)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.momentary, momentary) || other.momentary == momentary)&&(identical(other.onLabel, onLabel) || other.onLabel == onLabel)&&(identical(other.offLabel, offLabel) || other.offLabel == offLabel)&&const DeepCollectionEquality().equals(other.alarms, alarms));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,table,address,slave,dataType,wordOrder,scale,offset,decimals,unit,min,max,primary,momentary,onLabel,offLabel,const DeepCollectionEquality().hash(alarms));

@override
String toString() {
  return 'TagDefinition(id: $id, name: $name, table: $table, address: $address, slave: $slave, dataType: $dataType, wordOrder: $wordOrder, scale: $scale, offset: $offset, decimals: $decimals, unit: $unit, min: $min, max: $max, primary: $primary, momentary: $momentary, onLabel: $onLabel, offLabel: $offLabel, alarms: $alarms)';
}


}

/// @nodoc
abstract mixin class $TagDefinitionCopyWith<$Res>  {
  factory $TagDefinitionCopyWith(TagDefinition value, $Res Function(TagDefinition) _then) = _$TagDefinitionCopyWithImpl;
@useResult
$Res call({
 String id, String name, ModbusTable table, int address, int? slave, TagDataType dataType, WordOrder wordOrder, double scale, double offset, int decimals, String unit, double? min, double? max, bool primary, bool momentary, String onLabel, String offLabel, List<AlarmRule> alarms
});




}
/// @nodoc
class _$TagDefinitionCopyWithImpl<$Res>
    implements $TagDefinitionCopyWith<$Res> {
  _$TagDefinitionCopyWithImpl(this._self, this._then);

  final TagDefinition _self;
  final $Res Function(TagDefinition) _then;

/// Create a copy of TagDefinition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? table = null,Object? address = null,Object? slave = freezed,Object? dataType = null,Object? wordOrder = null,Object? scale = null,Object? offset = null,Object? decimals = null,Object? unit = null,Object? min = freezed,Object? max = freezed,Object? primary = null,Object? momentary = null,Object? onLabel = null,Object? offLabel = null,Object? alarms = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as ModbusTable,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as int,slave: freezed == slave ? _self.slave : slave // ignore: cast_nullable_to_non_nullable
as int?,dataType: null == dataType ? _self.dataType : dataType // ignore: cast_nullable_to_non_nullable
as TagDataType,wordOrder: null == wordOrder ? _self.wordOrder : wordOrder // ignore: cast_nullable_to_non_nullable
as WordOrder,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as double,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as double,decimals: null == decimals ? _self.decimals : decimals // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double?,primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as bool,momentary: null == momentary ? _self.momentary : momentary // ignore: cast_nullable_to_non_nullable
as bool,onLabel: null == onLabel ? _self.onLabel : onLabel // ignore: cast_nullable_to_non_nullable
as String,offLabel: null == offLabel ? _self.offLabel : offLabel // ignore: cast_nullable_to_non_nullable
as String,alarms: null == alarms ? _self.alarms : alarms // ignore: cast_nullable_to_non_nullable
as List<AlarmRule>,
  ));
}

}


/// Adds pattern-matching-related methods to [TagDefinition].
extension TagDefinitionPatterns on TagDefinition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagDefinition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagDefinition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagDefinition value)  $default,){
final _that = this;
switch (_that) {
case _TagDefinition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagDefinition value)?  $default,){
final _that = this;
switch (_that) {
case _TagDefinition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  ModbusTable table,  int address,  int? slave,  TagDataType dataType,  WordOrder wordOrder,  double scale,  double offset,  int decimals,  String unit,  double? min,  double? max,  bool primary,  bool momentary,  String onLabel,  String offLabel,  List<AlarmRule> alarms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagDefinition() when $default != null:
return $default(_that.id,_that.name,_that.table,_that.address,_that.slave,_that.dataType,_that.wordOrder,_that.scale,_that.offset,_that.decimals,_that.unit,_that.min,_that.max,_that.primary,_that.momentary,_that.onLabel,_that.offLabel,_that.alarms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  ModbusTable table,  int address,  int? slave,  TagDataType dataType,  WordOrder wordOrder,  double scale,  double offset,  int decimals,  String unit,  double? min,  double? max,  bool primary,  bool momentary,  String onLabel,  String offLabel,  List<AlarmRule> alarms)  $default,) {final _that = this;
switch (_that) {
case _TagDefinition():
return $default(_that.id,_that.name,_that.table,_that.address,_that.slave,_that.dataType,_that.wordOrder,_that.scale,_that.offset,_that.decimals,_that.unit,_that.min,_that.max,_that.primary,_that.momentary,_that.onLabel,_that.offLabel,_that.alarms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  ModbusTable table,  int address,  int? slave,  TagDataType dataType,  WordOrder wordOrder,  double scale,  double offset,  int decimals,  String unit,  double? min,  double? max,  bool primary,  bool momentary,  String onLabel,  String offLabel,  List<AlarmRule> alarms)?  $default,) {final _that = this;
switch (_that) {
case _TagDefinition() when $default != null:
return $default(_that.id,_that.name,_that.table,_that.address,_that.slave,_that.dataType,_that.wordOrder,_that.scale,_that.offset,_that.decimals,_that.unit,_that.min,_that.max,_that.primary,_that.momentary,_that.onLabel,_that.offLabel,_that.alarms);case _:
  return null;

}
}

}

/// @nodoc


class _TagDefinition extends TagDefinition {
  const _TagDefinition({required this.id, required this.name, required this.table, required this.address, this.slave, this.dataType = TagDataType.uint16, this.wordOrder = WordOrder.big, this.scale = 1.0, this.offset = 0.0, this.decimals = 0, this.unit = '', this.min, this.max, this.primary = false, this.momentary = false, this.onLabel = 'Ligado', this.offLabel = 'Desligado', final  List<AlarmRule> alarms = const <AlarmRule>[]}): _alarms = alarms,super._();
  

@override final  String id;
@override final  String name;
@override final  ModbusTable table;
@override final  int address;
/// Escravo Modbus; `null` usa o padrão do ambiente.
@override final  int? slave;
@override@JsonKey() final  TagDataType dataType;
@override@JsonKey() final  WordOrder wordOrder;
/// `engenharia = bruto * scale + offset`.
@override@JsonKey() final  double scale;
@override@JsonKey() final  double offset;
@override@JsonKey() final  int decimals;
@override@JsonKey() final  String unit;
/// Faixa de engenharia (usada em gauges e validação de escrita).
@override final  double? min;
@override final  double? max;
/// Destacada no card do equipamento.
@override@JsonKey() final  bool primary;
/// Coil de pulso: o app escreve `true` e, em seguida, `false`.
@override@JsonKey() final  bool momentary;
@override@JsonKey() final  String onLabel;
@override@JsonKey() final  String offLabel;
 final  List<AlarmRule> _alarms;
@override@JsonKey() List<AlarmRule> get alarms {
  if (_alarms is EqualUnmodifiableListView) return _alarms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alarms);
}


/// Create a copy of TagDefinition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagDefinitionCopyWith<_TagDefinition> get copyWith => __$TagDefinitionCopyWithImpl<_TagDefinition>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagDefinition&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.table, table) || other.table == table)&&(identical(other.address, address) || other.address == address)&&(identical(other.slave, slave) || other.slave == slave)&&(identical(other.dataType, dataType) || other.dataType == dataType)&&(identical(other.wordOrder, wordOrder) || other.wordOrder == wordOrder)&&(identical(other.scale, scale) || other.scale == scale)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.decimals, decimals) || other.decimals == decimals)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.momentary, momentary) || other.momentary == momentary)&&(identical(other.onLabel, onLabel) || other.onLabel == onLabel)&&(identical(other.offLabel, offLabel) || other.offLabel == offLabel)&&const DeepCollectionEquality().equals(other._alarms, _alarms));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,table,address,slave,dataType,wordOrder,scale,offset,decimals,unit,min,max,primary,momentary,onLabel,offLabel,const DeepCollectionEquality().hash(_alarms));

@override
String toString() {
  return 'TagDefinition(id: $id, name: $name, table: $table, address: $address, slave: $slave, dataType: $dataType, wordOrder: $wordOrder, scale: $scale, offset: $offset, decimals: $decimals, unit: $unit, min: $min, max: $max, primary: $primary, momentary: $momentary, onLabel: $onLabel, offLabel: $offLabel, alarms: $alarms)';
}


}

/// @nodoc
abstract mixin class _$TagDefinitionCopyWith<$Res> implements $TagDefinitionCopyWith<$Res> {
  factory _$TagDefinitionCopyWith(_TagDefinition value, $Res Function(_TagDefinition) _then) = __$TagDefinitionCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ModbusTable table, int address, int? slave, TagDataType dataType, WordOrder wordOrder, double scale, double offset, int decimals, String unit, double? min, double? max, bool primary, bool momentary, String onLabel, String offLabel, List<AlarmRule> alarms
});




}
/// @nodoc
class __$TagDefinitionCopyWithImpl<$Res>
    implements _$TagDefinitionCopyWith<$Res> {
  __$TagDefinitionCopyWithImpl(this._self, this._then);

  final _TagDefinition _self;
  final $Res Function(_TagDefinition) _then;

/// Create a copy of TagDefinition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? table = null,Object? address = null,Object? slave = freezed,Object? dataType = null,Object? wordOrder = null,Object? scale = null,Object? offset = null,Object? decimals = null,Object? unit = null,Object? min = freezed,Object? max = freezed,Object? primary = null,Object? momentary = null,Object? onLabel = null,Object? offLabel = null,Object? alarms = null,}) {
  return _then(_TagDefinition(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as ModbusTable,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as int,slave: freezed == slave ? _self.slave : slave // ignore: cast_nullable_to_non_nullable
as int?,dataType: null == dataType ? _self.dataType : dataType // ignore: cast_nullable_to_non_nullable
as TagDataType,wordOrder: null == wordOrder ? _self.wordOrder : wordOrder // ignore: cast_nullable_to_non_nullable
as WordOrder,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as double,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as double,decimals: null == decimals ? _self.decimals : decimals // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double?,primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as bool,momentary: null == momentary ? _self.momentary : momentary // ignore: cast_nullable_to_non_nullable
as bool,onLabel: null == onLabel ? _self.onLabel : onLabel // ignore: cast_nullable_to_non_nullable
as String,offLabel: null == offLabel ? _self.offLabel : offLabel // ignore: cast_nullable_to_non_nullable
as String,alarms: null == alarms ? _self._alarms : alarms // ignore: cast_nullable_to_non_nullable
as List<AlarmRule>,
  ));
}


}

// dart format on
