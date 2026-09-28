import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm.freezed.dart';

/// Severidade do alarme, em ordem decrescente de prioridade.
enum AlarmSeverity {
  /// Ação imediata (segurança/equipamento).
  critical,

  /// Ação rápida.
  high,

  /// Atenção.
  medium,

  /// Informativo.
  low;

  /// Menor valor = maior prioridade (útil para ordenação).
  int get priority => index;
}

/// Condição que dispara um alarme.
enum AlarmCondition {
  /// Valor analógico acima do limite.
  above,

  /// Valor analógico abaixo do limite.
  below,

  /// Bit ligado.
  on,

  /// Bit desligado.
  off,
}

/// Regra de alarme configurada em uma tag.
@freezed
abstract class AlarmRule with _$AlarmRule {
  /// Cria uma [AlarmRule].
  const factory AlarmRule({
    required AlarmCondition condition,
    required AlarmSeverity severity,
    required String message,

    /// Limite em unidade de engenharia (para [AlarmCondition.above]/below).
    double? limit,
  }) = _AlarmRule;
}

/// Alarme no ciclo de vida da ISA-18.2.
///
/// Um alarme que volta ao normal sem ser reconhecido continua na lista
/// ("retornado, não reconhecido") até o operador reconhecê-lo — assim um
/// evento transitório nunca passa despercebido.
@freezed
abstract class Alarm with _$Alarm {
  const Alarm._();

  /// Cria um [Alarm].
  const factory Alarm({
    /// Identificador estável: `<tagId>:<índice da regra>`.
    required String id,
    required String tagId,
    required String tagName,
    required String equipmentId,
    required String equipmentTag,
    required AlarmSeverity severity,
    required String message,
    required DateTime raisedAt,

    /// Condição ainda presente.
    required bool active,
    @Default(false) bool acknowledged,
    DateTime? clearedAt,

    /// Valor analógico que disparou o alarme (em unidade de engenharia).
    double? triggerValue,

    /// Limite violado, para regras analógicas.
    double? limit,
    @Default('') String unit,
    @Default(0) int decimals,
  }) = _Alarm;

  /// Exige atenção do operador (ativo ou não reconhecido).
  bool get needsAttention => active || !acknowledged;

  /// Pode sair da lista: reconhecido e já normalizado.
  bool get isResolved => acknowledged && !active;
}
