// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarms_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlarmsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlarmsState()';
}


}

/// @nodoc
class $AlarmsStateCopyWith<$Res>  {
$AlarmsStateCopyWith(AlarmsState _, $Res Function(AlarmsState) __);
}


/// Adds pattern-matching-related methods to [AlarmsState].
extension AlarmsStatePatterns on AlarmsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AlarmsStateLoading value)?  loading,TResult Function( AlarmsStateError value)?  error,TResult Function( AlarmsStateLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AlarmsStateLoading() when loading != null:
return loading(_that);case AlarmsStateError() when error != null:
return error(_that);case AlarmsStateLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AlarmsStateLoading value)  loading,required TResult Function( AlarmsStateError value)  error,required TResult Function( AlarmsStateLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case AlarmsStateLoading():
return loading(_that);case AlarmsStateError():
return error(_that);case AlarmsStateLoaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AlarmsStateLoading value)?  loading,TResult? Function( AlarmsStateError value)?  error,TResult? Function( AlarmsStateLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case AlarmsStateLoading() when loading != null:
return loading(_that);case AlarmsStateError() when error != null:
return error(_that);case AlarmsStateLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Failure failure)?  error,TResult Function( List<Alarm> all,  AlarmFilter filter)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AlarmsStateLoading() when loading != null:
return loading();case AlarmsStateError() when error != null:
return error(_that.failure);case AlarmsStateLoaded() when loaded != null:
return loaded(_that.all,_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Failure failure)  error,required TResult Function( List<Alarm> all,  AlarmFilter filter)  loaded,}) {final _that = this;
switch (_that) {
case AlarmsStateLoading():
return loading();case AlarmsStateError():
return error(_that.failure);case AlarmsStateLoaded():
return loaded(_that.all,_that.filter);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Failure failure)?  error,TResult? Function( List<Alarm> all,  AlarmFilter filter)?  loaded,}) {final _that = this;
switch (_that) {
case AlarmsStateLoading() when loading != null:
return loading();case AlarmsStateError() when error != null:
return error(_that.failure);case AlarmsStateLoaded() when loaded != null:
return loaded(_that.all,_that.filter);case _:
  return null;

}
}

}

/// @nodoc


class AlarmsStateLoading extends AlarmsState {
  const AlarmsStateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlarmsState.loading()';
}


}




/// @nodoc


class AlarmsStateError extends AlarmsState {
  const AlarmsStateError(this.failure): super._();
  

 final  Failure failure;

/// Create a copy of AlarmsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmsStateErrorCopyWith<AlarmsStateError> get copyWith => _$AlarmsStateErrorCopyWithImpl<AlarmsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmsStateError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AlarmsState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $AlarmsStateErrorCopyWith<$Res> implements $AlarmsStateCopyWith<$Res> {
  factory $AlarmsStateErrorCopyWith(AlarmsStateError value, $Res Function(AlarmsStateError) _then) = _$AlarmsStateErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$AlarmsStateErrorCopyWithImpl<$Res>
    implements $AlarmsStateErrorCopyWith<$Res> {
  _$AlarmsStateErrorCopyWithImpl(this._self, this._then);

  final AlarmsStateError _self;
  final $Res Function(AlarmsStateError) _then;

/// Create a copy of AlarmsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(AlarmsStateError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of AlarmsState
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


class AlarmsStateLoaded extends AlarmsState {
  const AlarmsStateLoaded({required final  List<Alarm> all, this.filter = AlarmFilter.all}): _all = all,super._();
  

 final  List<Alarm> _all;
 List<Alarm> get all {
  if (_all is EqualUnmodifiableListView) return _all;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_all);
}

@JsonKey() final  AlarmFilter filter;

/// Create a copy of AlarmsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlarmsStateLoadedCopyWith<AlarmsStateLoaded> get copyWith => _$AlarmsStateLoadedCopyWithImpl<AlarmsStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlarmsStateLoaded&&const DeepCollectionEquality().equals(other._all, _all)&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_all),filter);

@override
String toString() {
  return 'AlarmsState.loaded(all: $all, filter: $filter)';
}


}

/// @nodoc
abstract mixin class $AlarmsStateLoadedCopyWith<$Res> implements $AlarmsStateCopyWith<$Res> {
  factory $AlarmsStateLoadedCopyWith(AlarmsStateLoaded value, $Res Function(AlarmsStateLoaded) _then) = _$AlarmsStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<Alarm> all, AlarmFilter filter
});




}
/// @nodoc
class _$AlarmsStateLoadedCopyWithImpl<$Res>
    implements $AlarmsStateLoadedCopyWith<$Res> {
  _$AlarmsStateLoadedCopyWithImpl(this._self, this._then);

  final AlarmsStateLoaded _self;
  final $Res Function(AlarmsStateLoaded) _then;

/// Create a copy of AlarmsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? all = null,Object? filter = null,}) {
  return _then(AlarmsStateLoaded(
all: null == all ? _self._all : all // ignore: cast_nullable_to_non_nullable
as List<Alarm>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as AlarmFilter,
  ));
}


}

// dart format on
