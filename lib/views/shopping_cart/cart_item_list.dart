import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../constants/asset_constants.dart';
import '../../shared/helpers.dart';
import '../../shared/styles.dart';
import '../../viewmodels/shopping_cart_viewmodel.dart';

class CartItemList extends ViewModelWidget<ShoppingCartViewModel> {
  const CartItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ShoppingCartViewModel viewModel) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 2),
        ...List.generate(
          viewModel.cart.length,
          (index) => Slidable(
            endActionPane: ActionPane(
                extentRatio: 0.22,
                motion: const ScrollMotion(),
                children: [
                  GestureDetector(
                    onTap: () =>
                        viewModel.deleteFromCart(viewModel.cart[index]),
                    child: Container(
                      margin: const EdgeInsets.only(top: 11),
                      width: (screenWidth(context) * 0.22) - 17,
                      alignment: Alignment.center,
                      color: appRedColor,
                      child: Image.asset(
                        AssetConstants.deleteIcon,
                        height: 28,
                      ),
                    ),
                  )
                ]),
            child: Container(
              height: 100,
              padding: const EdgeInsets.only(right: 7),
              margin: const EdgeInsets.only(
                left: 17,
                right: 17,
                top: 11,
              ),
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    width: 104,
                    padding: const EdgeInsets.only(top: 15, bottom: 8),
                    color: Colors.transparent,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 18),
                          child: FittedBox(
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: Color(
                                  int.parse(
                                    '0xFF' +
                                        viewModel.cart[index].color
                                            .toString()
                                            .substring(1),
                                  ),
                                ).withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8, top: 15),
                          child: FittedBox(
                              child: Image.network(
                                  viewModel.cart[index].image ??
                                      AssetConstants.errorIcon)),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 2),
                      Text(
                        '\$' +
                            (viewModel.cart[index].price ?? 0)
                                .toString()
                                .padRight(4, '0') +
                            ' x ' +
                            (viewModel.cart[index].qty ?? 0).toString(),
                        style: paragraph6.copyWith(color: appGreenColor),
                      ),
                      Text(
                        viewModel.cart[index].title ?? '',
                        style: heading7.copyWith(color: Colors.black),
                      ),
                      Text(
                        viewModel.cart[index].unit ?? '',
                        style: paragraph6,
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 41,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              viewModel.addToCart(viewModel.cart[index]);
                            },
                            child: Container(
                              color: Colors.transparent,
                              height: 31,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                AssetConstants.addIcon,
                                width: 13.5,
                              ),
                            ),
                          ),
                          Text(
                            viewModel
                                .productQuantity(viewModel.cart[index])
                                .toString(),
                            style: paragraph4,
                          ),
                          GestureDetector(
                            onTap: () {
                              viewModel.removeFromCart(viewModel.cart[index]);
                            },
                            child: Container(
                              color: Colors.transparent,
                              height: 31,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                AssetConstants.subtractIcon,
                                width: 13.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 13),
      ],
    );
  }
}
