import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/app_theme.dart';

class CoffeeCookies extends StatelessWidget {
  final AppRouter appRouter;
  final bool isLogin;

  const CoffeeCookies({
    super.key,
    required this.appRouter,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          initialRoute: isLogin
              ? Routes.dashboardRouteName
              : Routes.loginRouteName,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
