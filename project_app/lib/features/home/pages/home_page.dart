import 'package:flutter/material.dart';
import 'package:project_app/features/app/pages/layout_page.dart';
import 'package:project_app/l10n/app_localizations.dart';
import 'package:project_design/project_design.dart';
import 'package:vader_app/vader_app.dart';
import 'package:vader_core/clients/logger.dart' as Sentry;

part 'home_page.g.dart';

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  void generateError() async {
    throw Exception("Test exception");
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return LayoutPage(
      title: t.homePageTitle,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(t.pushButtonInfoText),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 200),
            PrimaryButton(text: t.incrementButtonText, size: ButtonSize.medium, onTap: _incrementCounter),
            SizedBox(height: 8),
            PrimaryButton(text: "Generate error", size: ButtonSize.medium, onTap: generateError),
          ],
        ),
      ),
    );
  }
}
