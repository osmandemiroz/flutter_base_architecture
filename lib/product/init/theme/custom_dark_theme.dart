import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/product/init/theme/ICustom_theme.dart';
import 'package:flutter_architecture_template/product/init/theme/custom_color_schemes.dart';
import 'package:google_fonts/google_fonts.dart';

///Custom dark theme
final class CustomDarkTheme implements ICustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorSchemes.darkColorScheme,
        floatingActionButtonTheme: floatingActionThemeData,
        fontFamily: GoogleFonts.roboto().fontFamily,
      );

  @override
  final FloatingActionButtonThemeData floatingActionThemeData =
      const FloatingActionButtonThemeData();
}
