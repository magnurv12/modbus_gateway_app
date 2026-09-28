// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shell_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShellState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShellState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShellState()';
}


}

/// @nodoc
class $ShellStateCopyWith<$Res>  {
$ShellStateCopyWith(ShellState _, $Res Function(ShellState) __);
}


/// Adds pattern-matching-related methods to [ShellState].
extension ShellStatePatterns on ShellState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShellStateLoading value)?  loading,TResult Function( ShellStateError value)?  error,TResult Function( ShellStateReady value)?  ready,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShellStateLoading() when loading != null:
return loading(_that);case ShellStateError() when error != null:
return error(_that);case ShellStateReady() when ready != null:
return ready(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShellStateLoading value)  loading,required TResult Function( ShellStateError value)  error,required TResult Function( ShellStateReady value)  ready,}){
final _that = this;
switch (_that) {
case ShellStateLoading():
return loading(_that);case ShellStateError():
return error(_that);case ShellStateReady():
return ready(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShellStateLoading value)?  loading,TResult? Function( ShellStateError value)?  error,TResult? Function( ShellStateReady value)?  ready,}){
final _that = this;
switch (_that) {
case ShellStateLoading() when loading != null:
return loading(_that);case ShellStateError() when error != null:
return error(_that);case ShellStateReady() when ready != null:
return ready(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Failure failure)?  error,TResult Function( LiveConnectionStatus status,  Failure? connectionFailure,  DateTime? nextRetryAt,  int pendingAlarms,  AlarmSeverity? topSeverity)?  ready,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShellStateLoading() when loading != null:
return loading();case ShellStateError() when error != null:
return error(_that.failure);case ShellStateReady() when ready != null:
return ready(_that.status,_that.connectionFailure,_that.nextRetryAt,_that.pendingAlarms,_that.topSeverity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Failure failure)  error,required TResult Function( LiveConnectionStatus status,  Failure? connectionFailure,  DateTime? nextRetryAt,  int pendingAlarms,  AlarmSeverity? topSeverity)  ready,}) {final _that = this;
switch (_that) {
case ShellStateLoading():
return loading();case ShellStateError():
return error(_that.failure);case ShellStateReady():
return ready(_that.status,_that.connectionFailure,_that.nextRetryAt,_that.pendingAlarms,_that.topSeverity);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Failure failure)?  error,TResult? Function( LiveConnectionStatus status,  Failure? connectionFailure,  DateTime? nextRetryAt,  int pendingAlarms,  AlarmSeverity? topSeverity)?  ready,}) {final _that = this;
switch (_that) {
case ShellStateLoading() when loading != null:
return loading();case ShellStateError() when error != null:
return error(_that.failure);case ShellStateReady() when ready != null:
return ready(_that.status,_that.connectionFailure,_that.nextRetryAt,_that.pendingAlarms,_that.topSeverity);case _:
  return null;

}
}

}

/// @nodoc


class ShellStateLoading extends ShellState {
  const ShellStateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShellStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShellState.loading()';
}


}




/// @nodoc


class ShellStateError extends ShellState {
  const ShellStateError(this.failure): super._();
  

 final  Failure failure;

/// Create a copy of ShellState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShellStateErrorCopyWith<ShellStateError> get copyWith => _$ShellStateErrorCopyWithImpl<ShellStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShellStateError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ShellState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ShellStateErrorCopyWith<$Res> implements $ShellStateCopyWith<$Res> {
  factory $ShellStateErrorCopyWith(ShellStateError value, $Res Function(ShellStateError) _then) = _$ShellStateErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$ShellStateErrorCopyWithImpl<$Res>
    implements $ShellStateErrorCopyWith<$Res> {
  _$ShellStateErrorCopyWithImpl(this._self, this._then);

  final ShellStateError _self;
  final $Res Function(ShellStateError) _then;

/// Create a copy of ShellState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ShellStateError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of ShellState
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


class ShellStateReady extends ShellState {
  const ShellStateReady({required this.status, this.connectionFailure, this.nextRetryAt, this.pendingAlarms = 0, this.topSeverity}): super._();
  

 final  LiveConnectionStatus status;
 final  Failure? connectionFailure;
 final  DateTime? nextRetryAt;
/// Alarmes que exigem atenção (ativos ou não reconhecidos).
@JsonKey() final  int pendingAlarms;
/// Maior severidade entre os não reconhecidos (cor do badge).
 final  AlarmSeverity? topSeverity;

/// Create a copy of ShellState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShellStateReadyCopyWith<ShellStateReady> get copyWith => _$ShellStateReadyCopyWithImpl<ShellStateReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShellStateReady&&(identical(other.status, status) || other.status == status)&&(identical(other.connectionFailure, connectionFailure) || other.connectionFailure == connectionFailure)&&(identical(other.nextRetryAt, nextRetryAt) || other.nextRetryAt == nextRetryAt)&&(identical(other.pendingAlarms, pendingAlarms) || other.pendingAlarms == pendingAlarms)&&(identical(other.topSeverity, topSeverity) || other.topSeverity == topSeverity));
}


@override
int get hashCode => Object.hash(runtimeType,status,connectionFailure,nextRetryAt,pendingAlarms,topSeverity);

@override
String toString() {
  return 'ShellState.ready(status: $status, connectionFailure: $connectionFailure, nextRetryAt: $nextRetryAt, pendingAlarms: $pendingAlarms, topSeverity: $topSeverity)';
}


}

/// @nodoc
abstract mixin class $ShellStateReadyCopyWith<$Res> implements $ShellStateCopyWith<$Res> {
  factory $ShellStateReadyCopyWith(ShellStateReady value, $Res Function(ShellStateReady) _then) = _$ShellStateReadyCopyWithImpl;
@useResult
$Res call({
 LiveConnectionStatus status, Failure? connectionFailure, DateTime? nextRetryAt, int pendingAlarms, AlarmSeverity? topSeverity
});


$FailureCopyWith<$Res>? get connectionFailure;

}
/// @nodoc
class _$ShellStateReadyCopyWithImpl<$Res>
    implements $ShellStateReadyCopyWith<$Res> {
  _$ShellStateReadyCopyWithImpl(this._self, this._then);

  final ShellStateReady _self;
  final $Res Function(ShellStateReady) _then;

/// Create a copy of ShellState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,Object? connectionFailure = freezed,Object? nextRetryAt = freezed,Object? pendingAlarms = null,Object? topSeverity = freezed,}) {
  return _then(ShellStateReady(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LiveConnectionStatus,connectionFailure: freezed == connectionFailure ? _self.connectionFailure : connectionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,nextRetryAt: freezed == nextRetryAt ? _self.nextRetryAt : nextRetryAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pendingAlarms: null == pendingAlarms ? _self.pendingAlarms : pendingAlarms // ignore: cast_nullable_to_non_nullable
as int,topSeverity: freezed == topSeverity ? _self.topSeverity : topSeverity // ignore: cast_nullable_to_non_nullable
as AlarmSeverity?,
  ));
}

/// Create a copy of ShellState
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
