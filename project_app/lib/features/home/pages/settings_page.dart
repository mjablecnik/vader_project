import 'package:flutter/material.dart';
import 'package:project_app/features/app/pages/layout_page.dart';
import 'package:vader_app/vader_app.dart';

part 'settings_page.g.dart';

@TypedGoRoute<SettingsRoute>(path: '/settings')
class SettingsRoute extends GoRouteData with _$SettingsRoute {
  const SettingsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SettingsPage());
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appInfo = SettingsProvider.of(context).appInfo;
    return LayoutPage(
      title: "Settings page",
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("App name:"), Text(appInfo.name)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("App version:"), Text(appInfo.version)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Build number:"), Text(appInfo.buildNumber)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("DeviceId:"), Text(appInfo.deviceId)],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
