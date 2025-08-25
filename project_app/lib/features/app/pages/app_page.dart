import 'package:flutter/material.dart' hide NavigationBar;
import 'package:project_app/features/app/pages/home_page.dart';
import 'package:project_app/features/app/pages/pet_list_page.dart';
import 'package:project_app/features/app/pages/settings_page.dart';
import 'package:project_design/design/components/navigation_bar/navigation_bar.dart';
import 'package:project_design/design/elements/navigation_bar_item/navigation_bar_item.dart';
import 'package:vader_app/vader_app.dart';

part 'app_page.g.dart';

@TypedShellRoute<AppRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(path: '/home'),
    TypedGoRoute<PetListRoute>(path: '/pets'),
    TypedGoRoute<SettingsRoute>(path: '/settings'),
  ],
)
class AppRoute extends ShellRouteData {
  const AppRoute();

  @override
  Page<void> pageBuilder(BuildContext context, GoRouterState state, Widget navigator) {
    return NoTransitionPage(child: AppPage(child: navigator));
  }
}

class AppPage extends StatefulWidget {
  const AppPage({super.key, required this.child});

  final Widget child;

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int index = 0;

  final List<({IconData icon, String name, GoRouteData route})> _navigationItems = [
    (icon: Icons.layers, name: 'Home', route: HomeRoute()),
    (icon: Icons.percent, name: 'Pets', route: PetListRoute()),
    (icon: Icons.settings, name: 'Settings', route: SettingsRoute()),
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
