import 'package:coffee_cookies/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../theme/app_styles.dart';

class CustomSnackbar {
  static SnackBar show(String message) {
    return SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyles.font20SecondBold,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.primary,
      margin: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    );
  }
}
