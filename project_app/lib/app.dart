import 'dart:io';

import 'package:catcher_2/catcher_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_app/config.dart';
import 'package:project_app/features/core/core_module.dart';
import 'package:project_app/features/core/pages/initial_page.dart';
import 'package:project_app/features/home/home_module.dart';
import 'package:project_app/l10n/app_localizations.dart';
import 'package:project_design/project_design.dart';
import 'package:sentry/sentry.dart';
import 'package:vader_app/vader_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appSetup();
  runApp(const MyApp());
}

Future<void> runApp(Widget widget) async {
  final consoleHandler = ConsoleHandler();
  final sentryHandler = SentryHandler(SentryClient(SentryOptions(dsn: AppConfig().sentryDsn)));

  Catcher2(
    debugConfig: Catcher2Options(SilentReportMode(), [consoleHandler, sentryHandler]),
    profileConfig: Catcher2Options(DialogReportMode(), [consoleHandler, sentryHandler]),
    releaseConfig: Catcher2Options(DialogReportMode(), [sentryHandler]),
    navigatorKey: navigatorKey,
    enableLogger: true,
    rootWidget: widget,
  );
}

void appSetup() {
  AppIcons.setup();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VaderApp(
      modules: [CoreModule(), HomeModule()],
      theme: ProjectTheme(mode: ThemeMode.light),
      isDebug: false,
      preventTextScaling: false,
      entrypoint: InitialRoute().location,
      localization: Localization(
        initialLocale: WidgetsBinding.instance.platformDispatcher.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        delegates: AppLocalizations.localizationsDelegates,
      ),
    );
  }
}
