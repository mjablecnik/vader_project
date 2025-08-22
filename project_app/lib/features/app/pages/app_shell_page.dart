import 'package:flutter/material.dart' hide NavigationBar;
import 'package:project_app/features/app/pages/error_page.dart';
import 'package:project_app/features/home/pages/home_page.dart';
import 'package:project_design/design/components/navigation_bar/navigation_bar.dart';
import 'package:vader_app/vader_app.dart';

part 'app_shell_page.g.dart';

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
    return NoTransitionPage(child: AppShellPage(child: navigator));
  }
}

class AppShellPage extends StatefulWidget {
  const AppShellPage({super.key, required this.child});

  final Widget child;

  @override
  State<AppShellPage> createState() => _AppShellPageState();
}

class _AppShellPageState extends State<AppShellPage> {
  int index = 0;

  final List<({IconData icon, String name, GoRouteData route})> _navigationItems = [
    (icon: Icons.layers, name: 'Home', route: HomeRoute()),
    (icon: Icons.percent, name: 'Offers', route: ErrorRoute()),
    (icon: Icons.person, name: 'Profile', route: ErrorRoute()),
  ];

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
              for (int i = 0; i < _navigationItems.length; i++)
                NavigationBarItem(
                  icon: _navigationItems[i].icon,
                  index: i,
                  isActive: index == i,
                  onTap: (int index) {
                    setState(() => this.index = index);
                    _navigationItems[index].route.go(context);
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
