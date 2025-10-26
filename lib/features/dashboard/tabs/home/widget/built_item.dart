import 'package:coffee_cookies/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_styles.dart';

class BuiltItem extends StatelessWidget {
  const BuiltItem({
    super.key,
    required this.title,
    required this.category,
    required this.image,
    required this.isFav,
  });

  final String title;
  final String category;
  final String image;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      padding: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.brownExtraLight, width: 1.3.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
            child: Image.asset(
              image,
              height: 180.h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyles.font16BrownDarkBold),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(category, style: TextStyles.font14BrownDarkMedium),
                    InkWell(
                      onTap: () {
                        //todo change fav
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.second,
                        radius: 15.r,
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_outline,
                          size: 18,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
