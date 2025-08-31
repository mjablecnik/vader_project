import 'package:flutter/material.dart';
import 'package:project_app/features/app/pages/home_page.dart';
import 'package:vader_app/vader_app.dart';

part 'initial_page.g.dart';

@TypedGoRoute<InitialPageRoute>(path: '/initial')
class InitialPageRoute extends GoRouteData with $InitialPageRoute {
  const InitialPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: InitPage());
  }
}

class InitPage extends StatelessWidget {
  const InitPage({super.key});

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
        HomePageRoute().go(context);
      },
    );
  }
}
