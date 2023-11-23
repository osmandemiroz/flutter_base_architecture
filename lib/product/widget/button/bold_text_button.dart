import 'package:flutter/material.dart';

///BoldTextButton elevated 20
final class BoldTextButton extends TextButton {
  BoldTextButton({
    required super.onPressed,
    required super.child,
    super.key,
  }) : super(
          style: TextButton.styleFrom(
            elevation: 25,
          ),
        );
}
