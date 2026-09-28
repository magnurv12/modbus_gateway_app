// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explorer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExplorerLogEntry {

 DateTime get at; String get operation; bool get ok; Duration get latency; String? get detail;
/// Create a copy of ExplorerLogEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExplorerLogEntryCopyWith<ExplorerLogEntry> get copyWith => _$ExplorerLogEntryCopyWithImpl<ExplorerLogEntry>(this as ExplorerLogEntry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExplorerLogEntry&&(identical(other.at, at) || other.at == at)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.latency, latency) || other.latency == latency)&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,at,operation,ok,latency,detail);

@override
String toString() {
  return 'ExplorerLogEntry(at: $at, operation: $operation, ok: $ok, latency: $latency, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $ExplorerLogEntryCopyWith<$Res>  {
  factory $ExplorerLogEntryCopyWith(ExplorerLogEntry value, $Res Function(ExplorerLogEntry) _then) = _$ExplorerLogEntryCopyWithImpl;
@useResult
$Res call({
 DateTime at, String operation, bool ok, Duration latency, String? detail
});




}
/// @nodoc
class _$ExplorerLogEntryCopyWithImpl<$Res>
    implements $ExplorerLogEntryCopyWith<$Res> {
  _$ExplorerLogEntryCopyWithImpl(this._self, this._then);

  final ExplorerLogEntry _self;
  final $Res Function(ExplorerLogEntry) _then;

/// Create a copy of ExplorerLogEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? at = null,Object? operation = null,Object? ok = null,Object? latency = null,Object? detail = freezed,}) {
  return _then(_self.copyWith(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as String,ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,latency: null == latency ? _self.latency : latency // ignore: cast_nullable_to_non_nullable
as Duration,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExplorerLogEntry].
extension ExplorerLogEntryPatterns on ExplorerLogEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExplorerLogEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExplorerLogEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExplorerLogEntry value)  $default,){
final _that = this;
switch (_that) {
case _ExplorerLogEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExplorerLogEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ExplorerLogEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime at,  String operation,  bool ok,  Duration latency,  String? detail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExplorerLogEntry() when $default != null:
return $default(_that.at,_that.operation,_that.ok,_that.latency,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime at,  String operation,  bool ok,  Duration latency,  String? detail)  $default,) {final _that = this;
switch (_that) {
case _ExplorerLogEntry():
return $default(_that.at,_that.operation,_that.ok,_that.latency,_that.detail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime at,  String operation,  bool ok,  Duration latency,  String? detail)?  $default,) {final _that = this;
switch (_that) {
case _ExplorerLogEntry() when $default != null:
return $default(_that.at,_that.operation,_that.ok,_that.latency,_that.detail);case _:
  return null;

}
}

}

/// @nodoc


class _ExplorerLogEntry implements ExplorerLogEntry {
  const _ExplorerLogEntry({required this.at, required this.operation, required this.ok, required this.latency, this.detail});
  

@override final  DateTime at;
@override final  String operation;
@override final  bool ok;
@override final  Duration latency;
@override final  String? detail;

/// Create a copy of ExplorerLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExplorerLogEntryCopyWith<_ExplorerLogEntry> get copyWith => __$ExplorerLogEntryCopyWithImpl<_ExplorerLogEntry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExplorerLogEntry&&(identical(other.at, at) || other.at == at)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.ok, ok) || other.ok == ok)&&(identical(other.latency, latency) || other.latency == latency)&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,at,operation,ok,latency,detail);

@override
String toString() {
  return 'ExplorerLogEntry(at: $at, operation: $operation, ok: $ok, latency: $latency, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$ExplorerLogEntryCopyWith<$Res> implements $ExplorerLogEntryCopyWith<$Res> {
  factory _$ExplorerLogEntryCopyWith(_ExplorerLogEntry value, $Res Function(_ExplorerLogEntry) _then) = __$ExplorerLogEntryCopyWithImpl;
@override @useResult
$Res call({
 DateTime at, String operation, bool ok, Duration latency, String? detail
});




}
/// @nodoc
class __$ExplorerLogEntryCopyWithImpl<$Res>
    implements _$ExplorerLogEntryCopyWith<$Res> {
  __$ExplorerLogEntryCopyWithImpl(this._self, this._then);

  final _ExplorerLogEntry _self;
  final $Res Function(_ExplorerLogEntry) _then;

/// Create a copy of ExplorerLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? at = null,Object? operation = null,Object? ok = null,Object? latency = null,Object? detail = freezed,}) {
  return _then(_ExplorerLogEntry(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as String,ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,latency: null == latency ? _self.latency : latency // ignore: cast_nullable_to_non_nullable
as Duration,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ExplorerState {

 ModbusTable get table; int get slave; int get start; int get count; ExplorerStatus get status; ModbusBlock? get block; Failure? get failure; Duration? get latency;/// Endereço com escrita em andamento.
 int? get writingAddress;/// Leitura contínua ligada.
 bool get autoRefresh; List<ExplorerLogEntry> get log;
/// Create a copy of ExplorerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExplorerStateCopyWith<ExplorerState> get copyWith => _$ExplorerStateCopyWithImpl<ExplorerState>(this as ExplorerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExplorerState&&(identical(other.table, table) || other.table == table)&&(identical(other.slave, slave) || other.slave == slave)&&(identical(other.start, start) || other.start == start)&&(identical(other.count, count) || other.count == count)&&(identical(other.status, status) || other.status == status)&&(identical(other.block, block) || other.block == block)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.latency, latency) || other.latency == latency)&&(identical(other.writingAddress, writingAddress) || other.writingAddress == writingAddress)&&(identical(other.autoRefresh, autoRefresh) || other.autoRefresh == autoRefresh)&&const DeepCollectionEquality().equals(other.log, log));
}


@override
int get hashCode => Object.hash(runtimeType,table,slave,start,count,status,block,failure,latency,writingAddress,autoRefresh,const DeepCollectionEquality().hash(log));

@override
String toString() {
  return 'ExplorerState(table: $table, slave: $slave, start: $start, count: $count, status: $status, block: $block, failure: $failure, latency: $latency, writingAddress: $writingAddress, autoRefresh: $autoRefresh, log: $log)';
}


}

/// @nodoc
abstract mixin class $ExplorerStateCopyWith<$Res>  {
  factory $ExplorerStateCopyWith(ExplorerState value, $Res Function(ExplorerState) _then) = _$ExplorerStateCopyWithImpl;
@useResult
$Res call({
 ModbusTable table, int slave, int start, int count, ExplorerStatus status, ModbusBlock? block, Failure? failure, Duration? latency, int? writingAddress, bool autoRefresh, List<ExplorerLogEntry> log
});


$ModbusBlockCopyWith<$Res>? get block;$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$ExplorerStateCopyWithImpl<$Res>
    implements $ExplorerStateCopyWith<$Res> {
  _$ExplorerStateCopyWithImpl(this._self, this._then);

  final ExplorerState _self;
  final $Res Function(ExplorerState) _then;

/// Create a copy of ExplorerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? table = null,Object? slave = null,Object? start = null,Object? count = null,Object? status = null,Object? block = freezed,Object? failure = freezed,Object? latency = freezed,Object? writingAddress = freezed,Object? autoRefresh = null,Object? log = null,}) {
  return _then(_self.copyWith(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as ModbusTable,slave: null == slave ? _self.slave : slave // ignore: cast_nullable_to_non_nullable
as int,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ExplorerStatus,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as ModbusBlock?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,latency: freezed == latency ? _self.latency : latency // ignore: cast_nullable_to_non_nullable
as Duration?,writingAddress: freezed == writingAddress ? _self.writingAddress : writingAddress // ignore: cast_nullable_to_non_nullable
as int?,autoRefresh: null == autoRefresh ? _self.autoRefresh : autoRefresh // ignore: cast_nullable_to_non_nullable
as bool,log: null == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as List<ExplorerLogEntry>,
  ));
}
/// Create a copy of ExplorerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModbusBlockCopyWith<$Res>? get block {
    if (_self.block == null) {
    return null;
  }

  return $ModbusBlockCopyWith<$Res>(_self.block!, (value) {
    return _then(_self.copyWith(block: value));
  });
}/// Create a copy of ExplorerState
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


/// Adds pattern-matching-related methods to [ExplorerState].
extension ExplorerStatePatterns on ExplorerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExplorerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExplorerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExplorerState value)  $default,){
final _that = this;
switch (_that) {
case _ExplorerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExplorerState value)?  $default,){
final _that = this;
switch (_that) {
case _ExplorerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ModbusTable table,  int slave,  int start,  int count,  ExplorerStatus status,  ModbusBlock? block,  Failure? failure,  Duration? latency,  int? writingAddress,  bool autoRefresh,  List<ExplorerLogEntry> log)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExplorerState() when $default != null:
return $default(_that.table,_that.slave,_that.start,_that.count,_that.status,_that.block,_that.failure,_that.latency,_that.writingAddress,_that.autoRefresh,_that.log);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ModbusTable table,  int slave,  int start,  int count,  ExplorerStatus status,  ModbusBlock? block,  Failure? failure,  Duration? latency,  int? writingAddress,  bool autoRefresh,  List<ExplorerLogEntry> log)  $default,) {final _that = this;
switch (_that) {
case _ExplorerState():
return $default(_that.table,_that.slave,_that.start,_that.count,_that.status,_that.block,_that.failure,_that.latency,_that.writingAddress,_that.autoRefresh,_that.log);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ModbusTable table,  int slave,  int start,  int count,  ExplorerStatus status,  ModbusBlock? block,  Failure? failure,  Duration? latency,  int? writingAddress,  bool autoRefresh,  List<ExplorerLogEntry> log)?  $default,) {final _that = this;
switch (_that) {
case _ExplorerState() when $default != null:
return $default(_that.table,_that.slave,_that.start,_that.count,_that.status,_that.block,_that.failure,_that.latency,_that.writingAddress,_that.autoRefresh,_that.log);case _:
  return null;

}
}

}

/// @nodoc


class _ExplorerState extends ExplorerState {
  const _ExplorerState({this.table = ModbusTable.holding, required this.slave, this.start = 0, this.count = 10, this.status = ExplorerStatus.idle, this.block, this.failure, this.latency, this.writingAddress, this.autoRefresh = false, final  List<ExplorerLogEntry> log = const <ExplorerLogEntry>[]}): _log = log,super._();
  

@override@JsonKey() final  ModbusTable table;
@override final  int slave;
@override@JsonKey() final  int start;
@override@JsonKey() final  int count;
@override@JsonKey() final  ExplorerStatus status;
@override final  ModbusBlock? block;
@override final  Failure? failure;
@override final  Duration? latency;
/// Endereço com escrita em andamento.
@override final  int? writingAddress;
/// Leitura contínua ligada.
@override@JsonKey() final  bool autoRefresh;
 final  List<ExplorerLogEntry> _log;
@override@JsonKey() List<ExplorerLogEntry> get log {
  if (_log is EqualUnmodifiableListView) return _log;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_log);
}


/// Create a copy of ExplorerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExplorerStateCopyWith<_ExplorerState> get copyWith => __$ExplorerStateCopyWithImpl<_ExplorerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExplorerState&&(identical(other.table, table) || other.table == table)&&(identical(other.slave, slave) || other.slave == slave)&&(identical(other.start, start) || other.start == start)&&(identical(other.count, count) || other.count == count)&&(identical(other.status, status) || other.status == status)&&(identical(other.block, block) || other.block == block)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.latency, latency) || other.latency == latency)&&(identical(other.writingAddress, writingAddress) || other.writingAddress == writingAddress)&&(identical(other.autoRefresh, autoRefresh) || other.autoRefresh == autoRefresh)&&const DeepCollectionEquality().equals(other._log, _log));
}


@override
int get hashCode => Object.hash(runtimeType,table,slave,start,count,status,block,failure,latency,writingAddress,autoRefresh,const DeepCollectionEquality().hash(_log));

@override
String toString() {
  return 'ExplorerState(table: $table, slave: $slave, start: $start, count: $count, status: $status, block: $block, failure: $failure, latency: $latency, writingAddress: $writingAddress, autoRefresh: $autoRefresh, log: $log)';
}


}

/// @nodoc
abstract mixin class _$ExplorerStateCopyWith<$Res> implements $ExplorerStateCopyWith<$Res> {
  factory _$ExplorerStateCopyWith(_ExplorerState value, $Res Function(_ExplorerState) _then) = __$ExplorerStateCopyWithImpl;
@override @useResult
$Res call({
 ModbusTable table, int slave, int start, int count, ExplorerStatus status, ModbusBlock? block, Failure? failure, Duration? latency, int? writingAddress, bool autoRefresh, List<ExplorerLogEntry> log
});


@override $ModbusBlockCopyWith<$Res>? get block;@override $FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$ExplorerStateCopyWithImpl<$Res>
    implements _$ExplorerStateCopyWith<$Res> {
  __$ExplorerStateCopyWithImpl(this._self, this._then);

  final _ExplorerState _self;
  final $Res Function(_ExplorerState) _then;

/// Create a copy of ExplorerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? table = null,Object? slave = null,Object? start = null,Object? count = null,Object? status = null,Object? block = freezed,Object? failure = freezed,Object? latency = freezed,Object? writingAddress = freezed,Object? autoRefresh = null,Object? log = null,}) {
  return _then(_ExplorerState(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as ModbusTable,slave: null == slave ? _self.slave : slave // ignore: cast_nullable_to_non_nullable
as int,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ExplorerStatus,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as ModbusBlock?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,latency: freezed == latency ? _self.latency : latency // ignore: cast_nullable_to_non_nullable
as Duration?,writingAddress: freezed == writingAddress ? _self.writingAddress : writingAddress // ignore: cast_nullable_to_non_nullable
as int?,autoRefresh: null == autoRefresh ? _self.autoRefresh : autoRefresh // ignore: cast_nullable_to_non_nullable
as bool,log: null == log ? _self._log : log // ignore: cast_nullable_to_non_nullable
as List<ExplorerLogEntry>,
  ));
}

/// Create a copy of ExplorerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModbusBlockCopyWith<$Res>? get block {
    if (_self.block == null) {
    return null;
  }

  return $ModbusBlockCopyWith<$Res>(_self.block!, (value) {
    return _then(_self.copyWith(block: value));
  });
}/// Create a copy of ExplorerState
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

// dart format on
