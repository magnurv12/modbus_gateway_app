// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EquipmentState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EquipmentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EquipmentState()';
}


}

/// @nodoc
class $EquipmentStateCopyWith<$Res>  {
$EquipmentStateCopyWith(EquipmentState _, $Res Function(EquipmentState) __);
}


/// Adds pattern-matching-related methods to [EquipmentState].
extension EquipmentStatePatterns on EquipmentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EquipmentStateLoading value)?  loading,TResult Function( EquipmentStateNotFound value)?  notFound,TResult Function( EquipmentStateError value)?  error,TResult Function( EquipmentStateLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EquipmentStateLoading() when loading != null:
return loading(_that);case EquipmentStateNotFound() when notFound != null:
return notFound(_that);case EquipmentStateError() when error != null:
return error(_that);case EquipmentStateLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EquipmentStateLoading value)  loading,required TResult Function( EquipmentStateNotFound value)  notFound,required TResult Function( EquipmentStateError value)  error,required TResult Function( EquipmentStateLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case EquipmentStateLoading():
return loading(_that);case EquipmentStateNotFound():
return notFound(_that);case EquipmentStateError():
return error(_that);case EquipmentStateLoaded():
return loaded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EquipmentStateLoading value)?  loading,TResult? Function( EquipmentStateNotFound value)?  notFound,TResult? Function( EquipmentStateError value)?  error,TResult? Function( EquipmentStateLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case EquipmentStateLoading() when loading != null:
return loading(_that);case EquipmentStateNotFound() when notFound != null:
return notFound(_that);case EquipmentStateError() when error != null:
return error(_that);case EquipmentStateLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String equipmentId)?  notFound,TResult Function( Failure failure)?  error,TResult Function( Equipment equipment,  PlantLiveState live,  List<Alarm> alarms,  Set<String> pendingWrites,  String? trendTagId)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EquipmentStateLoading() when loading != null:
return loading();case EquipmentStateNotFound() when notFound != null:
return notFound(_that.equipmentId);case EquipmentStateError() when error != null:
return error(_that.failure);case EquipmentStateLoaded() when loaded != null:
return loaded(_that.equipment,_that.live,_that.alarms,_that.pendingWrites,_that.trendTagId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String equipmentId)  notFound,required TResult Function( Failure failure)  error,required TResult Function( Equipment equipment,  PlantLiveState live,  List<Alarm> alarms,  Set<String> pendingWrites,  String? trendTagId)  loaded,}) {final _that = this;
switch (_that) {
case EquipmentStateLoading():
return loading();case EquipmentStateNotFound():
return notFound(_that.equipmentId);case EquipmentStateError():
return error(_that.failure);case EquipmentStateLoaded():
return loaded(_that.equipment,_that.live,_that.alarms,_that.pendingWrites,_that.trendTagId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String equipmentId)?  notFound,TResult? Function( Failure failure)?  error,TResult? Function( Equipment equipment,  PlantLiveState live,  List<Alarm> alarms,  Set<String> pendingWrites,  String? trendTagId)?  loaded,}) {final _that = this;
switch (_that) {
case EquipmentStateLoading() when loading != null:
return loading();case EquipmentStateNotFound() when notFound != null:
return notFound(_that.equipmentId);case EquipmentStateError() when error != null:
return error(_that.failure);case EquipmentStateLoaded() when loaded != null:
return loaded(_that.equipment,_that.live,_that.alarms,_that.pendingWrites,_that.trendTagId);case _:
  return null;

}
}

}

/// @nodoc


class EquipmentStateLoading extends EquipmentState {
  const EquipmentStateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EquipmentStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EquipmentState.loading()';
}


}




/// @nodoc


class EquipmentStateNotFound extends EquipmentState {
  const EquipmentStateNotFound(this.equipmentId): super._();
  

 final  String equipmentId;

/// Create a copy of EquipmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EquipmentStateNotFoundCopyWith<EquipmentStateNotFound> get copyWith => _$EquipmentStateNotFoundCopyWithImpl<EquipmentStateNotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EquipmentStateNotFound&&(identical(other.equipmentId, equipmentId) || other.equipmentId == equipmentId));
}


@override
int get hashCode => Object.hash(runtimeType,equipmentId);

@override
String toString() {
  return 'EquipmentState.notFound(equipmentId: $equipmentId)';
}


}

/// @nodoc
abstract mixin class $EquipmentStateNotFoundCopyWith<$Res> implements $EquipmentStateCopyWith<$Res> {
  factory $EquipmentStateNotFoundCopyWith(EquipmentStateNotFound value, $Res Function(EquipmentStateNotFound) _then) = _$EquipmentStateNotFoundCopyWithImpl;
@useResult
$Res call({
 String equipmentId
});




}
/// @nodoc
class _$EquipmentStateNotFoundCopyWithImpl<$Res>
    implements $EquipmentStateNotFoundCopyWith<$Res> {
  _$EquipmentStateNotFoundCopyWithImpl(this._self, this._then);

  final EquipmentStateNotFound _self;
  final $Res Function(EquipmentStateNotFound) _then;

/// Create a copy of EquipmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? equipmentId = null,}) {
  return _then(EquipmentStateNotFound(
null == equipmentId ? _self.equipmentId : equipmentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class EquipmentStateError extends EquipmentState {
  const EquipmentStateError(this.failure): super._();
  

 final  Failure failure;

/// Create a copy of EquipmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EquipmentStateErrorCopyWith<EquipmentStateError> get copyWith => _$EquipmentStateErrorCopyWithImpl<EquipmentStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EquipmentStateError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'EquipmentState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $EquipmentStateErrorCopyWith<$Res> implements $EquipmentStateCopyWith<$Res> {
  factory $EquipmentStateErrorCopyWith(EquipmentStateError value, $Res Function(EquipmentStateError) _then) = _$EquipmentStateErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$EquipmentStateErrorCopyWithImpl<$Res>
    implements $EquipmentStateErrorCopyWith<$Res> {
  _$EquipmentStateErrorCopyWithImpl(this._self, this._then);

  final EquipmentStateError _self;
  final $Res Function(EquipmentStateError) _then;

/// Create a copy of EquipmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(EquipmentStateError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of EquipmentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

/// @nodoc


class EquipmentStateLoaded extends EquipmentState {
  const EquipmentStateLoaded({required this.equipment, required this.live, required final  List<Alarm> alarms, final  Set<String> pendingWrites = const <String>{}, this.trendTagId}): _alarms = alarms,_pendingWrites = pendingWrites,super._();
  

 final  Equipment equipment;
 final  PlantLiveState live;
 final  List<Alarm> _alarms;
 List<Alarm> get alarms {
  if (_alarms is EqualUnmodifiableListView) return _alarms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alarms);
}

/// Tags com escrita em andamento (mostram progresso e bloqueiam
/// comandos repetidos).
 final  Set<String> _pendingWrites;
/// Tags com escrita em andamento (mostram progresso e bloqueiam
/// comandos repetidos).
@JsonKey() Set<String> get pendingWrites {
  if (_pendingWrites is EqualUnmodifiableSetView) return _pendingWrites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_pendingWrites);
}

/// Tag exibida no gráfico de tendência.
 final  String? trendTagId;

/// Create a copy of EquipmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EquipmentStateLoadedCopyWith<EquipmentStateLoaded> get copyWith => _$EquipmentStateLoadedCopyWithImpl<EquipmentStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EquipmentStateLoaded&&(identical(other.equipment, equipment) || other.equipment == equipment)&&(identical(other.live, live) || other.live == live)&&const DeepCollectionEquality().equals(other._alarms, _alarms)&&const DeepCollectionEquality().equals(other._pendingWrites, _pendingWrites)&&(identical(other.trendTagId, trendTagId) || other.trendTagId == trendTagId));
}


@override
int get hashCode => Object.hash(runtimeType,equipment,live,const DeepCollectionEquality().hash(_alarms),const DeepCollectionEquality().hash(_pendingWrites),trendTagId);

@override
String toString() {
  return 'EquipmentState.loaded(equipment: $equipment, live: $live, alarms: $alarms, pendingWrites: $pendingWrites, trendTagId: $trendTagId)';
}


}

/// @nodoc
abstract mixin class $EquipmentStateLoadedCopyWith<$Res> implements $EquipmentStateCopyWith<$Res> {
  factory $EquipmentStateLoadedCopyWith(EquipmentStateLoaded value, $Res Function(EquipmentStateLoaded) _then) = _$EquipmentStateLoadedCopyWithImpl;
@useResult
$Res call({
 Equipment equipment, PlantLiveState live, List<Alarm> alarms, Set<String> pendingWrites, String? trendTagId
});


$EquipmentCopyWith<$Res> get equipment;$PlantLiveStateCopyWith<$Res> get live;

}
/// @nodoc
class _$EquipmentStateLoadedCopyWithImpl<$Res>
    implements $EquipmentStateLoadedCopyWith<$Res> {
  _$EquipmentStateLoadedCopyWithImpl(this._self, this._then);

  final EquipmentStateLoaded _self;
  final $Res Function(EquipmentStateLoaded) _then;

/// Create a copy of EquipmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? equipment = null,Object? live = null,Object? alarms = null,Object? pendingWrites = null,Object? trendTagId = freezed,}) {
  return _then(EquipmentStateLoaded(
equipment: null == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as Equipment,live: null == live ? _self.live : live // ignore: cast_nullable_to_non_nullable
as PlantLiveState,alarms: null == alarms ? _self._alarms : alarms // ignore: cast_nullable_to_non_nullable
as List<Alarm>,pendingWrites: null == pendingWrites ? _self._pendingWrites : pendingWrites // ignore: cast_nullable_to_non_nullable
as Set<String>,trendTagId: freezed == trendTagId ? _self.trendTagId : trendTagId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EquipmentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EquipmentCopyWith<$Res> get equipment {
  
  return $EquipmentCopyWith<$Res>(_self.equipment, (value) {
    return _then(_self.copyWith(equipment: value));
  });
}/// Create a copy of EquipmentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlantLiveStateCopyWith<$Res> get live {
  
  return $PlantLiveStateCopyWith<$Res>(_self.live, (value) {
    return _then(_self.copyWith(live: value));
  });
}
}

// dart format on
