import 'package:big_cart/constants/asset_constants.dart';
import 'package:big_cart/viewmodels/signup_viewmodel.dart';
import 'package:big_cart/views/signup/signup_form.dart';
import 'package:big_cart/widgets/dumb/authentication_layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../shared/helpers.dart';
import '../../shared/styles.dart';
import '../../widgets/dumb/app_main_button.dart';
import '../../widgets/dumb/authentication_field.dart';
import '../login/login_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, model, child) => AuthenticationLayout(
        form: const SignupForm(),
        minHeight: 473,
        isDisabled: model.isLoading,
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
        image: AssetConstants.signupBackground,
        onScreenTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          model.fieldTextColor = appGreyColor;
          model.fieldPasswordColor = appGreyColor;
          model.fieldPhoneColor = appGreyColor;
        },
      ),
    );
  }
}
