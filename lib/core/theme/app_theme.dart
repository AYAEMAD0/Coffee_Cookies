import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      iconTheme: IconThemeData(color: AppColors.primary),
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
    ),
  );
}
