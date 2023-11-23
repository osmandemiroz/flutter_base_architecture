import 'package:flutter/material.dart';

///internal usage
///Base dialog class
final class BaseDialog {
  BaseDialog._();

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return showDialog<T>(
      context: context,
      builder: builder,
      barrierDismissible: false,
      useSafeArea: false,
    );
  }
}
