import 'package:big_cart/views/login/login_view.dart';
import 'package:big_cart/views/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import '../views/category/category_view.dart';
import '../views/checkout/checkout_view.dart';
import '../views/home/home_view.dart';
import '../views/order_success/order_success_view.dart';
import '../views/shopping_cart/shopping_cart_view.dart';
import '../views/signup/signup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: CategoryView),
    MaterialRoute(page: ShoppingCartView),
    MaterialRoute(page: CheckoutView),
    MaterialRoute(page: OrderSuccessView),
  ],
)
class AppSetup {}
