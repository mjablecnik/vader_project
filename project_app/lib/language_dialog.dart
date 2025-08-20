import 'package:flutter/material.dart';
import 'package:project_app/l10n/app_localizations.dart';

final Map languages = {"cs": "Čeština", "en": "English"};

class DialogListItem {
  final String text;
  final String value;

  DialogListItem({required this.text, required this.value});
}

Future<DialogListItem?> showDialogList(
  BuildContext context, {
  required String title,
  required List<DialogListItem> items,
}) async {
  return showDialog<DialogListItem>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: 300,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];
              return ListTile(
                title: Text(item.text),
                onTap: () {
                  Navigator.of(context).pop(item);
                },
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<DialogListItem?> showLanguageDialog(BuildContext context) {
  final t = AppLocalizations.of(context)!;

  return showDialogList(
    context,
    title: t.chooseLanguageTitle,
    items: AppLocalizations.supportedLocales
        .map((e) => DialogListItem(text: languages[e.languageCode], value: e.toLanguageTag()))
        .toList(),
  );
}
