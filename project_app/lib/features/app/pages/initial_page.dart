import 'package:flutter/material.dart';
import 'package:project_app/features/app/pages/app_shell_page.dart';
import 'package:project_app/features/home/pages/home_page.dart';
import 'package:vader_app/vader_app.dart';

part 'initial_page.g.dart';

@TypedGoRoute<InitialRoute>(path: '/initial')
class InitialRoute extends GoRouteData with _$InitialRoute {
  const InitialRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: InitialPage());
  }
}

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      logo: FlutterLogo(size: 80),
      duration: Duration(seconds: 3),
      loadingIndicator: Container(
        width: 84,
        height: 84,
        padding: EdgeInsets.all(32),
        child: CircularProgressIndicator(strokeWidth: 2.0),
      ),
      onFinish: () {
        HomeRoute().go(context);
      },
    );
  }
}
