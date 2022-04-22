import 'package:big_cart/app/app.router.dart';
import 'package:big_cart/app/locator.dart';
import 'package:big_cart/constants/asset_constants.dart';
import 'package:big_cart/views/login/login_view.dart';
import 'package:big_cart/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'views/category/category_view.dart';
import 'views/checkout/checkout_view.dart';
import 'views/home/home_view.dart';
import 'views/order_success/order_success_view.dart';
import 'views/shopping_cart/shopping_cart_view.dart';
import 'views/signup/signup_view.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(AssetConstants.splashScreenBackground), context);
    return MaterialApp(
      title: 'Big Cart',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      // home: CheckoutView(),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
