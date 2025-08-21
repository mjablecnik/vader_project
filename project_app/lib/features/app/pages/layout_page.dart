import 'package:flutter/material.dart';
import 'package:project_app/features/app/utils/dialogs.dart';
import 'package:project_app/l10n/app_localizations.dart';
import 'package:project_design/project_design.dart';
import 'package:project_design/design/layouts/page_layout/page_layout.dart';
import 'package:vader_app/vader_app.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {

  Future changeLocalization() async {
    final localeProvider = LocaleProvider.of(context);
    final result = await Dialogs.chooseLanguage(context);
    if (result?.value != null) localeProvider.setLocale(Locale(result!.value));
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return BackButtonHandler(
      quitDialog: Dialogs.quitAppQuestion,
      child: PageLayout(
        title: widget.title,
        actions: [TextButton(onPressed: () => changeLocalization(), child: Text(t.localeName.toUpperCase()))],
        child: widget.child,
      ),
    );
  }
}