import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_asset.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class BuiltLogoAndSearchSection extends StatelessWidget {
  const BuiltLogoAndSearchSection({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 17.h,
      children: [
        //todo logo
        Center(
          child: Image.asset(AppAsset.logo, height: 50.h, width: 230.w),
        ),

        //todo search
        CustomTextField(
          textStyle: TextStyles.font16SecondMedium,
          hint: AppStrings.search,
          controller: controller,
          hintStyle: TextStyles.font16SecondMedium,
          borderColor: AppColors.brownExtraLight,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 13.h,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 10.w),
            child: const Icon(Icons.search),
          ),
          fillColor: AppColors.brownMediumLight,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
