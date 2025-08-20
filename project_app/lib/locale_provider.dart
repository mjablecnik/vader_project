import 'package:flutter/material.dart';

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