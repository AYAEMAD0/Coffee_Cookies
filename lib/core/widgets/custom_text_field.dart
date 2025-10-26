import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextStyle textStyle;
  final String hint;
  final TextStyle hintStyle;
  final String? label;
  final TextStyle? labelStyle;

  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final Color? fillColor;

  final Color borderColor;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;
  final bool? obscure;
  final String? obscureCharacter;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({
    super.key,
    required this.textStyle,
    required this.hint,
    required this.hintStyle,
    required this.controller,
    required this.borderColor,
    this.fillColor,
    this.validator,
    this.maxLines = 1,
    this.keyboard,
    this.label,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.obscure = false,
    this.obscureCharacter,
    this.onChanged,
    this.contentPadding
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      autofocus: false,
      obscureText: obscure!,
      obscuringCharacter: obscureCharacter ?? "*",
      maxLines: maxLines,
      cursorColor: AppColors.second,
      cursorHeight: 22.h,
      cursorWidth: 3.w,
      keyboardType: keyboard ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle,
        labelText: label,
        labelStyle: labelStyle,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        enabledBorder: builtBorder(borderColor),
        focusedBorder: builtBorder(borderColor),
        errorBorder: builtBorder(),
        focusedErrorBorder: builtBorder(),
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor ?? AppColors.second,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor ?? AppColors.second,
        filled: true,
        fillColor: fillColor ?? AppColors.transparent,
      ),
    );
  }

  OutlineInputBorder builtBorder([Color colorBorder = AppColors.red]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.r),
      borderSide: BorderSide(color: colorBorder, width: 1.3.w),
    );
  }
}
