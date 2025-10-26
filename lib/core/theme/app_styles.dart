import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font27BrownDarkRegular = GoogleFonts.inter(
    fontSize: 27.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.brownDark,
  );
  static TextStyle font16SecondMedium = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.second,
  );
  static TextStyle font16BrownDarkBoldItalicUnderline = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.brownDark,
    fontStyle: FontStyle.italic,
    decorationColor: AppColors.brownDark,
    decoration: TextDecoration.underline,
  );
  static TextStyle font20WhiteMedium = GoogleFonts.inter(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.white,
  );
  static TextStyle font18SecondMedium = GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.second,
  );
  static TextStyle font22BrownDarkSemiBold = GoogleFonts.inter(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.brownDark,
  );
  static TextStyle font20SecondBold = GoogleFonts.inter(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.second,
  );
  static TextStyle font16BrownDarkBold = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.brownDark,
  );
  static TextStyle font14BrownDarkRegular = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.brownDark,
  );
  static TextStyle font18BrownDarkBold = GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.brownDark,
  );
  static TextStyle font14BrownDarkMedium = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.brownDark,
  );
}
