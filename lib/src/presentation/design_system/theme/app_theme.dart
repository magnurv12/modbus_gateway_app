import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../tokens/ds_colors.dart';
import '../tokens/ds_metrics.dart';
import '../tokens/ds_typography.dart';

/// Monta o [ThemeData] a partir dos tokens.
///
/// Tudo que os componentes Material desenham (AppBar, NavigationBar,
/// botões, inputs, sheets, snackbars, chips...) é configurado aqui, então
/// as telas não passam `style:` avulso — herdam pelo `context`.
abstract final class AppTheme {
  /// Tema escuro.
  static ThemeData get dark => _build(DsColors.dark, Brightness.dark);

  /// Tema claro.
  static ThemeData get light => _build(DsColors.light, Brightness.light);

  static ThemeData _build(DsColors c, Brightness brightness) {
    const spacing = DsSpacing.regular;
    const radius = DsRadius.regular;
    final text = DsTextStyles.from(c);

    final scheme = ColorScheme(
      brightness: brightness,
      primary: c.accent,
      onPrimary: c.onAccent,
      primaryContainer: c.accentMuted,
      onPrimaryContainer: c.textPrimary,
      secondary: c.accent,
      onSecondary: c.onAccent,
      error: c.alarmCritical,
      onError: Colors.white,
      surface: c.surface,
      onSurface: c.textPrimary,
      onSurfaceVariant: c.textSecondary,
      surfaceContainerLowest: c.surfaceSunken,
      surfaceContainerLow: c.background,
      surfaceContainer: c.surface,
      surfaceContainerHigh: c.surfaceRaised,
      surfaceContainerHighest: c.surfaceRaised,
      outline: c.borderStrong,
      outlineVariant: c.border,
    );

    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.background,
      splashFactory: InkSparkle.splashFactory,
      visualDensity: VisualDensity.standard,
    );

    final textTheme = base.textTheme
        .apply(bodyColor: c.textPrimary, displayColor: c.textPrimary)
        .copyWith(
          headlineSmall: base.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
          ),
          titleLarge: base.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
          ),
          titleMedium: base.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: base.textTheme.bodyMedium?.copyWith(
            color: c.textSecondary,
          ),
          bodySmall: base.textTheme.bodySmall?.copyWith(color: c.textMuted),
          labelLarge: base.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        );

    final overlay = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return base.copyWith(
      textTheme: textTheme,
      extensions: [c, spacing, radius, text, DsMotion.regular],
      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        surfaceTintColor: Colors.transparent,
        foregroundColor: c.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
        systemOverlayStyle: overlay.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: c.surface,
        surfaceTintColor: Colors.transparent,
        indicatorColor: c.accentMuted,
        height: 68,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? c.accent
                : c.textSecondary,
          ),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => TextStyle(
            fontSize: 12,
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.w700
                : FontWeight.w500,
            color: states.contains(WidgetState.selected)
                ? c.textPrimary
                : c.textSecondary,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: c.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: radius.lg,
          side: BorderSide(color: c.border),
        ),
      ),
      dividerTheme: DividerThemeData(color: c.border, thickness: 1, space: 1),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: c.accent,
          foregroundColor: c.onAccent,
          disabledBackgroundColor: c.surfaceSunken,
          minimumSize: const Size(64, 48),
          padding: EdgeInsets.symmetric(horizontal: spacing.xl),
          shape: RoundedRectangleBorder(borderRadius: radius.md),
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: c.textPrimary,
          side: BorderSide(color: c.borderStrong),
          minimumSize: const Size(64, 48),
          padding: EdgeInsets.symmetric(horizontal: spacing.xl),
          shape: RoundedRectangleBorder(borderRadius: radius.md),
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: c.accent,
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(borderRadius: radius.md),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: c.textSecondary),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          backgroundColor: c.surface,
          foregroundColor: c.textSecondary,
          selectedBackgroundColor: c.accentMuted,
          selectedForegroundColor: c.textPrimary,
          side: BorderSide(color: c.border),
          shape: RoundedRectangleBorder(borderRadius: radius.md),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: c.surface,
        selectedColor: c.accentMuted,
        side: BorderSide(color: c.border),
        shape: RoundedRectangleBorder(borderRadius: radius.pill),
        labelStyle: TextStyle(
          color: c.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        checkmarkColor: c.accent,
        padding: EdgeInsets.symmetric(horizontal: spacing.sm),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.surfaceSunken,
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing.lg,
          vertical: spacing.md,
        ),
        labelStyle: TextStyle(color: c.textSecondary),
        hintStyle: TextStyle(color: c.textMuted),
        border: OutlineInputBorder(
          borderRadius: radius.md,
          borderSide: BorderSide(color: c.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radius.md,
          borderSide: BorderSide(color: c.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius.md,
          borderSide: BorderSide(color: c.accent, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radius.md,
          borderSide: BorderSide(color: c.alarmCritical),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: radius.md,
          borderSide: BorderSide(color: c.alarmCritical, width: 1.5),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) =>
              s.contains(WidgetState.selected) ? c.onAccent : c.textSecondary,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? c.accent : c.surfaceSunken,
        ),
        trackOutlineColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? c.accent : c.borderStrong,
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: c.accent,
        inactiveTrackColor: c.surfaceSunken,
        thumbColor: c.accent,
        overlayColor: c.accent.withValues(alpha: 0.15),
        valueIndicatorColor: c.surfaceRaised,
        valueIndicatorTextStyle: TextStyle(color: c.textPrimary),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: c.accent,
        linearTrackColor: c.surfaceSunken,
        circularTrackColor: c.surfaceSunken,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.surfaceRaised,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        dragHandleColor: c.borderStrong,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: radius.xl.topLeft),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: c.surfaceRaised,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: radius.xl),
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: c.surfaceRaised,
        contentTextStyle: TextStyle(color: c.textPrimary),
        actionTextColor: c.accent,
        shape: RoundedRectangleBorder(
          borderRadius: radius.md,
          side: BorderSide(color: c.borderStrong),
        ),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: c.textSecondary,
        textColor: c.textPrimary,
        contentPadding: EdgeInsets.symmetric(horizontal: spacing.lg),
      ),
      badgeTheme: BadgeThemeData(
        backgroundColor: c.alarmCritical,
        textColor: Colors.white,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
