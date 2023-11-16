import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/product/init/theme/ICustom_theme.dart';
import 'package:flutter_architecture_template/product/init/theme/custom_color_schemes.dart';

///Custom light theme
final class CustomLightTheme implements ICustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorSchemes.lightColorScheme,
        floatingActionButtonTheme: floatingActionThemeData,
      );

  @override
  FloatingActionButtonThemeData get floatingActionThemeData =>
      const FloatingActionButtonThemeData();
}
