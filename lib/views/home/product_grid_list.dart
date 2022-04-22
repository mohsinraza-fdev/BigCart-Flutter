import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/helpers.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../widgets/dumb/product_card.dart';

class ProductGridList extends ViewModelWidget<HomeViewModel> {
  const ProductGridList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth(context) > screenHeight(context) ? 4 : 2,
          childAspectRatio: 181 / 234,
          crossAxisSpacing: 18,
          mainAxisSpacing: 20),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      itemCount: viewModel.products.length,
      itemBuilder: (context, index) => ProductCard(
        shadeColor: viewModel.products[index].color,
        image: viewModel.products[index].image,
        price: viewModel.products[index].price,
        title: viewModel.products[index].title,
        unit: viewModel.products[index].unit,
        qtyInCart: viewModel.productQuantity(viewModel.products[index]),
        onMinusTap: () => viewModel.removeFromCart(viewModel.products[index]),
        onPlusTap: () => viewModel.addToCart(viewModel.products[index]),
        onFavoriteButtonTap: () =>
            viewModel.addOrRemoveFavorites(viewModel.products[index]),
        favoriteToggle: viewModel.isFavorited(viewModel.products[index]),
      ),
      shrinkWrap: true,
      primary: false,
    );
  }
}
