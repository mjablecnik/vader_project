import 'package:flutter/material.dart';
import 'package:project_design/design/layouts/page_layout/page_layout.dart';
import 'package:vader_app/vader_app.dart';

part 'error_page.g.dart';

@TypedGoRoute<ErrorRoute>(path: '/app/error')
class ErrorRoute extends GoRouteData with _$ErrorRoute {
  const ErrorRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: ErrorPage());
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Error page",
      child: Center(
        child: Text("This is Error page"),
      ),
    );
  }
}
