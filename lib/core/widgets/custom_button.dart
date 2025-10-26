import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.text,
    required this.styleText,
    this.paddingHeight,
    this.borderColor,
  });

  final void Function() onPressed;
  final Color backgroundColor;
  final Color? borderColor;
  final String text;
  final TextStyle styleText;
  final double? paddingHeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: paddingHeight ?? 16.h),
        side: BorderSide(
          color: borderColor ?? AppColors.transparent,
          width: 1.2.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
      child: Text(text, style: styleText),
    );
  }
}
