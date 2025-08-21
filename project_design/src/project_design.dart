import 'package:project_design/theme/dark_theme.dart';
import 'package:project_design/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:vader_design/vader_design.dart';

class ProjectTheme extends VaderTheme {
  const ProjectTheme({super.mode = ThemeMode.system});

  @override
  Map<String, ThemeData> get themes => {'light': lightTheme, 'dark': darkTheme};
}
