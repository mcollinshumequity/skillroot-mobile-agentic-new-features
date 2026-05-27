// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

export 'package:skillroot/services/theme_images.dart';
export 'package:skillroot/services/theme_strings.dart';

// Brand palette extracted from the skillROOT logo.
const Color primaryColor = Color(0xff0B72C7); // Deep blue for core actions.
const Color secondaryColor = Color(0xffF68B1E); // Vibrant orange accent.
const Color surfaceColor = Color(0xffF6F8FB); // Soft off-white backgrounds.

class AppTheme {
  static bool isLightTheme = true;

  static ThemeData getTheme() {
    if (isLightTheme) {
      return lightTheme();
    } else {
      return darkTheme();
    }
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      titleMedium: GoogleFonts.urbanist(textStyle: TextStyle(color: base.titleMedium!.color, fontSize: 15)),
      titleSmall: GoogleFonts.urbanist(
        textStyle: TextStyle(color: base.bodySmall!.color, fontSize: 15, fontWeight: FontWeight.w500),
      ),
      bodyLarge: GoogleFonts.urbanist(textStyle: TextStyle(color: base.bodyLarge!.color, fontSize: 14)),
      bodyMedium: GoogleFonts.urbanist(textStyle: TextStyle(color: base.bodyMedium!.color, fontSize: 16)),
      labelLarge: GoogleFonts.urbanist(
        textStyle: TextStyle(color: base.labelLarge!.color, fontSize: 14, fontWeight: FontWeight.w500),
      ),
      displayLarge: GoogleFonts.urbanist(
        textStyle: TextStyle(color: base.titleMedium!.color, fontSize: 15, fontWeight: FontWeight.w500),
      ),
      bodySmall: GoogleFonts.urbanist(textStyle: TextStyle(color: base.bodySmall!.color, fontSize: 12)),
      headlineMedium: GoogleFonts.urbanist(textStyle: TextStyle(color: base.headlineMedium!.color, fontSize: 24)),
      displaySmall: GoogleFonts.urbanist(
        textStyle: TextStyle(color: base.displaySmall!.color, fontSize: 40, fontWeight: FontWeight.w600),
      ),
      displayMedium: GoogleFonts.urbanist(textStyle: TextStyle(color: base.displayMedium!.color, fontSize: 60)),
      headlineSmall: GoogleFonts.urbanist(
        textStyle: TextStyle(color: base.headlineSmall!.color, fontSize: 20.5, fontWeight: FontWeight.w700),
      ),
      titleLarge: GoogleFonts.urbanist(
        textStyle: TextStyle(color: base.titleLarge!.color, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      labelSmall: GoogleFonts.urbanist(textStyle: TextStyle(color: base.labelSmall!.color, fontSize: 10)),
    );
  }

  static ThemeData lightTheme() {
    //Color primaryColor = primaryColor;
    //Color secondaryColor = HexColor(secondaryColorString);
    final ColorScheme colorScheme = ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
      background: surfaceColor,
    ); //Colors.white);

    final ThemeData base = ThemeData.light();
    return base.copyWith(
      appBarTheme: AppBarTheme(color: Colors.white, foregroundColor: Colors.black87, elevation: 0),
      popupMenuTheme: PopupMenuThemeData(color: Colors.white),
      iconTheme: IconThemeData(color: Color(0xff1f2a3d)),
      primaryColor: primaryColor,
      // buttonColor: primaryColor,
      splashColor: Colors.white.withOpacity(0.1),
      hoverColor: Colors.transparent,
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      // accentColor: primaryColor,
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: surfaceColor,
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      indicatorColor: secondaryColor,
      disabledColor: Color(0xffa1a1a1),
      buttonTheme: ButtonThemeData(colorScheme: colorScheme, textTheme: ButtonTextTheme.primary),
      cardColor: Colors.white,
      colorScheme: colorScheme.copyWith(error: Colors.red, background: surfaceColor),
    );
  }

  static ThemeData darkTheme() {
    //Color primaryColor = HexColor(primaryColorString);
    //Color secondaryColor = HexColor(secondaryColorString);
    final ColorScheme colorScheme = ColorScheme.dark().copyWith(primary: primaryColor, secondary: secondaryColor);
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      appBarTheme: AppBarTheme(color: Colors.black),
      popupMenuTheme: PopupMenuThemeData(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.white),
      primaryColor: primaryColor,
      // buttonColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.black,
      splashFactory: InkRipple.splashFactory,
      // accentColor: secondaryColor,
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: Color(0xff242526),
      buttonTheme: ButtonThemeData(colorScheme: colorScheme, textTheme: ButtonTextTheme.primary),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      // accentTextTheme: _buildTextTheme(base.accentTextTheme),
      platform: TargetPlatform.iOS,
      disabledColor: Color(0xffa1a1a1),
      cardColor: Color(0xff23262F),
      colorScheme: colorScheme.copyWith(background: Color(0xff242526)),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
