import 'package:flutter/material.dart';
import 'package:project_app/l10n/app_localizations.dart';

Future<bool?> showDialogQuestion(BuildContext context, {required String title, required String content}) {
  final t = AppLocalizations.of(context)!;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(t.dialogNoButton)),
          ElevatedButton(onPressed: () => Navigator.of(context).pop(true), child: Text(t.dialogYesButton)),
        ],
      );
    },
  );
}
