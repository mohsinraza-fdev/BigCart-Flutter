import 'package:big_cart/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.router.dart';
import '../app/locator.dart';
import '../shared/styles.dart';
import '../views/login/login_form.dart';

class SignupViewModel extends FormViewModel {
  final _auth = locator<AuthenticationService>();
  final _navigator = locator<NavigationService>();

  Color _fieldTextColor = appGreyColor;
  Color get fieldTextColor => _fieldTextColor;
  set fieldTextColor(Color color) {
    _fieldPhoneColor = appGreyColor;
    _fieldPasswordColor = appGreyColor;
    _fieldTextColor = color;
    notifyListeners();
  }

  Color _fieldPhoneColor = appGreyColor;
  Color get fieldPhoneColor => _fieldPhoneColor;
  set fieldPhoneColor(Color color) {
    _fieldPhoneColor = color;
    _fieldPasswordColor = appGreyColor;
    _fieldTextColor = appGreyColor;
    notifyListeners();
  }

  Color _fieldPasswordColor = appGreyColor;
  Color get fieldPasswordColor => _fieldPasswordColor;
  set fieldPasswordColor(Color color) {
    _fieldPasswordColor = color;
    _fieldTextColor = appGreyColor;
    _fieldPhoneColor = appGreyColor;
    notifyListeners();
  }

  bool _isObscure = true;
  bool get isObscure => _isObscure;
  set isObscure(bool value) {
    _isObscure = value;
    notifyListeners();
  }

  bool _phoneHasError = false;
  bool get phoneHasError => _phoneHasError;
  set phoneHasError(bool value) {
    _phoneHasError = value;
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
    phoneHasError = false;
    String email = formValueMap[EmailValueKey];
    String password = formValueMap[PasswordValueKey];
    String phone = formValueMap[PhoneValueKey];
    bool passwordContainsNumber = false;
    passwordContainsNumber = password.contains(RegExp(r'[0-9]'));

    if (!email.contains('@')) {
      setValidationMessage('Please enter a valid email');
      emailHasError = true;
    } else if (phone.length < 10) {
      setValidationMessage('Enter a valid phone number');
      phoneHasError = true;
    } else if (password.length < 8) {
      setValidationMessage('Password must be atleast 8 characters long');
      passwordHasError = true;
    } else if (!passwordContainsNumber) {
      setValidationMessage('Password must contain a number');
      passwordHasError = true;
    } else {
      try {
        await _auth.signup(email: email, password: password, phone: phone);
        _navigator.replaceWith(Routes.homeView);
      } catch (e) {
        setValidationMessage('Something went wrong');
      }
    }
    isLoading = false;
    notifyListeners();
  }

  void navigateToLoginPage() {
    _navigator.replaceWith(Routes.loginView);
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
