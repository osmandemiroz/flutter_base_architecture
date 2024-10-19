// ignore_for_file: file_names

import 'package:flutter/material.dart';

///Theme data manager dark and
abstract class ICustomTheme {
  ///base requirement to the theme data
  ThemeData get themeData;

  ///base requirement to the floating action button theme
  FloatingActionButtonThemeData get floatingActionThemeData;
}
