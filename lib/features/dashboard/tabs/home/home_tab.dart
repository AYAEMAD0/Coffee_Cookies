import 'package:coffee_cookies/core/constants/app_strings.dart';
import 'package:coffee_cookies/features/dashboard/tabs/home/widget/built_best_today_section.dart';
import 'package:coffee_cookies/features/dashboard/tabs/home/widget/built_categories_section.dart';
import 'package:coffee_cookies/features/dashboard/tabs/home/widget/built_grid_item_section.dart';
import 'package:coffee_cookies/features/dashboard/tabs/home/widget/built_item.dart';
import 'package:coffee_cookies/features/dashboard/tabs/home/widget/built_logo_and_search_section.dart';
import 'package:coffee_cookies/model/category_data_model.dart';
import 'package:coffee_cookies/provider/category_provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../provider/user_provider/user_provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController searchController = TextEditingController();
  List<String> categoryModel = CategoryDataModel.categoryTabs;
  late CategoryProvider categoryProvider;
  late UserProvider userProvider;
  int qty = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
      userProvider = Provider.of<UserProvider>(context, listen: false);
      if (userProvider.currentUser != null) {
        categoryProvider.getAllItem(userProvider.currentUser!.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    userProvider = Provider.of<UserProvider>(context);

    if (userProvider.currentUser == null) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.second),
      );
    }

    if (categoryProvider.filterList.isEmpty &&
        categoryProvider.bestOfTodayItem == null) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.second),
      );
    }

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 17.h,
            children: [
              //todo logo,search
              BuiltLogoAndSearchSection(
                controller: searchController,
                onChanged: (val) => categoryProvider.searchItems(val),
              ),
              searchController.text.isNotEmpty
                  ? categoryProvider.searchFilterList.isEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 50.h),
                            child: Center(
                              child: Text(
                                AppStrings.notFound,
                                style: TextStyles.font20SecondBold,
                              ),
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 13.w,
                                  mainAxisSpacing: 16.h,
                                  childAspectRatio: 0.64,
                                ),
                            itemCount: categoryProvider.searchFilterList.length,
                            itemBuilder: (context, index) {
                              return BuiltItem(
                                model: categoryProvider.searchFilterList[index],
                              );
                            },
                          )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 17.h,
                      children: [
                        //todo best today
                        BuiltBestTodaySection(
                          qty: qty,
                          onAdd: () {
                            setState(() {
                              qty++;
                            });
                          },
                          onRemove: () {
                            if (qty > 1) {
                              setState(() {
                                qty--;
                              });
                            }
                          },
                          item: categoryProvider.bestOfTodayItem!,
                        ),
                        //todo categories and tabs
                        BuiltCategoriesSection(
                          onTap: (value) {
                            categoryProvider.changeIndex(
                              value,
                              userProvider.currentUser!.id,
                            );
                          },
                          categoryModel: categoryModel,
                          selectedIndex: categoryProvider.selectedIndex,
                        ),
                        //todo filter item
                        BuiltGridItemSection(
                          filterList: categoryProvider.filterList,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
