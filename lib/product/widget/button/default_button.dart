import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/product/utility/constants/enums/radius.dart';

///Default button
@immutable
final class DefaultButton extends StatelessWidget {
  ///required things to use this widget
  const DefaultButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  ///Title for this widget
  final String title;

  ///button on pressed callback
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: ProjectRadius.medium.value,
      onTap: onPressed,
      child: Text(title),
    );
  }
}
