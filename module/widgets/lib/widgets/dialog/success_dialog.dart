import 'package:flutter/material.dart';
import 'package:widgets/core/base_dialog.dart';

///show a success dialog
final class SuccessDialog extends StatelessWidget {
  ///constructor
  const SuccessDialog({required this.title, super.key});

  ///title for a dialog
  final String title;

  ///show the dialog for the success this will always return true
  static Future<bool> show({
    required String title,
    required BuildContext context,
  }) async {
    await BaseDialog.show<bool>(
      context: context,
      builder: (context) => SuccessDialog(title: title),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          icon: const Icon(Icons.check),
        ),
      ],
    );
  }
}
