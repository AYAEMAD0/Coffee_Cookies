import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../firebase/firestore/model/category_model_fire.dart';
import 'built_item.dart';

class BuiltGridItemSection extends StatelessWidget {
  const BuiltGridItemSection({super.key, required this.filterList});

  final List<CategoryModelFire> filterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 17.h,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 13.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 0.64,
          ),
          itemCount: filterList.length,
          itemBuilder: (context, index) {
            return BuiltItem(model: filterList[index]);
          },
        ),
      ],
    );
  }
}
