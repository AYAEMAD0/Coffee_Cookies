import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import 'category_item.dart';

class BuiltCategoriesSection extends StatelessWidget {
  const BuiltCategoriesSection({
    super.key,
    required this.onTap,
    required this.categoryModel,
    required this.selectedIndex,
  });

  final void Function(int) onTap;
  final List<String> categoryModel;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 17.h,
      children: [
        Text(AppStrings.category, style: TextStyles.font20SecondBold),
        //todo tabs
        DefaultTabController(
          length: categoryModel.length,
          child: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
            indicatorColor: AppColors.transparent,
            dividerColor: AppColors.transparent,
            onTap: onTap,
            tabs: List.generate(
              categoryModel.length,
              (index) => CategoryItem(
                selected: index == selectedIndex,
                colorBorderIsSelected: AppColors.second,
                styleTextSelected: TextStyles.font20WhiteMedium,
                styleTextNotSelected: TextStyles.font20SecondBold,
                colorBackgroundIsSelected: AppColors.second,
                categoryName: categoryModel[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
