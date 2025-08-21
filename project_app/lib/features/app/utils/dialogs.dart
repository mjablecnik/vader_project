import 'package:flutter/material.dart';
import 'package:project_app/l10n/app_localizations.dart';
import 'package:project_design/design/dialogs/dialog_question/dialog_question.dart';
import 'package:project_design/design/dialogs/dialog_list/dialog_list.dart';

class Dialogs {
  static Future<DialogListItem?> showList(BuildContext context, {
    required String title,
    required List<DialogListItem> items,
  }) async {
    final t = AppLocalizations.of(context)!;
    return showDialog<DialogListItem>(
      context: context,
      builder: (BuildContext context) {
        return DialogList(title: title, items: items, cancelButtonText: t.dialogCancelButton);
      },
    );
  }

  static Future<bool?> showQuestion(BuildContext context, {required String title, required String content}) {
    final t = AppLocalizations.of(context)!;
    return showDialog(
      context: context,
      builder: (context) {
        return DialogQuestion(
          title: title,
          content: content,
          cancelButtonText: t.dialogNoButton,
          submitButtonText: t.dialogYesButton,
        );
      },
    );
  }
}