import 'package:big_cart/app/app.router.dart';
import 'package:big_cart/app/locator.dart';
import 'package:big_cart/services/authentication_service.dart';
import 'package:big_cart/shared/styles.dart';
import 'package:big_cart/views/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _auth = locator<AuthenticationService>();
  final _navigator = locator<NavigationService>();

  Color _fieldTextColor = appGreyColor;
  Color get fieldTextColor => _fieldTextColor;
  set fieldTextColor(Color color) {
    _fieldPasswordColor = appGreyColor;
    _fieldTextColor = color;
    notifyListeners();
  }

  Color _fieldPasswordColor = appGreyColor;
  Color get fieldPasswordColor => _fieldPasswordColor;
  set fieldPasswordColor(Color color) {
    _fieldPasswordColor = color;
    _fieldTextColor = appGreyColor;
    notifyListeners();
  }

  bool _isObscure = true;
  bool get isObscure => _isObscure;
  set isObscure(bool value) {
    _isObscure = value;
    notifyListeners();
  }

  bool _shouldRemember = false;
  bool get shouldRemember => _shouldRemember;
  set shouldRemember(bool value) {
    _shouldRemember = value;
    notifyListeners();
  }

  bool _emailHasError = false;
  bool get emailHasError => _emailHasError;
  set emailHasError(bool value) {
    _emailHasError = value;
    notifyListeners();
  }

  bool _passwordHasError = false;
  bool get passwordHasError => _passwordHasError;
  set passwordHasError(bool value) {
    _passwordHasError = value;
    notifyListeners();
  }

  bool isLoading = false;

  void validateForm() async {
    isLoading = true;
    notifyListeners();
    emailHasError = false;
    passwordHasError = false;
    String email = formValueMap[EmailValueKey];
    String password = formValueMap[PasswordValueKey];
    bool passwordContainsNumber = false;
    passwordContainsNumber = password.contains(RegExp(r'[0-9]'));

    if (!email.contains('@')) {
      setValidationMessage('Please enter a valid email');
      emailHasError = true;
    } else if (password.length < 8) {
      setValidationMessage('Incorrect Password');
      passwordHasError = true;
    } else if (!passwordContainsNumber) {
      setValidationMessage('Incorrect Password');
      passwordHasError = true;
    } else {
      try {
        await _auth.login(
            email: email, password: password, shouldRemember: _shouldRemember);
        _navigator.replaceWith(Routes.homeView);
      } catch (e) {
        setValidationMessage('Invalid Credentials');
      }
    }
    isLoading = false;
    notifyListeners();
  }

  void navigateToSignupPage() {
    _navigator.replaceWith(Routes.signupView);
  }

  @override
  void setFormStatus() {}
}
