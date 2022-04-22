import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../shared/styles.dart';
import '../../viewmodels/home_viewmodel.dart';

class CategoryContainers extends ViewModelWidget<HomeViewModel> {
  const CategoryContainers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            ...[const SizedBox(width: 10)],
            ...List.generate(
              viewModel.categories.length,
              (index) => GestureDetector(
                onTap: () => viewModel.navigateToCategoryPage(
                    viewModel.categories[index].id,
                    viewModel.categories[index].title),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      margin: const EdgeInsets.only(
                        left: 10,
                        top: 17,
                        bottom: 29,
                        right: 10,
                      ),
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: getCategoryColorFromId(
                            viewModel.categories[index].id ?? 0),
                      ),
                      child: Image.asset(
                        getCategoryIconFromId(
                            viewModel.categories[index].id ?? 0),
                      ),
                    ),
                    Positioned(
                      bottom: 3,
                      child: Text(
                        viewModel.categories[index].title ?? '',
                        style: paragraph7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ...[const SizedBox(width: 10)],
          ],
        ),
      ),
    );
  }
}
