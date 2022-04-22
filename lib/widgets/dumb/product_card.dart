import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/asset_constants.dart';
import '../../shared/styles.dart';

class ProductCard extends StatelessWidget {
  final String? shadeColor;
  final String? image;
  final double? price;
  final String? title;
  final String? unit;
  int qtyInCart;
  bool favoriteToggle;
  VoidCallback onMinusTap;
  VoidCallback onPlusTap;
  VoidCallback onFavoriteButtonTap;

  ProductCard({
    Key? key,
    required this.shadeColor,
    required this.image,
    required this.price,
    required this.title,
    required this.unit,
    required this.qtyInCart,
    required this.favoriteToggle,
    required this.onMinusTap,
    required this.onPlusTap,
    required this.onFavoriteButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 21,
                  ),
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
                                  '0xFF' + shadeColor.toString().substring(1),
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
                                image ?? AssetConstants.errorIcon)),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                '\$' + (price ?? 0).toString().padRight(4, '0'),
                style: paragraph6.copyWith(color: appGreenColor),
              ),
              Text(
                title ?? '',
                style: heading7.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 2),
              Text(
                unit ?? '',
                style: paragraph6,
              ),
              const SizedBox(height: 15),
              Container(
                height: 1,
                color: appGreySecondary,
              ),
              SizedBox(
                height: 41,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 150),
                  child: qtyInCart > 0
                      ? Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: onMinusTap,
                                child: Container(
                                  color: Colors.transparent,
                                  width: 41,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    AssetConstants.subtractIcon,
                                    width: 13.5,
                                  ),
                                ),
                              ),
                              Text(
                                qtyInCart.toString(),
                                style: paragraph6.copyWith(color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: onPlusTap,
                                child: Container(
                                  color: Colors.transparent,
                                  width: 41,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    AssetConstants.addIcon,
                                    width: 13.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: onPlusTap,
                          child: Container(
                            height: 40,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AssetConstants.addToCartIcon,
                                  height: 15,
                                ),
                                const SizedBox(width: 9),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    'Add to cart',
                                    style: paragraph6.copyWith(
                                      color: const Color(0xFF010101),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 9,
            right: 8,
            child: GestureDetector(
              onTap: onFavoriteButtonTap,
              child: Image.asset(
                favoriteToggle
                    ? AssetConstants.favoriteSelected
                    : AssetConstants.favoriteUnselected,
                width: 18,
                height: 16,
              ),
            ))
      ],
    );
  }
}
