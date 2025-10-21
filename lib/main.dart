import 'package:coffee_cookies/coffee_cookies.dart';
import 'package:coffee_cookies/core/routing/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CoffeeCookies(appRouter: AppRouter()));
}
