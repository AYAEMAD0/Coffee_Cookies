import 'package:coffee_cookies/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_styles.dart';

class BuiltBestItem extends StatelessWidget {
  const BuiltBestItem({
    super.key,
    required this.title,
    required this.category,
    required this.price,
    required this.image,
    required this.qty,
    required this.onAdd,
    required this.onRemove,
  });

  final String title;
  final String category;
  final String price;
  final String image;
  final int qty;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.h,
      padding: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.brownExtraLight, width: 1.3.w),
      ),
      child: Row(
        children: [
          //todo image
          Container(
            clipBehavior: Clip.antiAlias,
            height: 115.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
            ),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          SizedBox(width: 15.w),
          //todo info
          Expanded(
            child: Column(
              spacing: 5.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 5.h),
                Text(title, style: TextStyles.font14BrownDarkBold),
                Text(category, style: TextStyles.font14BrownDarkRegular),
                Text(price, style: TextStyles.font18BrownDarkBold),
              ],
            ),
          ),
          //todo btn
          Row(
            spacing: 10.w,
            children: [
              InkWell(
                onTap: onRemove,
                child: CircleAvatar(
                  backgroundColor: AppColors.grey,
                  radius: 15.r,
                  child: const Icon(
                    Icons.remove,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
              ),
              Text("$qty", style: TextStyles.font20SecondBold),
              InkWell(
                onTap: onAdd,
                child: CircleAvatar(
                  backgroundColor: AppColors.second,
                  radius: 15.r,
                  child: const Icon(
                    Icons.add,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
