import 'package:coffee_cookies/coffee_cookies.dart';
import 'package:coffee_cookies/core/routing/app_router.dart';
import 'package:coffee_cookies/provider/category_provider/category_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/helper/shared_check_helper.dart';
import 'provider/user_provider/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedCheckHelper.init();
  final bool login = await SharedCheckHelper.getLogin();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: CoffeeCookies(appRouter: AppRouter(), isLogin: login),
    ),
  );
}
