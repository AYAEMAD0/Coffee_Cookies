import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.selected,
    required this.categoryName,
    required this.colorBorderIsSelected,
    required this.styleTextSelected,
    required this.styleTextNotSelected,
    required this.colorBackgroundIsSelected,
  });

  final bool selected;
  final Color colorBorderIsSelected;
  final Color colorBackgroundIsSelected;
  final TextStyle styleTextSelected;
  final TextStyle styleTextNotSelected;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: selected ? colorBackgroundIsSelected : AppColors.transparent,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: colorBorderIsSelected, width: 1.26.w),
      ),
      child: Row(
        spacing: 3.w,
        children: [
          Text(
            categoryName,
            style: selected ? styleTextSelected : styleTextNotSelected,
          ),
        ],
      ),
    );
  }
}
