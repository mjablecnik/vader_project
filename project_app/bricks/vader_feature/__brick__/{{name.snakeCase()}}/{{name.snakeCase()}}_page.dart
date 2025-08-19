import 'package:{{package.snakeCase()}}_design/{{package.snakeCase()}}_design.dart';
import 'package:vader_app/vader_app.dart';
import 'package:flutter/material.dart';

part '{{name.snakeCase()}}_page.g.dart';

@TypedGoRoute<{{name.pascalCase()}}Route>(path: '/{{name.pathCase()}}')
class {{name.pascalCase()}}Route extends GoRouteData {
  const {{name.pascalCase()}}Route();

  @override
  Widget build(BuildContext context, GoRouterState state) => const {{name.pascalCase()}}Page();
}

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(title: "{{name.pascalCase()}}", child: Center(child: Text("This is {{name.pascalCase()}} page.")));
  }
}
