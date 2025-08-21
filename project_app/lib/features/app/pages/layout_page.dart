import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:project_app/features/app/utils/dialogs.dart';
import 'package:project_app/l10n/app_localizations.dart';
import 'package:project_app/localization.dart';
import 'package:project_design/project_design.dart';
import 'package:project_design/design/layouts/page_layout/page_layout.dart';


class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(interceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(interceptor);
    super.dispose();
  }

  Future changeLocalization() async {
    final localeProvider = LocaleProvider.of(context);
    final result = await showLanguageDialog(context);
    if (result?.value != null) localeProvider.setLocale(Locale(result!.value));
  }

  Future<bool> interceptor(bool stopDefaultButtonEvent, RouteInfo info) async {
    final t = AppLocalizations.of(context)!;
    final navigator = Navigator.of(context);

    if (navigator.canPop()) {
      navigator.pop();
      return true;
    } else {
      final exitApp = await Dialogs.showQuestion(
        context,
        title: t.dialogQuitQuestionTitle,
        content: t.dialogQuitQuestionContent,
      );
      return exitApp != true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return PageLayout(
      title: widget.title,
      actions: [TextButton(onPressed: () => changeLocalization(), child: Text(t.localeName.toUpperCase()))],
      child: widget.child,
    );
  }
}
