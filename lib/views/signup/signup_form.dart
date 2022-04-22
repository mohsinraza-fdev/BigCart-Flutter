import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import '../../constants/asset_constants.dart';
import '../../shared/helpers.dart';
import '../../shared/styles.dart';
import '../../viewmodels/signup_viewmodel.dart';
import '../../widgets/dumb/app_main_button.dart';
import '../../widgets/dumb/authentication_field.dart';
import '../login/login_form.dart';

class SignupForm extends HookViewModelWidget<SignupViewModel> {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, SignupViewModel viewModel) {
    final email = useTextEditingController();
    final emailFocus = useFocusNode();
    final password = useTextEditingController();
    final passwordFocus = useFocusNode();
    final phone = useTextEditingController();
    final phoneFocus = useFocusNode();

    void _fireFormChanged(SignupViewModel model) => model.setData({
          EmailValueKey: email.text,
          PasswordValueKey: password.text,
          PhoneValueKey: phone.text,
        });

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 30),
            child: Text(
              'Create account',
              style: heading5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 2),
            child: Text(
              'Quickly create account',
              style: paragraph2,
            ),
          ),
          const SizedBox(height: 26),

          // Email Field
          AuthenticationField(
            controller: email,
            focusNode: emailFocus,
            hasError: viewModel.emailHasError,
            onChanged: (text) {
              _fireFormChanged(viewModel);
              viewModel.emailHasError = false;
            },
            onSubmit: (text) {
              FocusScope.of(context).requestFocus(phoneFocus);
              viewModel.fieldPhoneColor = Colors.black;
            },
            textColor: viewModel.fieldTextColor,
            onTap: () => viewModel.fieldTextColor = Colors.black,
            onEditingComplete: () => viewModel.fieldTextColor = appGreyColor,
            label: 'Email',
            prefixIconPath: AssetConstants.emailIcon,
          ),
          verticalSpaceMini,

          // Phone Field
          AuthenticationField(
            controller: phone,
            focusNode: phoneFocus,
            hasError: viewModel.phoneHasError,
            onChanged: (text) {
              _fireFormChanged(viewModel);
              viewModel.phoneHasError = false;
            },
            onSubmit: (text) {
              FocusScope.of(context).requestFocus(passwordFocus);
              viewModel.fieldPasswordColor = Colors.black;
            },
            textColor: viewModel.fieldPhoneColor,
            onTap: () => viewModel.fieldPhoneColor = Colors.black,
            onEditingComplete: () => viewModel.fieldPhoneColor = appGreyColor,
            label: 'Phone',
            prefixIconPath: AssetConstants.phoneIcon,
          ),
          verticalSpaceMini,

          // Password Field
          AuthenticationField(
            controller: password,
            focusNode: passwordFocus,
            hasError: viewModel.passwordHasError,
            onChanged: (text) {
              _fireFormChanged(viewModel);
              viewModel.passwordHasError = false;
            },
            onSubmit: (text) {
              FocusScope.of(context).unfocus();
            },
            textColor: viewModel.fieldPasswordColor,
            onTap: () => viewModel.fieldPasswordColor = Colors.black,
            onEditingComplete: () {
              viewModel.fieldPasswordColor = appGreyColor;
              FocusScope.of(context).unfocus();
            },
            obscureText: viewModel.isObscure,
            label: 'Password',
            prefixIconPath: AssetConstants.passwordIcon,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: IconButton(
                onPressed: () => viewModel.isObscure = !viewModel.isObscure,
                icon: Icon(
                  viewModel.isObscure ? Icons.visibility : Icons.visibility_off,
                  color: appGreyColor,
                ),
              ),
            ),
          ),
          if (viewModel.showValidationMessage) ...[
            verticalSpaceMini,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  viewModel.validationMessage.toString(),
                  textAlign: TextAlign.center,
                  style: paragraph6.copyWith(color: Colors.red, fontSize: 15),
                ),
              ),
            ),
          ],

          verticalSpaceMedium,

          // Form Button
          AppMainButton(
            text: 'SignUp',
            isLoading: viewModel.isLoading,
            onTap: () {
              FocusScope.of(context).unfocus();
              viewModel.validateForm();
            },
          ),
          const SizedBox(height: 20),

          // Footer Text
          Align(
            alignment: Alignment.topCenter,
            child: RichText(
              text: TextSpan(
                text: 'Already have an account ? ',
                style: paragraph3,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Login',
                    style: paragraph1.copyWith(color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        viewModel.navigateToLoginPage();
                      },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 45),
        ],
      ),
    );
  }
}
