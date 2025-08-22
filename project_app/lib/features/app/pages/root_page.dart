import 'package:flutter/material.dart' hide NavigationBar;
import 'package:project_app/features/app/pages/error_page.dart';
import 'package:project_app/features/home/pages/home_page.dart';
import 'package:project_design/design/components/navigation_bar/navigation_bar.dart';
import 'package:vader_app/vader_app.dart';

part 'root_page.g.dart';

@TypedShellRoute<AppShellRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(path: '/home'),
    TypedGoRoute<ErrorRoute>(path: '/error'),
  ],
)
class AppShellRoute extends ShellRouteData {
  const AppShellRoute();

  @override
  Page<void> pageBuilder(BuildContext context, GoRouterState state, Widget navigator) {
    return NoTransitionPage(child: RootPage(child: navigator));
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key, required this.child});

  final Widget child;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int index = 0;

  onTap(int index) {
    setState(() => this.index = index);
    if (index == 0) {
      HomeRoute().go(context);
    } else if (index == 1) {
      ErrorRoute().go(context);
    } else if (index == 2) {
      ErrorRoute().go(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          widget.child,
          NavigationBar(
            currentIndex: index,
            items: [
              NavigationBarItem(icon: Icons.layers, index: 0, isActive: index == 0, onTap: onTap),
              NavigationBarItem(icon: Icons.percent, index: 1, isActive: index == 1, onTap: onTap),
              NavigationBarItem(icon: Icons.person, index: 2, isActive: index == 2, onTap: onTap),
            ],
          ),
        ],
      ),
    );
  }
}
