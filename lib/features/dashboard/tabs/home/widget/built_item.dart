import 'package:coffee_cookies/core/theme/app_colors.dart';
import 'package:coffee_cookies/firebase/firestore/model/category_model_fire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../provider/category_provider/category_provider.dart';
import '../../../../../provider/user_provider/user_provider.dart';

class BuiltItem extends StatelessWidget {
  const BuiltItem({
    super.key,
    required this.model,
  });

  final CategoryModelFire model;
  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Container(
      padding: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.brownExtraLight, width: 1.3.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180.h,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
              child: Image.asset(
                model.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title, style: TextStyles.font16BrownDarkBold),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(model.nameCategory,
                        style: TextStyles.font14BrownDarkMedium),
                    InkWell(
                      onTap: () {
                        //todo change fav
                        categoryProvider.updateFavouriteEvent(
                            model, context, userProvider.currentUser!.id);
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.second,
                        radius: 15.r,
                        child: Icon(
                          model.isFavourite ? Icons.favorite : Icons
                              .favorite_outline,
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
