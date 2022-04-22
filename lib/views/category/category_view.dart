import 'package:big_cart/constants/asset_constants.dart';
import 'package:big_cart/shared/styles.dart';
import 'package:big_cart/viewmodels/category_viewmodel.dart';
import 'package:big_cart/views/category/product_category_grid_list.dart';
import 'package:big_cart/widgets/dumb/customized_app_bar.dart';
import 'package:big_cart/widgets/dumb/loading_indicator.dart';
import 'package:big_cart/widgets/dumb/page_error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class CategoryView extends StatelessWidget {
  final int id;
  final String title;

  const CategoryView({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    return ViewModelBuilder<CategoryViewModel>.reactive(
      onModelReady: (viewModel) => viewModel.onModelReady(id),
      viewModelBuilder: () => CategoryViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: appWhiteColor,
        body: Column(
          children: [
            CustomizedAppBar(
              title: title,
              leading: AssetConstants.backArrowBlack,
              leadingOnTap: () {
                Navigator.of(context).pop();
              },
              trailing: AssetConstants.filterBlack,
              trailingOnTap: () {},
            ),
            const SizedBox(height: 13),
            Expanded(
              child: model.hasError
                  ? const PageErrorIndicator()
                  : model.isLoading
                      ? const LoadingIndicator()
                      : model.products.isEmpty
                          ? Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 13),
                                child: Text(
                                  'No products found',
                                  style: paragraph1,
                                ),
                              ),
                            )
                          : const ProductCategoryGridList(),
            ),
          ],
        ),
      ),
    );
  }
}
