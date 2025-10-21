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
}
