// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gateway_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GatewayState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GatewayState()';
}


}

/// @nodoc
class $GatewayStateCopyWith<$Res>  {
$GatewayStateCopyWith(GatewayState _, $Res Function(GatewayState) __);
}


/// Adds pattern-matching-related methods to [GatewayState].
extension GatewayStatePatterns on GatewayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GatewayStateLoading value)?  loading,TResult Function( GatewayStateError value)?  error,TResult Function( GatewayStateLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GatewayStateLoading() when loading != null:
return loading(_that);case GatewayStateError() when error != null:
return error(_that);case GatewayStateLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GatewayStateLoading value)  loading,required TResult Function( GatewayStateError value)  error,required TResult Function( GatewayStateLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case GatewayStateLoading():
return loading(_that);case GatewayStateError():
return error(_that);case GatewayStateLoaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GatewayStateLoading value)?  loading,TResult? Function( GatewayStateError value)?  error,TResult? Function( GatewayStateLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case GatewayStateLoading() when loading != null:
return loading(_that);case GatewayStateError() when error != null:
return error(_that);case GatewayStateLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Failure failure)?  error,TResult Function( GatewayHealth health,  DateTime updatedAt,  bool refreshing,  Failure? refreshFailure)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GatewayStateLoading() when loading != null:
return loading();case GatewayStateError() when error != null:
return error(_that.failure);case GatewayStateLoaded() when loaded != null:
return loaded(_that.health,_that.updatedAt,_that.refreshing,_that.refreshFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Failure failure)  error,required TResult Function( GatewayHealth health,  DateTime updatedAt,  bool refreshing,  Failure? refreshFailure)  loaded,}) {final _that = this;
switch (_that) {
case GatewayStateLoading():
return loading();case GatewayStateError():
return error(_that.failure);case GatewayStateLoaded():
return loaded(_that.health,_that.updatedAt,_that.refreshing,_that.refreshFailure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Failure failure)?  error,TResult? Function( GatewayHealth health,  DateTime updatedAt,  bool refreshing,  Failure? refreshFailure)?  loaded,}) {final _that = this;
switch (_that) {
case GatewayStateLoading() when loading != null:
return loading();case GatewayStateError() when error != null:
return error(_that.failure);case GatewayStateLoaded() when loaded != null:
return loaded(_that.health,_that.updatedAt,_that.refreshing,_that.refreshFailure);case _:
  return null;

}
}

}

/// @nodoc


class GatewayStateLoading extends GatewayState {
  const GatewayStateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GatewayState.loading()';
}


}




/// @nodoc


class GatewayStateError extends GatewayState {
  const GatewayStateError(this.failure): super._();
  

 final  Failure failure;

/// Create a copy of GatewayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayStateErrorCopyWith<GatewayStateError> get copyWith => _$GatewayStateErrorCopyWithImpl<GatewayStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayStateError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'GatewayState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $GatewayStateErrorCopyWith<$Res> implements $GatewayStateCopyWith<$Res> {
  factory $GatewayStateErrorCopyWith(GatewayStateError value, $Res Function(GatewayStateError) _then) = _$GatewayStateErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$GatewayStateErrorCopyWithImpl<$Res>
    implements $GatewayStateErrorCopyWith<$Res> {
  _$GatewayStateErrorCopyWithImpl(this._self, this._then);

  final GatewayStateError _self;
  final $Res Function(GatewayStateError) _then;

/// Create a copy of GatewayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(GatewayStateError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of GatewayState
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


class GatewayStateLoaded extends GatewayState {
  const GatewayStateLoaded({required this.health, required this.updatedAt, this.refreshing = false, this.refreshFailure}): super._();
  

 final  GatewayHealth health;
 final  DateTime updatedAt;
@JsonKey() final  bool refreshing;
/// Falha da última atualização automática; os dados exibidos são os da
/// última leitura bem-sucedida.
 final  Failure? refreshFailure;

/// Create a copy of GatewayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayStateLoadedCopyWith<GatewayStateLoaded> get copyWith => _$GatewayStateLoadedCopyWithImpl<GatewayStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayStateLoaded&&(identical(other.health, health) || other.health == health)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.refreshing, refreshing) || other.refreshing == refreshing)&&(identical(other.refreshFailure, refreshFailure) || other.refreshFailure == refreshFailure));
}


@override
int get hashCode => Object.hash(runtimeType,health,updatedAt,refreshing,refreshFailure);

@override
String toString() {
  return 'GatewayState.loaded(health: $health, updatedAt: $updatedAt, refreshing: $refreshing, refreshFailure: $refreshFailure)';
}


}

/// @nodoc
abstract mixin class $GatewayStateLoadedCopyWith<$Res> implements $GatewayStateCopyWith<$Res> {
  factory $GatewayStateLoadedCopyWith(GatewayStateLoaded value, $Res Function(GatewayStateLoaded) _then) = _$GatewayStateLoadedCopyWithImpl;
@useResult
$Res call({
 GatewayHealth health, DateTime updatedAt, bool refreshing, Failure? refreshFailure
});


$GatewayHealthCopyWith<$Res> get health;$FailureCopyWith<$Res>? get refreshFailure;

}
/// @nodoc
class _$GatewayStateLoadedCopyWithImpl<$Res>
    implements $GatewayStateLoadedCopyWith<$Res> {
  _$GatewayStateLoadedCopyWithImpl(this._self, this._then);

  final GatewayStateLoaded _self;
  final $Res Function(GatewayStateLoaded) _then;

/// Create a copy of GatewayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? health = null,Object? updatedAt = null,Object? refreshing = null,Object? refreshFailure = freezed,}) {
  return _then(GatewayStateLoaded(
health: null == health ? _self.health : health // ignore: cast_nullable_to_non_nullable
as GatewayHealth,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,refreshing: null == refreshing ? _self.refreshing : refreshing // ignore: cast_nullable_to_non_nullable
as bool,refreshFailure: freezed == refreshFailure ? _self.refreshFailure : refreshFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of GatewayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GatewayHealthCopyWith<$Res> get health {
  
  return $GatewayHealthCopyWith<$Res>(_self.health, (value) {
    return _then(_self.copyWith(health: value));
  });
}/// Create a copy of GatewayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get refreshFailure {
    if (_self.refreshFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.refreshFailure!, (value) {
    return _then(_self.copyWith(refreshFailure: value));
  });
}
}

// dart format on
