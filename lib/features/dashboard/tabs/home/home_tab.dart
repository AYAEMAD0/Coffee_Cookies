import 'package:coffee_cookies/core/constants/app_asset.dart';
import 'package:coffee_cookies/core/constants/app_strings.dart';
import 'package:coffee_cookies/features/dashboard/tabs/home/widget/built_item.dart';
import 'package:coffee_cookies/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'widget/built_best_item.dart';
import 'widget/category_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController searchController = TextEditingController();
  List<CategoryModel> categoryModel = CategoryModel.categoryList;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 17.h,
          children: [
            Center(
              child: Image.asset(AppAsset.logo, height: 50.h, width: 230.w),
            ),
            CustomTextField(
              textStyle: TextStyles.font16SecondMedium,
              hint: AppStrings.search,
              controller: searchController,
              hintStyle: TextStyles.font16SecondMedium,
              borderColor: AppColors.brownExtraLight,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 13.h,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 10.w),
                child: Icon(Icons.search),
              ),
              fillColor: AppColors.brownMediumLight,
              onChanged: (val) {
                //todo logic search
              },
            ),
            Text(AppStrings.bestOfToday, style: TextStyles.font20SecondBold),
            BuiltBestItem(
                title: "Strong and rich coffee flavor.",
                category: "Espresso ",
                price: "40.000",
                image: AppAsset.coffeeFlavorCoffee,
                qty: 1,
                onAdd: () {},
                onRemove: () {}),
            Text(AppStrings.category, style: TextStyles.font20SecondBold),
            //todo tabs
            DefaultTabController(
              length: categoryModel.length,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                indicatorColor: AppColors.transparent,
                dividerColor: AppColors.transparent,
                onTap: (value) {
                  //todo logic into change index
                  selectedIndex = value;
                  setState(() {

                  });
                },
                tabs: List.generate(
                  categoryModel.length,
                      (index) =>
                      CategoryItem(
                        selected: index == selectedIndex,
                        colorBorderIsSelected: AppColors.second,
                        styleTextSelected: TextStyles.font20WhiteMedium,
                        styleTextNotSelected: TextStyles.font20SecondBold,
                        colorBackgroundIsSelected: AppColors.second,
                        categoryName: categoryModel[index].nameCategory,

                      ),
                ),
              ),
            ),

            //todo filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuiltItem(
                    title: "Milky Way Sweet Cookies",
                    category: "Cookies",
                    image: AppAsset.caramelCrunchCookies,
                    isFav: false),
              ],
            ),


          ],
        ),
      ),
    );
  }
}


