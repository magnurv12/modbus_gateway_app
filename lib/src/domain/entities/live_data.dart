import 'package:freezed_annotation/freezed_annotation.dart';

import '../failures/failure.dart';

part 'live_data.freezed.dart';

/// Estado da conexão de streaming com o gateway.
enum LiveConnectionStatus {
  /// Abrindo a primeira conexão.
  connecting,

  /// Conectado e recebendo dados.
  online,

  /// Conexão caiu; nova tentativa agendada.
  reconnecting,

  /// Streaming pausado (app em segundo plano).
  paused,
}

/// Qualidade do valor, no sentido OPC/SCADA.
enum TagQuality {
  /// Valor válido e atual.
  good,

  /// Último valor conhecido, mas a fonte está indisponível.
  stale,

  /// Leitura falhou (timeout, exceção Modbus...).
  bad,
}

/// Valor decodificado de uma tag em unidade de engenharia.
@freezed
sealed class TagValue with _$TagValue {
  const TagValue._();

  /// Valor analógico.
  const factory TagValue.number(double value) = NumberTagValue;

  /// Valor digital.
  const factory TagValue.boolean(bool value) = BooleanTagValue;

  /// Representação numérica (bool → 0/1), útil em gráficos.
  double get asDouble => switch (this) {
        NumberTagValue(:final value) => value,
        BooleanTagValue(:final value) => value ? 1 : 0,
      };
}

/// Leitura atual de uma tag.
@freezed
abstract class TagReading with _$TagReading {
  /// Cria uma [TagReading].
  const factory TagReading({
    required String tagId,
    required TagValue value,
    required DateTime updatedAt,
    @Default(TagQuality.good) TagQuality quality,

    /// Falha que degradou a qualidade, quando [quality] != good.
    Failure? failure,
  }) = _TagReading;
}

/// Ponto de tendência (amostrado em intervalo fixo).
@freezed
abstract class TrendPoint with _$TrendPoint {
  /// Cria um [TrendPoint].
  const factory TrendPoint({
    required DateTime time,
    required double value,
  }) = _TrendPoint;
}

/// Fotografia do estado ao vivo da planta.
@freezed
abstract class PlantLiveState with _$PlantLiveState {
  const PlantLiveState._();

  /// Cria um [PlantLiveState].
  const factory PlantLiveState({
    required LiveConnectionStatus status,
    @Default(<String, TagReading>{}) Map<String, TagReading> readings,
    @Default(<String, List<TrendPoint>>{}) Map<String, List<TrendPoint>> trends,

    /// Última falha de conexão (limpa quando volta a ficar online).
    Failure? connectionFailure,

    /// Próxima tentativa de reconexão, quando [status] == reconnecting.
    DateTime? nextRetryAt,
  }) = _PlantLiveState;

  /// Estado inicial, antes de qualquer conexão.
  static const initial = PlantLiveState(status: LiveConnectionStatus.connecting);

  /// Leitura de uma tag, ou `null` se ainda não chegou.
  TagReading? reading(String tagId) => readings[tagId];

  /// Tendência de uma tag (vazia se ainda não houver pontos).
  List<TrendPoint> trend(String tagId) => trends[tagId] ?? const [];

  /// Valor digital de uma tag, ou `null`.
  bool? boolOf(String tagId) => switch (readings[tagId]?.value) {
        BooleanTagValue(:final value) => value,
        _ => null,
      };

  /// Valor analógico de uma tag, ou `null`.
  double? numberOf(String tagId) => switch (readings[tagId]?.value) {
        NumberTagValue(:final value) => value,
        _ => null,
      };
}
