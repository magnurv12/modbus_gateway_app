import 'dart:async';

import '../../domain/domain.dart';
import '../datasources/datasources.dart';
import '../live/subscription_planner.dart';
import '../mappers/failure_mapper.dart';
import '../models/models.dart';

/// Implementação de [ILiveDataRepository].
///
/// Responsabilidades:
/// * manter **uma** conexão de streaming para o app inteiro;
/// * assinar as faixas calculadas pelo [SubscriptionPlanner] a cada `hello`;
/// * aplicar `snapshot`/`update` num espelho bruto e decodificar as tags;
/// * marcar qualidade (`bad` em erro de polling, `stale` sem conexão);
/// * reconectar com backoff exponencial;
/// * amostrar tendências em intervalo fixo (o gateway só envia mudanças,
///   então sem amostragem uma tag estável não teria pontos no gráfico).
class LiveDataRepositoryImpl implements ILiveDataRepository {
  final ILiveStreamDataSource _dataSource;
  final TagCodec _codec;
  final Duration _interval;
  final Duration _trendSampling;
  final int _trendCapacity;
  final DateTime Function() _now;

  /// Espera entre tentativas de reconexão.
  static const backoff = [
    Duration(seconds: 1),
    Duration(seconds: 2),
    Duration(seconds: 5),
    Duration(seconds: 10),
    Duration(seconds: 15),
  ];

  final StreamController<PlantLiveState> _states =
      StreamController<PlantLiveState>.broadcast();

  PlantLiveState _state = PlantLiveState.initial;
  List<SubscriptionPlan> _plans = const [];
  final Map<String, Map<int, int>> _raw = {};

  StreamSubscription<WsMessage>? _connection;
  Timer? _retryTimer;
  Timer? _trendTimer;
  int _attempt = 0;
  bool _started = false;
  bool _active = true;

  /// Cria um [LiveDataRepositoryImpl].
  LiveDataRepositoryImpl(
    this._dataSource,
    this._codec, {
    required Duration interval,
    Duration trendSampling = const Duration(seconds: 1),
    int trendCapacity = 300,
    DateTime Function()? now,
  }) : _interval = interval,
       _trendSampling = trendSampling,
       _trendCapacity = trendCapacity,
       _now = now ?? DateTime.now;

  @override
  PlantLiveState get current => _state;

  @override
  Stream<PlantLiveState> watch(Plant plant) async* {
    _start(plant);
    yield _state;
    yield* _states.stream;
  }

  @override
  void setActive(bool active) {
    if (active == _active) return;
    _active = active;
    if (!_started) return;
    if (active) {
      _attempt = 0;
      _connect();
      _startTrendSampling();
    } else {
      _teardownConnection();
      _trendTimer?.cancel();
      _emit(
        _markAll(
          TagQuality.stale,
        ).copyWith(status: LiveConnectionStatus.paused, nextRetryAt: null),
      );
    }
  }

  @override
  void reconnectNow() {
    if (!_started || !_active) return;
    _connect();
  }

  // ---------------------------------------------------------------------------
  // Conexão
  // ---------------------------------------------------------------------------

  void _start(Plant plant) {
    if (_started) return;
    _started = true;
    try {
      _plans = SubscriptionPlanner.plan(plant.allTags);
    } on StateError catch (e) {
      _emit(
        _state.copyWith(
          status: LiveConnectionStatus.reconnecting,
          connectionFailure: Failure.configuration(e.message),
        ),
      );
      return;
    }
    if (_active) {
      _connect();
      _startTrendSampling();
    }
  }

  void _connect() {
    _teardownConnection();
    _emit(
      _state.copyWith(
        status: _attempt == 0
            ? LiveConnectionStatus.connecting
            : LiveConnectionStatus.reconnecting,
        nextRetryAt: null,
      ),
    );
    _connection = _dataSource.connect().listen(
      _onMessage,
      onError: (Object error) =>
          _onDisconnected(FailureMapper.fromException(error)),
      onDone: () => _onDisconnected(
        const Failure.gatewayUnreachable(detail: 'Conexão encerrada.'),
      ),
      cancelOnError: true,
    );
  }

  void _teardownConnection() {
    _retryTimer?.cancel();
    _retryTimer = null;
    final connection = _connection;
    _connection = null;
    unawaited(connection?.cancel());
  }

  void _onDisconnected(Failure failure) {
    _connection = null;
    if (!_active) return;
    final delay = backoff[_attempt.clamp(0, backoff.length - 1)];
    _attempt++;
    _emit(
      _markAll(TagQuality.stale).copyWith(
        status: LiveConnectionStatus.reconnecting,
        connectionFailure: failure,
        nextRetryAt: _now().add(delay),
      ),
    );
    _retryTimer = Timer(delay, _connect);
  }

  // ---------------------------------------------------------------------------
  // Mensagens
  // ---------------------------------------------------------------------------

  void _onMessage(WsMessage message) {
    switch (message) {
      case WsHello():
        _attempt = 0;
        _raw.clear();
        for (final plan in _plans) {
          _dataSource.subscribe(
            LiveSubscription(
              id: plan.id,
              table: plan.table,
              slave: plan.slave,
              start: plan.start,
              count: plan.count,
              interval: _interval,
            ),
          );
        }
        _emit(
          _state.copyWith(
            status: LiveConnectionStatus.online,
            connectionFailure: null,
            nextRetryAt: null,
          ),
        );

      case WsSnapshot(:final id, :final startAddress, :final values):
        _raw[id] = {
          for (var i = 0; i < values.length; i++) startAddress + i: values[i],
        };
        _decodePlan(id);

      case WsUpdate(:final id, :final changes):
        final mirror = _raw[id];
        if (mirror == null) return; // update antes do snapshot: ignora
        for (final change in changes) {
          mirror[change.address] = change.value;
        }
        _decodePlan(id);

      case WsError(:final id, :final raw):
        final failure = FailureMapper.fromStreamError(raw);
        final plan = _planById(id);
        if (plan == null) {
          // Erro de conexão (ex.: too_many_clients): mostra no banner.
          _emit(_state.copyWith(connectionFailure: failure));
          return;
        }
        _emit(_withQuality(plan.tags, TagQuality.bad, failure));

      case WsSubscribed() || WsUnsubscribed():
        break;
    }
  }

  SubscriptionPlan? _planById(String? id) {
    for (final plan in _plans) {
      if (plan.id == id) return plan;
    }
    return null;
  }

  void _decodePlan(String id) {
    final plan = _planById(id);
    final mirror = _raw[id];
    if (plan == null || mirror == null) return;

    final now = _now();
    final readings = Map<String, TagReading>.of(_state.readings);
    var changed = false;
    for (final tag in plan.tags) {
      final value = _codec.decode(tag, (address) => mirror[address]);
      if (value == null) continue;
      final previous = readings[tag.id];
      if (previous != null &&
          previous.value == value &&
          previous.quality == TagQuality.good) {
        continue;
      }
      readings[tag.id] = TagReading(
        tagId: tag.id,
        value: value,
        updatedAt: now,
      );
      changed = true;
    }
    if (changed) _emit(_state.copyWith(readings: readings));
  }

  // ---------------------------------------------------------------------------
  // Qualidade e tendências
  // ---------------------------------------------------------------------------

  PlantLiveState _markAll(TagQuality quality) {
    return _state.copyWith(
      readings: {
        for (final entry in _state.readings.entries)
          entry.key: entry.value.copyWith(quality: quality),
      },
    );
  }

  PlantLiveState _withQuality(
    List<TagDefinition> tags,
    TagQuality quality,
    Failure failure,
  ) {
    final readings = Map<String, TagReading>.of(_state.readings);
    for (final tag in tags) {
      final previous = readings[tag.id];
      if (previous == null) continue;
      readings[tag.id] = previous.copyWith(quality: quality, failure: failure);
    }
    return _state.copyWith(readings: readings);
  }

  void _startTrendSampling() {
    _trendTimer?.cancel();
    _trendTimer = Timer.periodic(_trendSampling, (_) => _sampleTrends());
  }

  void _sampleTrends() {
    if (_state.readings.isEmpty) return;
    final now = _now();
    final trends = <String, List<TrendPoint>>{};
    for (final reading in _state.readings.values) {
      final history = _state.trend(reading.tagId);
      if (reading.quality != TagQuality.good) {
        trends[reading.tagId] = history;
        continue;
      }
      final start = history.length >= _trendCapacity
          ? history.length - _trendCapacity + 1
          : 0;
      trends[reading.tagId] = List.unmodifiable([
        ...history.skip(start),
        TrendPoint(time: now, value: reading.value.asDouble),
      ]);
    }
    _emit(_state.copyWith(trends: trends));
  }

  void _emit(PlantLiveState state) {
    _state = state;
    if (!_states.isClosed) _states.add(state);
  }

  /// Libera timers e conexão (usado em testes).
  Future<void> dispose() async {
    _teardownConnection();
    _trendTimer?.cancel();
    await _states.close();
  }
}
