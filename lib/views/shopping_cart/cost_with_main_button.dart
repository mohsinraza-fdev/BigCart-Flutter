import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../shared/styles.dart';
import '../../viewmodels/shopping_cart_viewmodel.dart';
import '../../widgets/dumb/app_main_button.dart';
import 'title_with_cost.dart';

class CostWithMainButton extends ViewModelWidget<ShoppingCartViewModel> {
  const CostWithMainButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ShoppingCartViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 13),
      constraints: const BoxConstraints(minHeight: 100),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 22),
          TitleWithCost(
            title: 'Subtotal',
            cost: viewModel.subTotal,
            style: paragraph6,
          ),
          const SizedBox(height: 7),
          TitleWithCost(
            title: 'Shipping charges',
            cost: viewModel.shippingCharges,
            style: paragraph6,
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            height: 1,
            color: appGreySecondary,
          ),
          TitleWithCost(
            title: 'Total',
            cost: viewModel.totalCost,
            style: paragraph5,
          ),
          const SizedBox(height: 16),
          AppMainButton(
              onTap: () {
                viewModel.moveToCheckout();
              },
              text: 'Checkout'),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
