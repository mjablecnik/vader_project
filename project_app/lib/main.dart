import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:project_app/dialog_question.dart';
import 'package:project_app/l10n/app_localizations.dart';
import 'package:project_app/localization.dart';
import 'package:project_design/project_design.dart';
import 'package:project_design/theme/dark_theme.dart';
import 'package:project_design/theme/light_theme.dart';

void main() {
  runApp(LocaleProvider(initialLocale: Locale('en'), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: LocaleProvider.of(context).notifier!,
      builder: (context, locale, _) {
        return FutureBuilder(
          future: AppLocalizations.delegate.load(locale),
          builder: (context, t) {
            return MaterialApp(
              title: t.data!.appTitle,
              home: MyHomePage(title: t.data!.homePageTitle),
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              locale: locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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

  void _incrementCounter() {
    setState(() => _counter++);
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
      final exitApp = await showDialogQuestion(
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [TextButton(onPressed: () => changeLocalization(), child: Text(t.localeName.toUpperCase()))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(t.pushButtonInfoText),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 300),
            PrimaryButton(text: t.incrementButtonText, size: ButtonSize.medium, onTap: _incrementCounter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: t.incrementButtonText,
        child: const Icon(Icons.add),
      ),
    );
  }
}
