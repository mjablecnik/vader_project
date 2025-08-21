import 'package:project_design/project_design.dart';
import 'package:vader_app/vader_app.dart';
import 'package:flutter/material.dart';

part 'home_page.g.dart';

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(title: "Home", child: Center(child: Text("This is Home page.")));
  }
}
