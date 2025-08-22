import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class NavigationLayoutStyle {
  const NavigationLayoutStyle({
    required this.color,
  });

  @override
  final Color color;
}
