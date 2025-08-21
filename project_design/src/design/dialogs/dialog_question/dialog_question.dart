import 'package:flutter/material.dart';
import 'dialog_question.style.dart';

class DialogQuestion extends StatelessWidget {
  const DialogQuestion({
    super.key,
    required this.title,
    required this.content,
    this.submitButtonText = "Yes",
    this.cancelButtonText = "No",
    this.onCancel,
    this.onSubmit,
    this.style,
  });

  final String title;
  final String content;
  final String submitButtonText;
  final String cancelButtonText;
  final GestureTapCallback? onCancel;
  final GestureTapCallback? onSubmit;
  final DialogQuestionStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          onPressed: () {
            onCancel?.call();
            Navigator.of(context).pop(false);
          },
          child: Text(cancelButtonText),
        ),
        ElevatedButton(
          onPressed: () {
            onSubmit?.call();
            Navigator.of(context).pop(true);
          },
          child: Text(submitButtonText),
        ),
      ],
    );
  }
}
