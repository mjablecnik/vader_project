import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_app/features/app/app_module.dart';
import 'package:project_app/features/app/pages/initial_page.dart';
import 'package:project_app/features/home/home_module.dart';
import 'package:project_app/l10n/app_localizations.dart';
import 'package:project_design/project_design.dart';
import 'package:vader_app/vader_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appSetup();
  runApp(const MyApp());
}

void appSetup() {
  AppIcons.setup();
  logger.setObserver(CrashLoggerObserver());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

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
      modules: [AppModule(), HomeModule()],
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

class CrashLoggerObserver extends LoggerObserver {
  const CrashLoggerObserver();

  @override
  void onError(err) {
    //FirebaseCrashlytics.instance.recordError(err.error, err.stackTrace, reason: err.message);
  }

  @override
  void onException(err) {
    //FirebaseCrashlytics.instance.recordError(err.exception, err.stackTrace, reason: err.message);
  }
}
