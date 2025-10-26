import 'package:coffee_cookies/core/routing/routes.dart';
import 'package:coffee_cookies/features/auth/views/forget_password_view.dart';
import 'package:coffee_cookies/features/auth/views/login_view.dart';
import 'package:coffee_cookies/features/auth/views/signup_view.dart';
import 'package:coffee_cookies/features/dashboard/dashboard_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRouteName:
        return MaterialPageRoute(builder: (context) => LoginView(),);
      case Routes.signUpRouteName:
        return MaterialPageRoute(builder: (context) => SignupView(),);
      case Routes.forgetPasswordRouteName:
        return MaterialPageRoute(builder: (context) => ForgetPasswordView(),);
      case Routes.dashboardRouteName:
        return MaterialPageRoute(builder: (context) => DashboardView(),);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
