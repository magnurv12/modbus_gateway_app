// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModbusErrorContext {

 String? get table; int? get slave; int? get functionCode; int? get address;/// Código do ModbusMaster: 1–4 exceções do escravo, 224–227 enlace.
 int? get modbusCode;/// Nome do código, ex.: `ResponseTimedOut`, `IllegalDataAddress`.
 String? get modbusError;
/// Create a copy of ModbusErrorContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModbusErrorContextCopyWith<ModbusErrorContext> get copyWith => _$ModbusErrorContextCopyWithImpl<ModbusErrorContext>(this as ModbusErrorContext, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModbusErrorContext&&(identical(other.table, table) || other.table == table)&&(identical(other.slave, slave) || other.slave == slave)&&(identical(other.functionCode, functionCode) || other.functionCode == functionCode)&&(identical(other.address, address) || other.address == address)&&(identical(other.modbusCode, modbusCode) || other.modbusCode == modbusCode)&&(identical(other.modbusError, modbusError) || other.modbusError == modbusError));
}


@override
int get hashCode => Object.hash(runtimeType,table,slave,functionCode,address,modbusCode,modbusError);

@override
String toString() {
  return 'ModbusErrorContext(table: $table, slave: $slave, functionCode: $functionCode, address: $address, modbusCode: $modbusCode, modbusError: $modbusError)';
}


}

/// @nodoc
abstract mixin class $ModbusErrorContextCopyWith<$Res>  {
  factory $ModbusErrorContextCopyWith(ModbusErrorContext value, $Res Function(ModbusErrorContext) _then) = _$ModbusErrorContextCopyWithImpl;
@useResult
$Res call({
 String? table, int? slave, int? functionCode, int? address, int? modbusCode, String? modbusError
});




}
/// @nodoc
class _$ModbusErrorContextCopyWithImpl<$Res>
    implements $ModbusErrorContextCopyWith<$Res> {
  _$ModbusErrorContextCopyWithImpl(this._self, this._then);

  final ModbusErrorContext _self;
  final $Res Function(ModbusErrorContext) _then;

/// Create a copy of ModbusErrorContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? table = freezed,Object? slave = freezed,Object? functionCode = freezed,Object? address = freezed,Object? modbusCode = freezed,Object? modbusError = freezed,}) {
  return _then(_self.copyWith(
table: freezed == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as String?,slave: freezed == slave ? _self.slave : slave // ignore: cast_nullable_to_non_nullable
as int?,functionCode: freezed == functionCode ? _self.functionCode : functionCode // ignore: cast_nullable_to_non_nullable
as int?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as int?,modbusCode: freezed == modbusCode ? _self.modbusCode : modbusCode // ignore: cast_nullable_to_non_nullable
as int?,modbusError: freezed == modbusError ? _self.modbusError : modbusError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModbusErrorContext].
extension ModbusErrorContextPatterns on ModbusErrorContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModbusErrorContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModbusErrorContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModbusErrorContext value)  $default,){
final _that = this;
switch (_that) {
case _ModbusErrorContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModbusErrorContext value)?  $default,){
final _that = this;
switch (_that) {
case _ModbusErrorContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? table,  int? slave,  int? functionCode,  int? address,  int? modbusCode,  String? modbusError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModbusErrorContext() when $default != null:
return $default(_that.table,_that.slave,_that.functionCode,_that.address,_that.modbusCode,_that.modbusError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? table,  int? slave,  int? functionCode,  int? address,  int? modbusCode,  String? modbusError)  $default,) {final _that = this;
switch (_that) {
case _ModbusErrorContext():
return $default(_that.table,_that.slave,_that.functionCode,_that.address,_that.modbusCode,_that.modbusError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? table,  int? slave,  int? functionCode,  int? address,  int? modbusCode,  String? modbusError)?  $default,) {final _that = this;
switch (_that) {
case _ModbusErrorContext() when $default != null:
return $default(_that.table,_that.slave,_that.functionCode,_that.address,_that.modbusCode,_that.modbusError);case _:
  return null;

}
}

}

/// @nodoc


class _ModbusErrorContext implements ModbusErrorContext {
  const _ModbusErrorContext({this.table, this.slave, this.functionCode, this.address, this.modbusCode, this.modbusError});
  

@override final  String? table;
@override final  int? slave;
@override final  int? functionCode;
@override final  int? address;
/// Código do ModbusMaster: 1–4 exceções do escravo, 224–227 enlace.
@override final  int? modbusCode;
/// Nome do código, ex.: `ResponseTimedOut`, `IllegalDataAddress`.
@override final  String? modbusError;

/// Create a copy of ModbusErrorContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModbusErrorContextCopyWith<_ModbusErrorContext> get copyWith => __$ModbusErrorContextCopyWithImpl<_ModbusErrorContext>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModbusErrorContext&&(identical(other.table, table) || other.table == table)&&(identical(other.slave, slave) || other.slave == slave)&&(identical(other.functionCode, functionCode) || other.functionCode == functionCode)&&(identical(other.address, address) || other.address == address)&&(identical(other.modbusCode, modbusCode) || other.modbusCode == modbusCode)&&(identical(other.modbusError, modbusError) || other.modbusError == modbusError));
}


@override
int get hashCode => Object.hash(runtimeType,table,slave,functionCode,address,modbusCode,modbusError);

@override
String toString() {
  return 'ModbusErrorContext(table: $table, slave: $slave, functionCode: $functionCode, address: $address, modbusCode: $modbusCode, modbusError: $modbusError)';
}


}

/// @nodoc
abstract mixin class _$ModbusErrorContextCopyWith<$Res> implements $ModbusErrorContextCopyWith<$Res> {
  factory _$ModbusErrorContextCopyWith(_ModbusErrorContext value, $Res Function(_ModbusErrorContext) _then) = __$ModbusErrorContextCopyWithImpl;
@override @useResult
$Res call({
 String? table, int? slave, int? functionCode, int? address, int? modbusCode, String? modbusError
});




}
/// @nodoc
class __$ModbusErrorContextCopyWithImpl<$Res>
    implements _$ModbusErrorContextCopyWith<$Res> {
  __$ModbusErrorContextCopyWithImpl(this._self, this._then);

  final _ModbusErrorContext _self;
  final $Res Function(_ModbusErrorContext) _then;

/// Create a copy of ModbusErrorContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? table = freezed,Object? slave = freezed,Object? functionCode = freezed,Object? address = freezed,Object? modbusCode = freezed,Object? modbusError = freezed,}) {
  return _then(_ModbusErrorContext(
table: freezed == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as String?,slave: freezed == slave ? _self.slave : slave // ignore: cast_nullable_to_non_nullable
as int?,functionCode: freezed == functionCode ? _self.functionCode : functionCode // ignore: cast_nullable_to_non_nullable
as int?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as int?,modbusCode: freezed == modbusCode ? _self.modbusCode : modbusCode // ignore: cast_nullable_to_non_nullable
as int?,modbusError: freezed == modbusError ? _self.modbusError : modbusError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GatewayUnreachableFailure value)?  gatewayUnreachable,TResult Function( RequestTimeoutFailure value)?  requestTimeout,TResult Function( SlaveTimeoutFailure value)?  slaveTimeout,TResult Function( ModbusExceptionFailure value)?  modbusException,TResult Function( GatewayBusyFailure value)?  gatewayBusy,TResult Function( ReadOnlyFailure value)?  readOnly,TResult Function( InvalidRequestFailure value)?  invalidRequest,TResult Function( ValidationFailure value)?  validation,TResult Function( ConfigurationFailure value)?  configuration,TResult Function( UnexpectedFailure value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GatewayUnreachableFailure() when gatewayUnreachable != null:
return gatewayUnreachable(_that);case RequestTimeoutFailure() when requestTimeout != null:
return requestTimeout(_that);case SlaveTimeoutFailure() when slaveTimeout != null:
return slaveTimeout(_that);case ModbusExceptionFailure() when modbusException != null:
return modbusException(_that);case GatewayBusyFailure() when gatewayBusy != null:
return gatewayBusy(_that);case ReadOnlyFailure() when readOnly != null:
return readOnly(_that);case InvalidRequestFailure() when invalidRequest != null:
return invalidRequest(_that);case ValidationFailure() when validation != null:
return validation(_that);case ConfigurationFailure() when configuration != null:
return configuration(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GatewayUnreachableFailure value)  gatewayUnreachable,required TResult Function( RequestTimeoutFailure value)  requestTimeout,required TResult Function( SlaveTimeoutFailure value)  slaveTimeout,required TResult Function( ModbusExceptionFailure value)  modbusException,required TResult Function( GatewayBusyFailure value)  gatewayBusy,required TResult Function( ReadOnlyFailure value)  readOnly,required TResult Function( InvalidRequestFailure value)  invalidRequest,required TResult Function( ValidationFailure value)  validation,required TResult Function( ConfigurationFailure value)  configuration,required TResult Function( UnexpectedFailure value)  unexpected,}){
final _that = this;
switch (_that) {
case GatewayUnreachableFailure():
return gatewayUnreachable(_that);case RequestTimeoutFailure():
return requestTimeout(_that);case SlaveTimeoutFailure():
return slaveTimeout(_that);case ModbusExceptionFailure():
return modbusException(_that);case GatewayBusyFailure():
return gatewayBusy(_that);case ReadOnlyFailure():
return readOnly(_that);case InvalidRequestFailure():
return invalidRequest(_that);case ValidationFailure():
return validation(_that);case ConfigurationFailure():
return configuration(_that);case UnexpectedFailure():
return unexpected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GatewayUnreachableFailure value)?  gatewayUnreachable,TResult? Function( RequestTimeoutFailure value)?  requestTimeout,TResult? Function( SlaveTimeoutFailure value)?  slaveTimeout,TResult? Function( ModbusExceptionFailure value)?  modbusException,TResult? Function( GatewayBusyFailure value)?  gatewayBusy,TResult? Function( ReadOnlyFailure value)?  readOnly,TResult? Function( InvalidRequestFailure value)?  invalidRequest,TResult? Function( ValidationFailure value)?  validation,TResult? Function( ConfigurationFailure value)?  configuration,TResult? Function( UnexpectedFailure value)?  unexpected,}){
final _that = this;
switch (_that) {
case GatewayUnreachableFailure() when gatewayUnreachable != null:
return gatewayUnreachable(_that);case RequestTimeoutFailure() when requestTimeout != null:
return requestTimeout(_that);case SlaveTimeoutFailure() when slaveTimeout != null:
return slaveTimeout(_that);case ModbusExceptionFailure() when modbusException != null:
return modbusException(_that);case GatewayBusyFailure() when gatewayBusy != null:
return gatewayBusy(_that);case ReadOnlyFailure() when readOnly != null:
return readOnly(_that);case InvalidRequestFailure() when invalidRequest != null:
return invalidRequest(_that);case ValidationFailure() when validation != null:
return validation(_that);case ConfigurationFailure() when configuration != null:
return configuration(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String detail)?  gatewayUnreachable,TResult Function()?  requestTimeout,TResult Function( ModbusErrorContext? context)?  slaveTimeout,TResult Function( String code,  String message,  ModbusErrorContext? context)?  modbusException,TResult Function()?  gatewayBusy,TResult Function()?  readOnly,TResult Function( String code,  String message)?  invalidRequest,TResult Function( String message)?  validation,TResult Function( String message)?  configuration,TResult Function( String detail)?  unexpected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GatewayUnreachableFailure() when gatewayUnreachable != null:
return gatewayUnreachable(_that.detail);case RequestTimeoutFailure() when requestTimeout != null:
return requestTimeout();case SlaveTimeoutFailure() when slaveTimeout != null:
return slaveTimeout(_that.context);case ModbusExceptionFailure() when modbusException != null:
return modbusException(_that.code,_that.message,_that.context);case GatewayBusyFailure() when gatewayBusy != null:
return gatewayBusy();case ReadOnlyFailure() when readOnly != null:
return readOnly();case InvalidRequestFailure() when invalidRequest != null:
return invalidRequest(_that.code,_that.message);case ValidationFailure() when validation != null:
return validation(_that.message);case ConfigurationFailure() when configuration != null:
return configuration(_that.message);case UnexpectedFailure() when unexpected != null:
return unexpected(_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String detail)  gatewayUnreachable,required TResult Function()  requestTimeout,required TResult Function( ModbusErrorContext? context)  slaveTimeout,required TResult Function( String code,  String message,  ModbusErrorContext? context)  modbusException,required TResult Function()  gatewayBusy,required TResult Function()  readOnly,required TResult Function( String code,  String message)  invalidRequest,required TResult Function( String message)  validation,required TResult Function( String message)  configuration,required TResult Function( String detail)  unexpected,}) {final _that = this;
switch (_that) {
case GatewayUnreachableFailure():
return gatewayUnreachable(_that.detail);case RequestTimeoutFailure():
return requestTimeout();case SlaveTimeoutFailure():
return slaveTimeout(_that.context);case ModbusExceptionFailure():
return modbusException(_that.code,_that.message,_that.context);case GatewayBusyFailure():
return gatewayBusy();case ReadOnlyFailure():
return readOnly();case InvalidRequestFailure():
return invalidRequest(_that.code,_that.message);case ValidationFailure():
return validation(_that.message);case ConfigurationFailure():
return configuration(_that.message);case UnexpectedFailure():
return unexpected(_that.detail);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String detail)?  gatewayUnreachable,TResult? Function()?  requestTimeout,TResult? Function( ModbusErrorContext? context)?  slaveTimeout,TResult? Function( String code,  String message,  ModbusErrorContext? context)?  modbusException,TResult? Function()?  gatewayBusy,TResult? Function()?  readOnly,TResult? Function( String code,  String message)?  invalidRequest,TResult? Function( String message)?  validation,TResult? Function( String message)?  configuration,TResult? Function( String detail)?  unexpected,}) {final _that = this;
switch (_that) {
case GatewayUnreachableFailure() when gatewayUnreachable != null:
return gatewayUnreachable(_that.detail);case RequestTimeoutFailure() when requestTimeout != null:
return requestTimeout();case SlaveTimeoutFailure() when slaveTimeout != null:
return slaveTimeout(_that.context);case ModbusExceptionFailure() when modbusException != null:
return modbusException(_that.code,_that.message,_that.context);case GatewayBusyFailure() when gatewayBusy != null:
return gatewayBusy();case ReadOnlyFailure() when readOnly != null:
return readOnly();case InvalidRequestFailure() when invalidRequest != null:
return invalidRequest(_that.code,_that.message);case ValidationFailure() when validation != null:
return validation(_that.message);case ConfigurationFailure() when configuration != null:
return configuration(_that.message);case UnexpectedFailure() when unexpected != null:
return unexpected(_that.detail);case _:
  return null;

}
}

}

/// @nodoc


class GatewayUnreachableFailure extends Failure {
  const GatewayUnreachableFailure({this.detail = ''}): super._();
  

@JsonKey() final  String detail;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GatewayUnreachableFailureCopyWith<GatewayUnreachableFailure> get copyWith => _$GatewayUnreachableFailureCopyWithImpl<GatewayUnreachableFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayUnreachableFailure&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,detail);

@override
String toString() {
  return 'Failure.gatewayUnreachable(detail: $detail)';
}


}

/// @nodoc
abstract mixin class $GatewayUnreachableFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $GatewayUnreachableFailureCopyWith(GatewayUnreachableFailure value, $Res Function(GatewayUnreachableFailure) _then) = _$GatewayUnreachableFailureCopyWithImpl;
@useResult
$Res call({
 String detail
});




}
/// @nodoc
class _$GatewayUnreachableFailureCopyWithImpl<$Res>
    implements $GatewayUnreachableFailureCopyWith<$Res> {
  _$GatewayUnreachableFailureCopyWithImpl(this._self, this._then);

  final GatewayUnreachableFailure _self;
  final $Res Function(GatewayUnreachableFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,}) {
  return _then(GatewayUnreachableFailure(
detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RequestTimeoutFailure extends Failure {
  const RequestTimeoutFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestTimeoutFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.requestTimeout()';
}


}




/// @nodoc


class SlaveTimeoutFailure extends Failure {
  const SlaveTimeoutFailure({this.context}): super._();
  

 final  ModbusErrorContext? context;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlaveTimeoutFailureCopyWith<SlaveTimeoutFailure> get copyWith => _$SlaveTimeoutFailureCopyWithImpl<SlaveTimeoutFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlaveTimeoutFailure&&(identical(other.context, context) || other.context == context));
}


@override
int get hashCode => Object.hash(runtimeType,context);

@override
String toString() {
  return 'Failure.slaveTimeout(context: $context)';
}


}

/// @nodoc
abstract mixin class $SlaveTimeoutFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $SlaveTimeoutFailureCopyWith(SlaveTimeoutFailure value, $Res Function(SlaveTimeoutFailure) _then) = _$SlaveTimeoutFailureCopyWithImpl;
@useResult
$Res call({
 ModbusErrorContext? context
});


$ModbusErrorContextCopyWith<$Res>? get context;

}
/// @nodoc
class _$SlaveTimeoutFailureCopyWithImpl<$Res>
    implements $SlaveTimeoutFailureCopyWith<$Res> {
  _$SlaveTimeoutFailureCopyWithImpl(this._self, this._then);

  final SlaveTimeoutFailure _self;
  final $Res Function(SlaveTimeoutFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? context = freezed,}) {
  return _then(SlaveTimeoutFailure(
context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as ModbusErrorContext?,
  ));
}

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModbusErrorContextCopyWith<$Res>? get context {
    if (_self.context == null) {
    return null;
  }

  return $ModbusErrorContextCopyWith<$Res>(_self.context!, (value) {
    return _then(_self.copyWith(context: value));
  });
}
}

/// @nodoc


class ModbusExceptionFailure extends Failure {
  const ModbusExceptionFailure({required this.code, required this.message, this.context}): super._();
  

 final  String code;
 final  String message;
 final  ModbusErrorContext? context;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModbusExceptionFailureCopyWith<ModbusExceptionFailure> get copyWith => _$ModbusExceptionFailureCopyWithImpl<ModbusExceptionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModbusExceptionFailure&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.context, context) || other.context == context));
}


@override
int get hashCode => Object.hash(runtimeType,code,message,context);

@override
String toString() {
  return 'Failure.modbusException(code: $code, message: $message, context: $context)';
}


}

/// @nodoc
abstract mixin class $ModbusExceptionFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ModbusExceptionFailureCopyWith(ModbusExceptionFailure value, $Res Function(ModbusExceptionFailure) _then) = _$ModbusExceptionFailureCopyWithImpl;
@useResult
$Res call({
 String code, String message, ModbusErrorContext? context
});


$ModbusErrorContextCopyWith<$Res>? get context;

}
/// @nodoc
class _$ModbusExceptionFailureCopyWithImpl<$Res>
    implements $ModbusExceptionFailureCopyWith<$Res> {
  _$ModbusExceptionFailureCopyWithImpl(this._self, this._then);

  final ModbusExceptionFailure _self;
  final $Res Function(ModbusExceptionFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? context = freezed,}) {
  return _then(ModbusExceptionFailure(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as ModbusErrorContext?,
  ));
}

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModbusErrorContextCopyWith<$Res>? get context {
    if (_self.context == null) {
    return null;
  }

  return $ModbusErrorContextCopyWith<$Res>(_self.context!, (value) {
    return _then(_self.copyWith(context: value));
  });
}
}

/// @nodoc


class GatewayBusyFailure extends Failure {
  const GatewayBusyFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GatewayBusyFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.gatewayBusy()';
}


}




/// @nodoc


class ReadOnlyFailure extends Failure {
  const ReadOnlyFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadOnlyFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.readOnly()';
}


}




/// @nodoc


class InvalidRequestFailure extends Failure {
  const InvalidRequestFailure({required this.code, required this.message}): super._();
  

 final  String code;
 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidRequestFailureCopyWith<InvalidRequestFailure> get copyWith => _$InvalidRequestFailureCopyWithImpl<InvalidRequestFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidRequestFailure&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'Failure.invalidRequest(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidRequestFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $InvalidRequestFailureCopyWith(InvalidRequestFailure value, $Res Function(InvalidRequestFailure) _then) = _$InvalidRequestFailureCopyWithImpl;
@useResult
$Res call({
 String code, String message
});




}
/// @nodoc
class _$InvalidRequestFailureCopyWithImpl<$Res>
    implements $InvalidRequestFailureCopyWith<$Res> {
  _$InvalidRequestFailureCopyWithImpl(this._self, this._then);

  final InvalidRequestFailure _self;
  final $Res Function(InvalidRequestFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,}) {
  return _then(InvalidRequestFailure(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ValidationFailure extends Failure {
  const ValidationFailure(this.message): super._();
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationFailureCopyWith<ValidationFailure> get copyWith => _$ValidationFailureCopyWithImpl<ValidationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.validation(message: $message)';
}


}

/// @nodoc
abstract mixin class $ValidationFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ValidationFailureCopyWith(ValidationFailure value, $Res Function(ValidationFailure) _then) = _$ValidationFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ValidationFailureCopyWithImpl<$Res>
    implements $ValidationFailureCopyWith<$Res> {
  _$ValidationFailureCopyWithImpl(this._self, this._then);

  final ValidationFailure _self;
  final $Res Function(ValidationFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ValidationFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConfigurationFailure extends Failure {
  const ConfigurationFailure(this.message): super._();
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigurationFailureCopyWith<ConfigurationFailure> get copyWith => _$ConfigurationFailureCopyWithImpl<ConfigurationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigurationFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.configuration(message: $message)';
}


}

/// @nodoc
abstract mixin class $ConfigurationFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ConfigurationFailureCopyWith(ConfigurationFailure value, $Res Function(ConfigurationFailure) _then) = _$ConfigurationFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ConfigurationFailureCopyWithImpl<$Res>
    implements $ConfigurationFailureCopyWith<$Res> {
  _$ConfigurationFailureCopyWithImpl(this._self, this._then);

  final ConfigurationFailure _self;
  final $Res Function(ConfigurationFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ConfigurationFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnexpectedFailure extends Failure {
  const UnexpectedFailure({this.detail = ''}): super._();
  

@JsonKey() final  String detail;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedFailureCopyWith<UnexpectedFailure> get copyWith => _$UnexpectedFailureCopyWithImpl<UnexpectedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedFailure&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,detail);

@override
String toString() {
  return 'Failure.unexpected(detail: $detail)';
}


}

/// @nodoc
abstract mixin class $UnexpectedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnexpectedFailureCopyWith(UnexpectedFailure value, $Res Function(UnexpectedFailure) _then) = _$UnexpectedFailureCopyWithImpl;
@useResult
$Res call({
 String detail
});




}
/// @nodoc
class _$UnexpectedFailureCopyWithImpl<$Res>
    implements $UnexpectedFailureCopyWith<$Res> {
  _$UnexpectedFailureCopyWithImpl(this._self, this._then);

  final UnexpectedFailure _self;
  final $Res Function(UnexpectedFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,}) {
  return _then(UnexpectedFailure(
detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
