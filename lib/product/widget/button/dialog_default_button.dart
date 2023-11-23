import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/product/widget/button/default_button.dart';
import 'package:widgets/index.dart';

class DialogDefaultButton extends StatelessWidget {
  const DialogDefaultButton({required this.onChanged, super.key});

  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      title: 'Dialog Default Button',
      onPressed: () async {
        final response =
            await SuccessDialog.show(title: 'title', context: context);
        onChanged.call(response);
      },
    );
  }
}
