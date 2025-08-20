import '../../../project_design_exports.dart';
import 'package:flutter/material.dart';


class EventCardTheme {
  static final light = EventCardStyle(
    decoration: BoxDecoration(
      color: AppColors.blue200,
      border: Border.symmetric(
        horizontal: BorderSide(
          color: AppColors.grey400.withAlpha(25),
        ),
      ),
    ),
  );

  static final dark = EventCardStyle(
    decoration: BoxDecoration(
      color: AppColors.blue200,
      border: Border.symmetric(
        horizontal: BorderSide(
          color: AppColors.grey400.withAlpha(25),
        ),
      ),
    ),
  );
}