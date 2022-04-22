import 'package:big_cart/constants/asset_constants.dart';
import 'package:big_cart/shared/styles.dart';
import 'package:big_cart/viewmodels/shopping_cart_viewmodel.dart';
import 'package:big_cart/widgets/dumb/customized_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'cart_item_list.dart';
import 'cost_with_main_button.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    return ViewModelBuilder<ShoppingCartViewModel>.nonReactive(
      viewModelBuilder: () => ShoppingCartViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: appWhiteColor,
        body: Column(
          children: [
            CustomizedAppBar(
              title: 'Shopping Cart',
              leading: AssetConstants.backArrowBlack,
              leadingOnTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 13),
            const Expanded(
              child: CartItemList(),
            ),
            const CostWithMainButton(),
          ],
        ),
      ),
    );
  }
}
