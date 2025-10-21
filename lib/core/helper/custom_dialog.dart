import 'package:coffee_cookies/core/constants/app_strings.dart';
import 'package:coffee_cookies/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_styles.dart';

class CustomDialog {
  static void showLoading({required BuildContext context}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.primary,
          title: Row(
            spacing: 15.w,
            children: [
              CircularProgressIndicator(color: AppColors.second),
              Text(
                AppStrings.loading,
                style: TextStyles.font22BrownDarkSemiBold,
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    Color? background,
    required TextStyle? styleMessage,
    required String message,
    String? title,
    TextStyle? styleTitle,
    String? posActionName,
    TextStyle? stylePosActionName,
    Function? posActionClick,
    String? nagActionName,
    TextStyle? styleNagActionName,
    Function? nagActionClick,
  }) {
    List<Widget>? actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posActionClick?.call();
          },
          child: Text(posActionName, style: stylePosActionName),
        ),
      );
    }
    if (nagActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            nagActionClick?.call();
          },
          child: Text(nagActionName, style: styleNagActionName),
        ),
      );
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.primary,
          title: Text(title ?? "", style: styleTitle),
          content: Text(message, style: styleMessage),
          actions: actions,
        );
      },
    );
  }
}
