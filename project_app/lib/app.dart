import 'package:project_app/features/app/app_module.dart';
import 'package:project_app/features/app/pages/initial_page.dart';
import 'package:project_app/l10n/app_localizations.dart';
import 'package:project_app/localization.dart';
import 'package:project_design/project_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:vader_app/vader_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  logger.setObserver(CrashLoggerObserver());

  AppIcons.setup();

  runApp(LocaleProvider(initialLocale: Locale('en'), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return VaderApp(
      modules: [AppModule()],
      theme: ProjectTheme(),
      isDebug: false,
      entrypoint: InitialRoute().location,
      localization: Localization(
        locale: LocaleProvider.of(context).locale,
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
