import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:coffee_cookies/core/theme/app_colors.dart';
import 'package:coffee_cookies/features/dashboard/tabs/order/order_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider/user_provider.dart';
import 'tabs/fav/fav_tab.dart';
import 'tabs/home/home_tab.dart';
import 'tabs/profile/profile_tab.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).initUser();
    });
  }

  final List<IconData> iconSelected = [
    Icons.home,
    Icons.favorite,
    Icons.local_cafe,
    Icons.person,
  ];

  final List<IconData> iconUnselected = [
    Icons.home_outlined,
    Icons.favorite_outline,
    Icons.local_cafe_outlined,
    Icons.person_outline,
  ];

  final List tabList = [HomeTab(), FavTab(), OrderTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconSelected.length,
        backgroundColor: AppColors.second,
        activeIndex: selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 25.r,
        rightCornerRadius: 25.r,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        tabBuilder: (index, active) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Column(
              children: [
                Icon(
                  active ? iconSelected[index] : iconUnselected[index],
                  size: 28,
                  color: AppColors.white,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo nav cart
        },
        shape: StadiumBorder(),
        child: Icon(Icons.shopping_cart, size: 30),
      ),
      body: tabList[selectedIndex],
    );
  }
}
//
