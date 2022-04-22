import 'package:big_cart/constants/asset_constants.dart';
import 'package:big_cart/shared/styles.dart';
import 'package:big_cart/viewmodels/checkout_viewmodel.dart';
import 'package:big_cart/widgets/dumb/app_main_button.dart';
import 'package:big_cart/widgets/dumb/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/dumb/customized_app_bar.dart';
import 'checkout_form.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    return ViewModelBuilder<CheckoutViewModel>.reactive(
      viewModelBuilder: () => CheckoutViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: appWhiteColor,
          body: Column(
            children: [
              CustomizedAppBar(
                title: 'Checkout',
                leading: AssetConstants.backArrowBlack,
                leadingOnTap: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 13),
              Expanded(
                child: model.isLoading
                    ? const LoadingIndicator()
                    : const CheckoutForm(),
              ),
              const SizedBox(height: 13),
              AppMainButton(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if (!model.isLoading) {
                      model.validateForm();
                    }
                  },
                  text: 'Next'),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
