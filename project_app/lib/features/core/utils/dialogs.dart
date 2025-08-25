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

  static Future<DialogListItem?> chooseTheme(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Dialogs.showList(
      context,
      title: t.chooseThemeTitle,
      items: [
        DialogListItem(text: "Light", value: ThemeMode.light),
        DialogListItem(text: "Dark", value: ThemeMode.dark),
      ],
    );
  }

  static Future<DialogListItem?> chooseLanguage(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final Map languages = {"cs": "Čeština", "en": "English"};

    return Dialogs.showList(
      context,
      title: t.chooseLanguageTitle,
      items: AppLocalizations.supportedLocales
          .map((e) => DialogListItem(text: languages[e.languageCode], value: e.toLanguageTag()))
          .toList(),
    );
  }

  static Future<bool?> quitAppQuestion(BuildContext context) async {
    final t = AppLocalizations.of(context)!;
    return Dialogs.showQuestion(
      context,
      title: t.dialogQuitQuestionTitle,
      content: t.dialogQuitQuestionContent,
    );
  }
}