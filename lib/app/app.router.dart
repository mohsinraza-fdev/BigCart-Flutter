// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../views/category/category_view.dart';
import '../views/checkout/checkout_view.dart';
import '../views/home/home_view.dart';
import '../views/login/login_view.dart';
import '../views/order_success/order_success_view.dart';
import '../views/shopping_cart/shopping_cart_view.dart';
import '../views/signup/signup_view.dart';
import '../views/splash/splash_view.dart';

class Routes {
  static const String splashView = '/';
  static const String loginView = '/login-view';
  static const String signupView = '/signup-view';
  static const String homeView = '/home-view';
  static const String categoryView = '/category-view';
  static const String shoppingCartView = '/shopping-cart-view';
  static const String checkoutView = '/checkout-view';
  static const String orderSuccessView = '/order-success-view';
  static const all = <String>{
    splashView,
    loginView,
    signupView,
    homeView,
    categoryView,
    shoppingCartView,
    checkoutView,
    orderSuccessView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signupView, page: SignupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.categoryView, page: CategoryView),
    RouteDef(Routes.shoppingCartView, page: ShoppingCartView),
    RouteDef(Routes.checkoutView, page: CheckoutView),
    RouteDef(Routes.orderSuccessView, page: OrderSuccessView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    SignupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    CategoryView: (data) {
      var args = data.getArgs<CategoryViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CategoryView(
          key: args.key,
          id: args.id,
          title: args.title,
        ),
        settings: data,
      );
    },
    ShoppingCartView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ShoppingCartView(),
        settings: data,
      );
    },
    CheckoutView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CheckoutView(),
        settings: data,
      );
    },
    OrderSuccessView: (data) {
      var args = data.getArgs<OrderSuccessViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => OrderSuccessView(
          key: args.key,
          id: args.id,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CategoryView arguments holder class
class CategoryViewArguments {
  final Key? key;
  final int id;
  final String title;
  CategoryViewArguments({this.key, required this.id, required this.title});
}

/// OrderSuccessView arguments holder class
class OrderSuccessViewArguments {
  final Key? key;
  final int id;
  OrderSuccessViewArguments({this.key, required this.id});
}
