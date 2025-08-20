import 'package:flutter/material.dart';
import 'package:project_app/dialog_list.dart';
import 'package:project_app/l10n/app_localizations.dart';

final Map languages = {"cs": "Čeština", "en": "English"};

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

class LocaleProvider extends InheritedNotifier<ValueNotifier<Locale>> {
  LocaleProvider({
    super.key,
    required Locale initialLocale,
    required super.child,
  }) : super(
    notifier: ValueNotifier(initialLocale),
  );

  static LocaleProvider of(BuildContext context) {
    final LocaleProvider? result =
    context.dependOnInheritedWidgetOfExactType<LocaleProvider>();
    assert(result != null, 'No LocaleProvider found in context');
    return result!;
  }

  Locale get locale => notifier!.value;

  void setLocale(Locale newLocale) {
    notifier!.value = newLocale;
  }
}