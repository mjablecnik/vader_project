// GENERATED CODE - DO NOT MODIFY BY HAND

part of '{{name.snakeCase()}}_page.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [${{name.camelCase()}}Route];

RouteBase get ${{name.camelCase()}}Route => GoRouteData.$route(
  path: '/{{name.pathCase()}}',

  factory: ${{name.pascalCase()}}RouteExtension._fromState,
);

extension ${{name.pascalCase()}}RouteExtension on {{name.pascalCase()}}Route {
  static {{name.pascalCase()}}Route _fromState(GoRouterState state) => const {{name.pascalCase()}}Route();

  String get location => GoRouteData.$location('/{{name.pathCase()}}');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
