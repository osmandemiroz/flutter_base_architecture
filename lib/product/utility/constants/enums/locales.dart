import 'package:flutter/material.dart';

/// The `enum Locales` is defining an enumeration in Dart called `Locales`. An enumeration is a special
/// kind of class that represents a group of related constants. In this case, the `Locales` enumeration
/// represents the supported locales for a project.
enum Locales {
  /// Turkish locale
  tr(Locale('tr', 'TR')),

  /// English locale
  en(Locale('en', 'US'));

  /// Locale value
  final Locale locale;

  const Locales(this.locale);
}
