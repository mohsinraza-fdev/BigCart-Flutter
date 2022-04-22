import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import '../../constants/asset_constants.dart';
import '../../shared/helpers.dart';
import '../../shared/styles.dart';
import '../../viewmodels/login_viewmodel.dart';
import '../../widgets/dumb/app_main_button.dart';
import '../../widgets/dumb/authentication_field.dart';

const String EmailValueKey = 'email';
const String PasswordValueKey = 'password';
const String PhoneValueKey = 'phone';

class LoginForm extends HookViewModelWidget<LoginViewModel> {
  const LoginForm({Key? key}) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel viewModel) {
    final email = useTextEditingController();
    final emailFocus = useFocusNode();
    final password = useTextEditingController();
    final passwordFocus = useFocusNode();

    void _fireFormChanged(LoginViewModel model) => model
        .setData({EmailValueKey: email.text, PasswordValueKey: password.text});

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 30),
            child: Text(
              'Welcome back !',
              style: heading5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 2),
            child: Text(
              'Sign in to your account',
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
              FocusScope.of(context).requestFocus(passwordFocus);
              viewModel.fieldPasswordColor = Colors.black;
            },
            textColor: viewModel.fieldTextColor,
            onTap: () => viewModel.fieldTextColor = Colors.black,
            onEditingComplete: () => viewModel.fieldTextColor = appGreyColor,
            label: 'Email',
            prefixIconPath: AssetConstants.emailIcon,
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

          // Error Message
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

          verticalSpaceRegular,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterSwitch(
                  padding: 0,
                  width: 28.57,
                  height: 16,
                  toggleSize: 13,
                  switchBorder: Border.all(width: 1.5, color: appGreyColor),
                  toggleBorder: Border.all(width: 1.5, color: appWhiteColor),
                  inactiveColor: appGreyColor,
                  value: viewModel.shouldRemember,
                  onToggle: (val) => viewModel.shouldRemember = val,
                ),
                const SizedBox(width: 9.43),
                Text(
                  'Remember me',
                  style: paragraph1,
                ),
                const Spacer(),
                Text('Forgot Password',
                    style: paragraph1.copyWith(color: appBlueColor)),
              ],
            ),
          ),
          verticalSpaceMedium,

          // Form Button
          AppMainButton(
            text: 'Login',
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
              text: 'Don\'t have an account ? ',
              style: paragraph3,
              children: <TextSpan>[
                TextSpan(
                  text: 'Sign up',
                  style: paragraph1.copyWith(color: Colors.black),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      viewModel.navigateToSignupPage();
                    },
                ),
              ],
            )),
          ),
          const SizedBox(height: 45),
        ],
      ),
    );
  }
}
