import 'package:flutter/material.dart' hide NavigationBar;
import 'package:project_app/features/app/pages/home_page.dart';
import 'package:project_app/features/app/pages/pet_list_page.dart';
import 'package:project_app/features/app/pages/settings_page.dart';
import 'package:project_design/design/components/navigation_bar/navigation_bar.dart';
import 'package:project_design/design/elements/navigation_bar_item/navigation_bar_item.dart';
import 'package:vader_app/vader_app.dart';

part 'app_page.g.dart';

@TypedShellRoute<AppPageRoute>(
  routes: [
    TypedGoRoute<HomePageRoute>(path: '/home'),
    TypedGoRoute<PetListPageRoute>(path: '/pets'),
    TypedGoRoute<SettingsPageRoute>(path: '/settings'),
  ],
)
class AppPageRoute extends ShellRouteData {
  const AppPageRoute();

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
    (icon: Icons.layers, name: 'Home', route: HomePageRoute()),
    (icon: Icons.percent, name: 'Pets', route: PetListPageRoute()),
    (icon: Icons.settings, name: 'Settings', route: SettingsPageRoute()),
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
