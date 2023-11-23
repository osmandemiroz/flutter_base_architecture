import 'package:flutter/material.dart';
import 'package:widgets/core/base_dialog.dart';

///User Question Answer
final class QuestionAnswer {
  ///constructor
  QuestionAnswer({required this.response});

  ///response from the user
  final String response;
}

///show a success dialog
final class QuestionDialog extends StatefulWidget {
  ///constructor
  const QuestionDialog({required this.title, super.key});

  ///title for a dialog
  final String title;

  ///show the dialog for the success this will always return true
  static Future<QuestionAnswer?> show({
    required String title,
    required BuildContext context,
  }) {
    return BaseDialog.show<QuestionAnswer>(
      context: context,
      builder: (context) => QuestionDialog(title: title),
    );
  }

  @override
  State<QuestionDialog> createState() => _QuestionDialogState();
}

class _QuestionDialogState extends State<QuestionDialog> {
  String _response = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      content: TextField(
        onChanged: (value) {
          _response = value;
        },
      ),
      title: Text(widget.title),
      actions: [
        IconButton(
          onPressed: () {
            if (_response.isNotEmpty) {
              Navigator.of(context).pop(QuestionAnswer(response: _response));
            } else {
              Navigator.of(context).pop(null);
            }
          },
          icon: const Icon(Icons.check),
        ),
      ],
    );
  }
}
