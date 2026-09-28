import 'package:flutter/material.dart';

/// Paleta semântica do supervisório.
///
/// Segue a filosofia ISA-101 (HMI de alto desempenho): a tela em operação
/// normal é quase monocromática, e **cor saturada significa anormalidade**.
/// Assim um alarme salta aos olhos em vez de competir com decoração.
///
/// Os widgets nunca usam [Color] literal: sempre `context.colors.<papel>`.
@immutable
class DsColors extends ThemeExtension<DsColors> {
  /// Fundo da tela.
  final Color background;

  /// Superfície de cards.
  final Color surface;

  /// Superfície elevada (sheets, diálogos, card pressionado).
  final Color surfaceRaised;

  /// Superfície rebaixada (trilhos de gauges, campos).
  final Color surfaceSunken;

  /// Borda sutil.
  final Color border;

  /// Borda de destaque/foco.
  final Color borderStrong;

  /// Texto principal.
  final Color textPrimary;

  /// Texto secundário.
  final Color textSecondary;

  /// Texto terciário/legendas.
  final Color textMuted;

  /// Cor de interação (botões, seleção, links).
  final Color accent;

  /// Fundo suave de elementos com [accent].
  final Color accentMuted;

  /// Conteúdo sobre [accent].
  final Color onAccent;

  /// Equipamento em operação (tom neutro claro, não verde — ISA-101).
  final Color running;

  /// Equipamento parado.
  final Color stopped;

  /// Sucesso de uma ação do operador (feedback transitório).
  final Color success;

  /// Alarme crítico (prioridade 1).
  final Color alarmCritical;

  /// Alarme alto (prioridade 2).
  final Color alarmHigh;

  /// Alarme médio (prioridade 3).
  final Color alarmMedium;

  /// Alarme baixo/informativo (prioridade 4).
  final Color alarmLow;

  /// Qualidade ruim / falha de comunicação (magenta, convenção de HMI).
  final Color badQuality;

  /// Traço de tendências.
  final Color trendLine;

  /// Preenchimento de nível/processo (água).
  final Color process;

  /// Cria um [DsColors].
  const DsColors({
    required this.background,
    required this.surface,
    required this.surfaceRaised,
    required this.surfaceSunken,
    required this.border,
    required this.borderStrong,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.accent,
    required this.accentMuted,
    required this.onAccent,
    required this.running,
    required this.stopped,
    required this.success,
    required this.alarmCritical,
    required this.alarmHigh,
    required this.alarmMedium,
    required this.alarmLow,
    required this.badQuality,
    required this.trendLine,
    required this.process,
  });

  /// Tema escuro (sala de controle).
  static const dark = DsColors(
    background: Color(0xFF0D1014),
    surface: Color(0xFF151A20),
    surfaceRaised: Color(0xFF1C232B),
    surfaceSunken: Color(0xFF0A0D10),
    border: Color(0xFF252D36),
    borderStrong: Color(0xFF3A4550),
    textPrimary: Color(0xFFE6EAEE),
    textSecondary: Color(0xFFA3AEB9),
    textMuted: Color(0xFF6B7784),
    accent: Color(0xFF4FB3D9),
    accentMuted: Color(0xFF15313D),
    onAccent: Color(0xFF04141B),
    running: Color(0xFFD5DDE4),
    stopped: Color(0xFF55616D),
    success: Color(0xFF3DBE8B),
    alarmCritical: Color(0xFFFF4D4F),
    alarmHigh: Color(0xFFFF8A3D),
    alarmMedium: Color(0xFFFFC53D),
    alarmLow: Color(0xFF8FA3FF),
    badQuality: Color(0xFFE040C8),
    trendLine: Color(0xFF7FC8E6),
    process: Color(0xFF2F7FA8),
  );

  /// Tema claro (campo, luz do dia) — cinza claro como recomenda a ISA-101.
  static const light = DsColors(
    background: Color(0xFFE9ECEF),
    surface: Color(0xFFF7F8FA),
    surfaceRaised: Color(0xFFFFFFFF),
    surfaceSunken: Color(0xFFDCE1E6),
    border: Color(0xFFCDD3DA),
    borderStrong: Color(0xFFA6AFB9),
    textPrimary: Color(0xFF15191E),
    textSecondary: Color(0xFF4B5561),
    textMuted: Color(0xFF7A8490),
    accent: Color(0xFF1B6E94),
    accentMuted: Color(0xFFD3E7F0),
    onAccent: Color(0xFFFFFFFF),
    running: Color(0xFF2B333C),
    stopped: Color(0xFF9AA4AE),
    success: Color(0xFF16875A),
    alarmCritical: Color(0xFFD7263D),
    alarmHigh: Color(0xFFE0610E),
    alarmMedium: Color(0xFFC99700),
    alarmLow: Color(0xFF4A5FD1),
    badQuality: Color(0xFFB0209A),
    trendLine: Color(0xFF1B6E94),
    process: Color(0xFF5FA8CC),
  );

  @override
  DsColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceRaised,
    Color? surfaceSunken,
    Color? border,
    Color? borderStrong,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? accent,
    Color? accentMuted,
    Color? onAccent,
    Color? running,
    Color? stopped,
    Color? success,
    Color? alarmCritical,
    Color? alarmHigh,
    Color? alarmMedium,
    Color? alarmLow,
    Color? badQuality,
    Color? trendLine,
    Color? process,
  }) {
    return DsColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
      surfaceSunken: surfaceSunken ?? this.surfaceSunken,
      border: border ?? this.border,
      borderStrong: borderStrong ?? this.borderStrong,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      accent: accent ?? this.accent,
      accentMuted: accentMuted ?? this.accentMuted,
      onAccent: onAccent ?? this.onAccent,
      running: running ?? this.running,
      stopped: stopped ?? this.stopped,
      success: success ?? this.success,
      alarmCritical: alarmCritical ?? this.alarmCritical,
      alarmHigh: alarmHigh ?? this.alarmHigh,
      alarmMedium: alarmMedium ?? this.alarmMedium,
      alarmLow: alarmLow ?? this.alarmLow,
      badQuality: badQuality ?? this.badQuality,
      trendLine: trendLine ?? this.trendLine,
      process: process ?? this.process,
    );
  }

  @override
  DsColors lerp(DsColors? other, double t) {
    if (other == null) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return DsColors(
      background: l(background, other.background),
      surface: l(surface, other.surface),
      surfaceRaised: l(surfaceRaised, other.surfaceRaised),
      surfaceSunken: l(surfaceSunken, other.surfaceSunken),
      border: l(border, other.border),
      borderStrong: l(borderStrong, other.borderStrong),
      textPrimary: l(textPrimary, other.textPrimary),
      textSecondary: l(textSecondary, other.textSecondary),
      textMuted: l(textMuted, other.textMuted),
      accent: l(accent, other.accent),
      accentMuted: l(accentMuted, other.accentMuted),
      onAccent: l(onAccent, other.onAccent),
      running: l(running, other.running),
      stopped: l(stopped, other.stopped),
      success: l(success, other.success),
      alarmCritical: l(alarmCritical, other.alarmCritical),
      alarmHigh: l(alarmHigh, other.alarmHigh),
      alarmMedium: l(alarmMedium, other.alarmMedium),
      alarmLow: l(alarmLow, other.alarmLow),
      badQuality: l(badQuality, other.badQuality),
      trendLine: l(trendLine, other.trendLine),
      process: l(process, other.process),
    );
  }
}
