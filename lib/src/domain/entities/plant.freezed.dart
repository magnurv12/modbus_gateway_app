// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Equipment {

 String get id;/// Identificação de campo (TAG ISA), ex.: `P-101`.
 String get tag; String get name; EquipmentType get type; String get description; List<TagDefinition> get tags;
/// Create a copy of Equipment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EquipmentCopyWith<Equipment> get copyWith => _$EquipmentCopyWithImpl<Equipment>(this as Equipment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Equipment&&(identical(other.id, id) || other.id == id)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.tags, tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,tag,name,type,description,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'Equipment(id: $id, tag: $tag, name: $name, type: $type, description: $description, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $EquipmentCopyWith<$Res>  {
  factory $EquipmentCopyWith(Equipment value, $Res Function(Equipment) _then) = _$EquipmentCopyWithImpl;
@useResult
$Res call({
 String id, String tag, String name, EquipmentType type, String description, List<TagDefinition> tags
});




}
/// @nodoc
class _$EquipmentCopyWithImpl<$Res>
    implements $EquipmentCopyWith<$Res> {
  _$EquipmentCopyWithImpl(this._self, this._then);

  final Equipment _self;
  final $Res Function(Equipment) _then;

/// Create a copy of Equipment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tag = null,Object? name = null,Object? type = null,Object? description = null,Object? tags = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EquipmentType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagDefinition>,
  ));
}

}


/// Adds pattern-matching-related methods to [Equipment].
extension EquipmentPatterns on Equipment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Equipment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Equipment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Equipment value)  $default,){
final _that = this;
switch (_that) {
case _Equipment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Equipment value)?  $default,){
final _that = this;
switch (_that) {
case _Equipment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tag,  String name,  EquipmentType type,  String description,  List<TagDefinition> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Equipment() when $default != null:
return $default(_that.id,_that.tag,_that.name,_that.type,_that.description,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tag,  String name,  EquipmentType type,  String description,  List<TagDefinition> tags)  $default,) {final _that = this;
switch (_that) {
case _Equipment():
return $default(_that.id,_that.tag,_that.name,_that.type,_that.description,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tag,  String name,  EquipmentType type,  String description,  List<TagDefinition> tags)?  $default,) {final _that = this;
switch (_that) {
case _Equipment() when $default != null:
return $default(_that.id,_that.tag,_that.name,_that.type,_that.description,_that.tags);case _:
  return null;

}
}

}

/// @nodoc


class _Equipment extends Equipment {
  const _Equipment({required this.id, required this.tag, required this.name, required this.type, this.description = '', required final  List<TagDefinition> tags}): _tags = tags,super._();
  

@override final  String id;
/// Identificação de campo (TAG ISA), ex.: `P-101`.
@override final  String tag;
@override final  String name;
@override final  EquipmentType type;
@override@JsonKey() final  String description;
 final  List<TagDefinition> _tags;
@override List<TagDefinition> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of Equipment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EquipmentCopyWith<_Equipment> get copyWith => __$EquipmentCopyWithImpl<_Equipment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Equipment&&(identical(other.id, id) || other.id == id)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,tag,name,type,description,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'Equipment(id: $id, tag: $tag, name: $name, type: $type, description: $description, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$EquipmentCopyWith<$Res> implements $EquipmentCopyWith<$Res> {
  factory _$EquipmentCopyWith(_Equipment value, $Res Function(_Equipment) _then) = __$EquipmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String tag, String name, EquipmentType type, String description, List<TagDefinition> tags
});




}
/// @nodoc
class __$EquipmentCopyWithImpl<$Res>
    implements _$EquipmentCopyWith<$Res> {
  __$EquipmentCopyWithImpl(this._self, this._then);

  final _Equipment _self;
  final $Res Function(_Equipment) _then;

/// Create a copy of Equipment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tag = null,Object? name = null,Object? type = null,Object? description = null,Object? tags = null,}) {
  return _then(_Equipment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EquipmentType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<TagDefinition>,
  ));
}


}

/// @nodoc
mixin _$Plant {

 String get name; String get site; List<Equipment> get equipments;
/// Create a copy of Plant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantCopyWith<Plant> get copyWith => _$PlantCopyWithImpl<Plant>(this as Plant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Plant&&(identical(other.name, name) || other.name == name)&&(identical(other.site, site) || other.site == site)&&const DeepCollectionEquality().equals(other.equipments, equipments));
}


@override
int get hashCode => Object.hash(runtimeType,name,site,const DeepCollectionEquality().hash(equipments));

@override
String toString() {
  return 'Plant(name: $name, site: $site, equipments: $equipments)';
}


}

/// @nodoc
abstract mixin class $PlantCopyWith<$Res>  {
  factory $PlantCopyWith(Plant value, $Res Function(Plant) _then) = _$PlantCopyWithImpl;
@useResult
$Res call({
 String name, String site, List<Equipment> equipments
});




}
/// @nodoc
class _$PlantCopyWithImpl<$Res>
    implements $PlantCopyWith<$Res> {
  _$PlantCopyWithImpl(this._self, this._then);

  final Plant _self;
  final $Res Function(Plant) _then;

/// Create a copy of Plant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? site = null,Object? equipments = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,site: null == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String,equipments: null == equipments ? _self.equipments : equipments // ignore: cast_nullable_to_non_nullable
as List<Equipment>,
  ));
}

}


/// Adds pattern-matching-related methods to [Plant].
extension PlantPatterns on Plant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Plant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Plant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Plant value)  $default,){
final _that = this;
switch (_that) {
case _Plant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Plant value)?  $default,){
final _that = this;
switch (_that) {
case _Plant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String site,  List<Equipment> equipments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Plant() when $default != null:
return $default(_that.name,_that.site,_that.equipments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String site,  List<Equipment> equipments)  $default,) {final _that = this;
switch (_that) {
case _Plant():
return $default(_that.name,_that.site,_that.equipments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String site,  List<Equipment> equipments)?  $default,) {final _that = this;
switch (_that) {
case _Plant() when $default != null:
return $default(_that.name,_that.site,_that.equipments);case _:
  return null;

}
}

}

/// @nodoc


class _Plant extends Plant {
  const _Plant({required this.name, required this.site, required final  List<Equipment> equipments}): _equipments = equipments,super._();
  

@override final  String name;
@override final  String site;
 final  List<Equipment> _equipments;
@override List<Equipment> get equipments {
  if (_equipments is EqualUnmodifiableListView) return _equipments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_equipments);
}


/// Create a copy of Plant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlantCopyWith<_Plant> get copyWith => __$PlantCopyWithImpl<_Plant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Plant&&(identical(other.name, name) || other.name == name)&&(identical(other.site, site) || other.site == site)&&const DeepCollectionEquality().equals(other._equipments, _equipments));
}


@override
int get hashCode => Object.hash(runtimeType,name,site,const DeepCollectionEquality().hash(_equipments));

@override
String toString() {
  return 'Plant(name: $name, site: $site, equipments: $equipments)';
}


}

/// @nodoc
abstract mixin class _$PlantCopyWith<$Res> implements $PlantCopyWith<$Res> {
  factory _$PlantCopyWith(_Plant value, $Res Function(_Plant) _then) = __$PlantCopyWithImpl;
@override @useResult
$Res call({
 String name, String site, List<Equipment> equipments
});




}
/// @nodoc
class __$PlantCopyWithImpl<$Res>
    implements _$PlantCopyWith<$Res> {
  __$PlantCopyWithImpl(this._self, this._then);

  final _Plant _self;
  final $Res Function(_Plant) _then;

/// Create a copy of Plant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? site = null,Object? equipments = null,}) {
  return _then(_Plant(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,site: null == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String,equipments: null == equipments ? _self._equipments : equipments // ignore: cast_nullable_to_non_nullable
as List<Equipment>,
  ));
}


}

// dart format on
