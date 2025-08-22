import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class NavigationBarStyle {
  const NavigationBarStyle({
    required this.color,
  });

  @override
  final Color color;
}
