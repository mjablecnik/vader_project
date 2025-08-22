import 'package:flutter/material.dart';
import 'package:project_app/features/app/utils/dialogs.dart';
import 'package:project_app/l10n/app_localizations.dart';
import 'package:project_design/project_design.dart';
import 'package:vader_app/vader_app.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  Future changeLocalization(BuildContext context) async {
    final localeProvider = SettingsProvider.of(context);
    final result = await Dialogs.chooseLanguage(context);
    if (result?.value != null) localeProvider.setLocale(Locale(result!.value));
  }

  Future changeTheme(BuildContext context) async {
    final themeProvider = SettingsProvider.of(context);
    final result = await Dialogs.chooseTheme(context);
    if (result?.value != null) themeProvider.setTheme(result!.value);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return BackButtonHandler(
      quitDialog: Dialogs.quitAppQuestion,
      child: PageLayout(
        title: title,
        actions: [
          TextButton(onPressed: () => changeLocalization(context), child: Text(t.localeName.toUpperCase())),
          TextButton(onPressed: () => changeTheme(context), child: Text(SettingsProvider.of(context).currentTheme.name)),
        ],
        navigationIndex: 0,
        child: child,
      ),
    );
  }
}
