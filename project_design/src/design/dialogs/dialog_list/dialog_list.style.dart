import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class DialogListStyle {
  const DialogListStyle({
    required this.backgroundColor,
  });

  @override
  final Color backgroundColor;
}
