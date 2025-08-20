import 'package:flutter/material.dart';
import 'package:project_app/l10n/app_localizations.dart';
import 'package:project_app/language_dialog.dart';
import 'package:project_app/locale_provider.dart';
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

  void _incrementCounter() {
    setState(() => _counter++);
  }

  Future changeLocalization() async {
    final localeProvider = LocaleProvider.of(context);
    final result = await showLanguageDialog(context);
    if (result?.value != null) localeProvider.setLocale(Locale(result!.value));
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
