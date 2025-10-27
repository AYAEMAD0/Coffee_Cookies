import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../firebase/firestore/model/category_model_fire.dart';
import 'built_best_item.dart';

class BuiltBestTodaySection extends StatelessWidget {
  const BuiltBestTodaySection({
    super.key,
    required this.qty,
    required this.onAdd,
    required this.onRemove,
    required this.item,
  });

  final int qty;
  final CategoryModelFire item;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 17.h,
      children: [
        Text(AppStrings.bestOfToday, style: TextStyles.font20SecondBold),
        //todo random best item
        BuiltBestItem(
          title: item.title,
          category: item.nameCategory,
          price: item.price.toString(),
          image: item.image,
          qty: qty,
          onAdd: onAdd,
          onRemove: onRemove,
        ),
      ],
    );
  }
}
