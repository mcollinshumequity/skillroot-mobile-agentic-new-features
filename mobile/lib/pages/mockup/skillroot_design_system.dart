// skillroot_design_system.dart
// Auto‑generated from the Google Stitch "SkillROOT Design System"
// This file lives in mobile/lib/pages/mockup and provides a ThemeData
// that matches the design tokens defined in Stitch.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ---------------------------------------------------------------------------
// Color palette – all colors are taken directly from the Stitch JSON output.
// ---------------------------------------------------------------------------
class SkillrootColors {
  // Primary palette
  static const Color primary = Color(0xFF00599F);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF0B72C7);
  static const Color onPrimaryContainer = Color(0xFFF2F5FF);
  static const Color primaryFixed = Color(0xFFD3E3FF);
  static const Color primaryFixedDim = Color(0xFFA3C9FF);
  static const Color onPrimaryFixed = Color(0xFF001C38);
  static const Color onPrimaryFixedVariant = Color(0xFF004882);

  // Secondary palette
  static const Color secondary = Color(0xFF914D00);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFFc9024);
  static const Color onSecondaryContainer = Color(0xFF633300);
  static const Color secondaryFixed = Color(0xFFFFDCC3);
  static const Color secondaryFixedDim = Color(0xFFFFB77E);
  static const Color onSecondaryFixed = Color(0xFF2F1500);
  static const Color onSecondaryFixedVariant = Color(0xFF6E3900);

  // Tertiary palette
  static const Color tertiary = Color(0xFF8D4400);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFB25700);
  static const Color onTertiaryContainer = Color(0xFFFFF3EE);
  static const Color tertiaryFixed = Color(0xFFFFDBC7);
  static const Color tertiaryFixedDim = Color(0xFFFFB687);
  static const Color onTertiaryFixed = Color(0xFF311300);
  static const Color onTertiaryFixedVariant = Color(0xFF733600);

  // Surface palette
  static const Color surface = Color(0xFFF8F9FF);
  static const Color surfaceDim = Color(0xFFD8DAE1);
  static const Color surfaceBright = Color(0xFFF6F8FB);
  static const Color surfaceContainer = Color(0xFFECEEF5);
  static const Color surfaceContainerLow = Color(0xFFF2F3FB);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerHigh = Color(0xFFE6E8F0);
  static const Color surfaceContainerHighest = Color(0xFFE0E2EA);
  static const Color surfaceDark = Color(0xFF242526);
  static const Color surfaceLight = Color(0xFFF6F8FB);
  static const Color surfaceVariant = Color(0xFFE0E2EA);

  // Error palette
  static const Color error = Color(0xFFFF0000);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  // Miscellaneous tokens
  static const Color background = surface;
  static const Color onBackground = Color(0xFF181C21);
  static const Color onSurface = Color(0xFF181C21);
  static const Color onSurfaceVariant = Color(0xFF414752);
  static const Color inverseSurface = Color(0xFF2D3136);
  static const Color inverseOnSurface = Color(0xFFEFF0F8);
  static const Color outline = Color(0xFF717783);
  static const Color outlineVariant = Color(0xFFC1C7D4);
  static const Color iconLight = Color(0xFF1F2A3D);
  static const Color textSecondary = Color(0xFFA1A1A1);
}

// ---------------------------------------------------------------------------
// Typography – generated from the Stitch design system. We use `google_fonts`
// to load Hanken Grotesk at runtime, matching the exact sizes and line‑heights.
// ---------------------------------------------------------------------------
class SkillrootTypography {
  static TextStyle displayLg = GoogleFonts.hankenGrotesk(
    fontSize: 60,
    fontWeight: FontWeight.w400,
    height: 72 / 60, // line‑height / font‑size
    color: SkillrootColors.onBackground,
  );

  static TextStyle displaySm = GoogleFonts.hankenGrotesk(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    height: 48 / 40,
    color: SkillrootColors.onBackground,
  );

  static TextStyle headlineMd = GoogleFonts.hankenGrotesk(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 32 / 24,
    color: SkillrootColors.onBackground,
  );

  static TextStyle headlineSm = GoogleFonts.hankenGrotesk(
    fontSize: 20.5,
    fontWeight: FontWeight.w700,
    height: 28 / 20.5,
    color: SkillrootColors.onBackground,
  );

  static TextStyle titleLg = GoogleFonts.hankenGrotesk(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 28 / 20,
    color: SkillrootColors.onBackground,
  );

  static TextStyle titleMd = GoogleFonts.hankenGrotesk(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 20 / 15,
    color: SkillrootColors.onBackground,
  );

  static TextStyle titleSm = GoogleFonts.hankenGrotesk(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 20 / 15,
    color: SkillrootColors.onBackground,
  );

  static TextStyle bodyLg = GoogleFonts.hankenGrotesk(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    color: SkillrootColors.onBackground,
  );

  static TextStyle bodyMd = GoogleFonts.hankenGrotesk(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    color: SkillrootColors.onBackground,
  );

  static TextStyle bodySm = GoogleFonts.hankenGrotesk(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    color: SkillrootColors.onBackground,
  );

  static TextStyle labelLg = GoogleFonts.hankenGrotesk(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
    color: SkillrootColors.textSecondary,
  );

  static TextStyle labelSm = GoogleFonts.hankenGrotesk(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 14 / 10,
    color: SkillrootColors.textSecondary,
  );
}

// ---------------------------------------------------------------------------
// Theme generator – returns a Material ThemeData that mirrors the Stitch tokens.
// ---------------------------------------------------------------------------
ThemeData skillrootTheme({bool isDark = false}) {
  final brightness = isDark ? Brightness.dark : Brightness.light;
  final colorScheme = ColorScheme(
    brightness: brightness,
    primary: SkillrootColors.primary,
    onPrimary: SkillrootColors.onPrimary,
    secondary: SkillrootColors.secondary,
    onSecondary: SkillrootColors.onSecondary,
    error: SkillrootColors.error,
    onError: SkillrootColors.onError,
    surface: SkillrootColors.surface,
    onSurface: SkillrootColors.onSurface,
    // The following fields are optional but help with the newer Material3 API.
    primaryContainer: SkillrootColors.primaryContainer,
    onPrimaryContainer: SkillrootColors.onPrimaryContainer,
    secondaryContainer: SkillrootColors.secondaryContainer,
    onSecondaryContainer: SkillrootColors.onSecondaryContainer,
    tertiary: SkillrootColors.tertiary,
    onTertiary: SkillrootColors.onTertiary,
    tertiaryContainer: SkillrootColors.tertiaryContainer,
    onTertiaryContainer: SkillrootColors.onTertiaryContainer,
  );

  // Build a TextTheme from the style constants above.
  final textTheme = TextTheme(
    displayLarge: SkillrootTypography.displayLg,
    displayMedium: SkillrootTypography.displaySm,
    headlineMedium: SkillrootTypography.headlineMd,
    headlineSmall: SkillrootTypography.headlineSm,
    titleLarge: SkillrootTypography.titleLg,
    titleMedium: SkillrootTypography.titleMd,
    titleSmall: SkillrootTypography.titleSm,
    bodyLarge: SkillrootTypography.bodyLg,
    bodyMedium: SkillrootTypography.bodyMd,
    bodySmall: SkillrootTypography.bodySm,
    labelLarge: SkillrootTypography.labelLg,
    labelSmall: SkillrootTypography.labelSm,
  );

  return ThemeData(
    brightness: brightness,
    colorScheme: colorScheme,
    textTheme: textTheme,
    // Use the same rounded corners as defined in the Stitch design system.
    cardTheme: const CardThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    dialogTheme: const DialogThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    // Apply the primary color to app bars, buttons, etc.
    appBarTheme: AppBarTheme(
      backgroundColor: SkillrootColors.primary,
      foregroundColor: SkillrootColors.onPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: SkillrootColors.primary,
        foregroundColor: SkillrootColors.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}

// Quick helper for a dark variant – Stitch also defines a dark surface.\n// You can call `skillrootTheme(isDark: true)` to get the dark mode theme.
