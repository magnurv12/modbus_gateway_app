// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EquipmentSummary {

 Equipment get equipment; EquipmentCondition get condition;/// Pior severidade pendente, se houver.
 AlarmSeverity? get worstAlarm; int get pendingAlarms;/// Tag que representa o estado do equipamento (ex.: "Em operação").
 TagDefinition? get stateTag;
/// Create a copy of EquipmentSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EquipmentSummaryCopyWith<EquipmentSummary> get copyWith => _$EquipmentSummaryCopyWithImpl<EquipmentSummary>(this as EquipmentSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EquipmentSummary&&(identical(other.equipment, equipment) || other.equipment == equipment)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.worstAlarm, worstAlarm) || other.worstAlarm == worstAlarm)&&(identical(other.pendingAlarms, pendingAlarms) || other.pendingAlarms == pendingAlarms)&&(identical(other.stateTag, stateTag) || other.stateTag == stateTag));
}


@override
int get hashCode => Object.hash(runtimeType,equipment,condition,worstAlarm,pendingAlarms,stateTag);

@override
String toString() {
  return 'EquipmentSummary(equipment: $equipment, condition: $condition, worstAlarm: $worstAlarm, pendingAlarms: $pendingAlarms, stateTag: $stateTag)';
}


}

/// @nodoc
abstract mixin class $EquipmentSummaryCopyWith<$Res>  {
  factory $EquipmentSummaryCopyWith(EquipmentSummary value, $Res Function(EquipmentSummary) _then) = _$EquipmentSummaryCopyWithImpl;
@useResult
$Res call({
 Equipment equipment, EquipmentCondition condition, AlarmSeverity? worstAlarm, int pendingAlarms, TagDefinition? stateTag
});


$EquipmentCopyWith<$Res> get equipment;$TagDefinitionCopyWith<$Res>? get stateTag;

}
/// @nodoc
class _$EquipmentSummaryCopyWithImpl<$Res>
    implements $EquipmentSummaryCopyWith<$Res> {
  _$EquipmentSummaryCopyWithImpl(this._self, this._then);

  final EquipmentSummary _self;
  final $Res Function(EquipmentSummary) _then;

/// Create a copy of EquipmentSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? equipment = null,Object? condition = null,Object? worstAlarm = freezed,Object? pendingAlarms = null,Object? stateTag = freezed,}) {
  return _then(_self.copyWith(
equipment: null == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as Equipment,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as EquipmentCondition,worstAlarm: freezed == worstAlarm ? _self.worstAlarm : worstAlarm // ignore: cast_nullable_to_non_nullable
as AlarmSeverity?,pendingAlarms: null == pendingAlarms ? _self.pendingAlarms : pendingAlarms // ignore: cast_nullable_to_non_nullable
as int,stateTag: freezed == stateTag ? _self.stateTag : stateTag // ignore: cast_nullable_to_non_nullable
as TagDefinition?,
  ));
}
/// Create a copy of EquipmentSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EquipmentCopyWith<$Res> get equipment {
  
  return $EquipmentCopyWith<$Res>(_self.equipment, (value) {
    return _then(_self.copyWith(equipment: value));
  });
}/// Create a copy of EquipmentSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagDefinitionCopyWith<$Res>? get stateTag {
    if (_self.stateTag == null) {
    return null;
  }

  return $TagDefinitionCopyWith<$Res>(_self.stateTag!, (value) {
    return _then(_self.copyWith(stateTag: value));
  });
}
}


/// Adds pattern-matching-related methods to [EquipmentSummary].
extension EquipmentSummaryPatterns on EquipmentSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EquipmentSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EquipmentSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EquipmentSummary value)  $default,){
final _that = this;
switch (_that) {
case _EquipmentSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EquipmentSummary value)?  $default,){
final _that = this;
switch (_that) {
case _EquipmentSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Equipment equipment,  EquipmentCondition condition,  AlarmSeverity? worstAlarm,  int pendingAlarms,  TagDefinition? stateTag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EquipmentSummary() when $default != null:
return $default(_that.equipment,_that.condition,_that.worstAlarm,_that.pendingAlarms,_that.stateTag);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Equipment equipment,  EquipmentCondition condition,  AlarmSeverity? worstAlarm,  int pendingAlarms,  TagDefinition? stateTag)  $default,) {final _that = this;
switch (_that) {
case _EquipmentSummary():
return $default(_that.equipment,_that.condition,_that.worstAlarm,_that.pendingAlarms,_that.stateTag);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Equipment equipment,  EquipmentCondition condition,  AlarmSeverity? worstAlarm,  int pendingAlarms,  TagDefinition? stateTag)?  $default,) {final _that = this;
switch (_that) {
case _EquipmentSummary() when $default != null:
return $default(_that.equipment,_that.condition,_that.worstAlarm,_that.pendingAlarms,_that.stateTag);case _:
  return null;

}
}

}

/// @nodoc


class _EquipmentSummary implements EquipmentSummary {
  const _EquipmentSummary({required this.equipment, required this.condition, this.worstAlarm, this.pendingAlarms = 0, this.stateTag});
  

@override final  Equipment equipment;
@override final  EquipmentCondition condition;
/// Pior severidade pendente, se houver.
@override final  AlarmSeverity? worstAlarm;
@override@JsonKey() final  int pendingAlarms;
/// Tag que representa o estado do equipamento (ex.: "Em operação").
@override final  TagDefinition? stateTag;

/// Create a copy of EquipmentSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EquipmentSummaryCopyWith<_EquipmentSummary> get copyWith => __$EquipmentSummaryCopyWithImpl<_EquipmentSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EquipmentSummary&&(identical(other.equipment, equipment) || other.equipment == equipment)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.worstAlarm, worstAlarm) || other.worstAlarm == worstAlarm)&&(identical(other.pendingAlarms, pendingAlarms) || other.pendingAlarms == pendingAlarms)&&(identical(other.stateTag, stateTag) || other.stateTag == stateTag));
}


@override
int get hashCode => Object.hash(runtimeType,equipment,condition,worstAlarm,pendingAlarms,stateTag);

@override
String toString() {
  return 'EquipmentSummary(equipment: $equipment, condition: $condition, worstAlarm: $worstAlarm, pendingAlarms: $pendingAlarms, stateTag: $stateTag)';
}


}

/// @nodoc
abstract mixin class _$EquipmentSummaryCopyWith<$Res> implements $EquipmentSummaryCopyWith<$Res> {
  factory _$EquipmentSummaryCopyWith(_EquipmentSummary value, $Res Function(_EquipmentSummary) _then) = __$EquipmentSummaryCopyWithImpl;
@override @useResult
$Res call({
 Equipment equipment, EquipmentCondition condition, AlarmSeverity? worstAlarm, int pendingAlarms, TagDefinition? stateTag
});


@override $EquipmentCopyWith<$Res> get equipment;@override $TagDefinitionCopyWith<$Res>? get stateTag;

}
/// @nodoc
class __$EquipmentSummaryCopyWithImpl<$Res>
    implements _$EquipmentSummaryCopyWith<$Res> {
  __$EquipmentSummaryCopyWithImpl(this._self, this._then);

  final _EquipmentSummary _self;
  final $Res Function(_EquipmentSummary) _then;

/// Create a copy of EquipmentSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? equipment = null,Object? condition = null,Object? worstAlarm = freezed,Object? pendingAlarms = null,Object? stateTag = freezed,}) {
  return _then(_EquipmentSummary(
equipment: null == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as Equipment,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as EquipmentCondition,worstAlarm: freezed == worstAlarm ? _self.worstAlarm : worstAlarm // ignore: cast_nullable_to_non_nullable
as AlarmSeverity?,pendingAlarms: null == pendingAlarms ? _self.pendingAlarms : pendingAlarms // ignore: cast_nullable_to_non_nullable
as int,stateTag: freezed == stateTag ? _self.stateTag : stateTag // ignore: cast_nullable_to_non_nullable
as TagDefinition?,
  ));
}

/// Create a copy of EquipmentSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EquipmentCopyWith<$Res> get equipment {
  
  return $EquipmentCopyWith<$Res>(_self.equipment, (value) {
    return _then(_self.copyWith(equipment: value));
  });
}/// Create a copy of EquipmentSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagDefinitionCopyWith<$Res>? get stateTag {
    if (_self.stateTag == null) {
    return null;
  }

  return $TagDefinitionCopyWith<$Res>(_self.stateTag!, (value) {
    return _then(_self.copyWith(stateTag: value));
  });
}
}

/// @nodoc
mixin _$DashboardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState()';
}


}

/// @nodoc
class $DashboardStateCopyWith<$Res>  {
$DashboardStateCopyWith(DashboardState _, $Res Function(DashboardState) __);
}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DashboardStateLoading value)?  loading,TResult Function( DashboardStateError value)?  error,TResult Function( DashboardStateLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DashboardStateLoading() when loading != null:
return loading(_that);case DashboardStateError() when error != null:
return error(_that);case DashboardStateLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DashboardStateLoading value)  loading,required TResult Function( DashboardStateError value)  error,required TResult Function( DashboardStateLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case DashboardStateLoading():
return loading(_that);case DashboardStateError():
return error(_that);case DashboardStateLoaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DashboardStateLoading value)?  loading,TResult? Function( DashboardStateError value)?  error,TResult? Function( DashboardStateLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case DashboardStateLoading() when loading != null:
return loading(_that);case DashboardStateError() when error != null:
return error(_that);case DashboardStateLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Failure failure)?  error,TResult Function( Plant plant,  PlantLiveState live,  List<EquipmentSummary> equipments,  List<Alarm> alarms)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DashboardStateLoading() when loading != null:
return loading();case DashboardStateError() when error != null:
return error(_that.failure);case DashboardStateLoaded() when loaded != null:
return loaded(_that.plant,_that.live,_that.equipments,_that.alarms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Failure failure)  error,required TResult Function( Plant plant,  PlantLiveState live,  List<EquipmentSummary> equipments,  List<Alarm> alarms)  loaded,}) {final _that = this;
switch (_that) {
case DashboardStateLoading():
return loading();case DashboardStateError():
return error(_that.failure);case DashboardStateLoaded():
return loaded(_that.plant,_that.live,_that.equipments,_that.alarms);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Failure failure)?  error,TResult? Function( Plant plant,  PlantLiveState live,  List<EquipmentSummary> equipments,  List<Alarm> alarms)?  loaded,}) {final _that = this;
switch (_that) {
case DashboardStateLoading() when loading != null:
return loading();case DashboardStateError() when error != null:
return error(_that.failure);case DashboardStateLoaded() when loaded != null:
return loaded(_that.plant,_that.live,_that.equipments,_that.alarms);case _:
  return null;

}
}

}

/// @nodoc


class DashboardStateLoading extends DashboardState {
  const DashboardStateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState.loading()';
}


}




/// @nodoc


class DashboardStateError extends DashboardState {
  const DashboardStateError(this.failure): super._();
  

 final  Failure failure;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateErrorCopyWith<DashboardStateError> get copyWith => _$DashboardStateErrorCopyWithImpl<DashboardStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardStateError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'DashboardState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $DashboardStateErrorCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory $DashboardStateErrorCopyWith(DashboardStateError value, $Res Function(DashboardStateError) _then) = _$DashboardStateErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$DashboardStateErrorCopyWithImpl<$Res>
    implements $DashboardStateErrorCopyWith<$Res> {
  _$DashboardStateErrorCopyWithImpl(this._self, this._then);

  final DashboardStateError _self;
  final $Res Function(DashboardStateError) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(DashboardStateError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of DashboardState
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


class DashboardStateLoaded extends DashboardState {
  const DashboardStateLoaded({required this.plant, required this.live, required final  List<EquipmentSummary> equipments, required final  List<Alarm> alarms}): _equipments = equipments,_alarms = alarms,super._();
  

 final  Plant plant;
 final  PlantLiveState live;
 final  List<EquipmentSummary> _equipments;
 List<EquipmentSummary> get equipments {
  if (_equipments is EqualUnmodifiableListView) return _equipments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_equipments);
}

 final  List<Alarm> _alarms;
 List<Alarm> get alarms {
  if (_alarms is EqualUnmodifiableListView) return _alarms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alarms);
}


/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateLoadedCopyWith<DashboardStateLoaded> get copyWith => _$DashboardStateLoadedCopyWithImpl<DashboardStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardStateLoaded&&(identical(other.plant, plant) || other.plant == plant)&&(identical(other.live, live) || other.live == live)&&const DeepCollectionEquality().equals(other._equipments, _equipments)&&const DeepCollectionEquality().equals(other._alarms, _alarms));
}


@override
int get hashCode => Object.hash(runtimeType,plant,live,const DeepCollectionEquality().hash(_equipments),const DeepCollectionEquality().hash(_alarms));

@override
String toString() {
  return 'DashboardState.loaded(plant: $plant, live: $live, equipments: $equipments, alarms: $alarms)';
}


}

/// @nodoc
abstract mixin class $DashboardStateLoadedCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory $DashboardStateLoadedCopyWith(DashboardStateLoaded value, $Res Function(DashboardStateLoaded) _then) = _$DashboardStateLoadedCopyWithImpl;
@useResult
$Res call({
 Plant plant, PlantLiveState live, List<EquipmentSummary> equipments, List<Alarm> alarms
});


$PlantCopyWith<$Res> get plant;$PlantLiveStateCopyWith<$Res> get live;

}
/// @nodoc
class _$DashboardStateLoadedCopyWithImpl<$Res>
    implements $DashboardStateLoadedCopyWith<$Res> {
  _$DashboardStateLoadedCopyWithImpl(this._self, this._then);

  final DashboardStateLoaded _self;
  final $Res Function(DashboardStateLoaded) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? plant = null,Object? live = null,Object? equipments = null,Object? alarms = null,}) {
  return _then(DashboardStateLoaded(
plant: null == plant ? _self.plant : plant // ignore: cast_nullable_to_non_nullable
as Plant,live: null == live ? _self.live : live // ignore: cast_nullable_to_non_nullable
as PlantLiveState,equipments: null == equipments ? _self._equipments : equipments // ignore: cast_nullable_to_non_nullable
as List<EquipmentSummary>,alarms: null == alarms ? _self._alarms : alarms // ignore: cast_nullable_to_non_nullable
as List<Alarm>,
  ));
}

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlantCopyWith<$Res> get plant {
  
  return $PlantCopyWith<$Res>(_self.plant, (value) {
    return _then(_self.copyWith(plant: value));
  });
}/// Create a copy of DashboardState
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
