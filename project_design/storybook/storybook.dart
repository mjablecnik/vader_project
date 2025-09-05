import 'package:project_design/project_design.dart';
import 'package:flutter/material.dart';
import 'package:storybook_toolkit/storybook_toolkit.dart';

import 'all_stories.dart';
import 'assets/icons.dart';

Storybook storybook([List<Story>? stories]) {
  return Storybook(
    wrapperBuilder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ProjectTheme().light,
        darkTheme: ProjectTheme().dark,
        builder: defaultMediaQueryBuilder,
        home: Scaffold(
          body: Center(
            child: child,
          ),
        ),
      );
    },
    plugins: StorybookPlugins(
      initialDeviceFrameData: DeviceFrameData(
        visibility: DeviceFrameVisibility.none,
        device: Devices.ios.iPhone12ProMax,
        orientation: Orientation.portrait,
      ),
      enableCodeView: false,
      enableDirectionality: false,
      enableTimeDilation: false,
      enableTextSizer: true,
    ),
    initialStory: stories?.first.name,
    stories: [...assetIcons, ...stories ?? allStories],
  );
}

void main() => runApp(storybook());
