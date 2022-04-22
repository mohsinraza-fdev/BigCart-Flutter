import 'package:big_cart/app/api.dart';
import 'package:big_cart/app/app.router.dart';
import 'package:big_cart/app/locator.dart';
import 'package:big_cart/models/product_model.dart';
import 'package:big_cart/services/authentication_service.dart';
import 'package:big_cart/services/cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CheckoutViewModel extends BaseViewModel {
  final _auth = locator<AuthenticationService>();
  final _navigator = locator<NavigationService>();
  final _cartService = locator<CartService>();

  List<Product> get cart => _cartService.cart;

  // Name Field Controls
  String _formName = '';
  String get formName => _formName;
  set formName(String value) {
    _formName = value;
    _formNameHasError = false;
    notifyListeners();
  }

  String? _formNameError = 'Field cannot be empty';
  String? get formNameError => _formNameError;
  bool _formNameHasError = false;
  bool get formNameHasError => _formNameHasError;

  void validateNameField() {
    if (_formName.length == '') {
      _formNameError = 'Field cannot be empty';
      _formNameHasError = true;
    } else if (_formName.length < 3) {
      _formNameError = 'Enter a valid name';
      _formNameHasError = true;
    }
  }

  // Email Field Controls
  String _formEmail = '';
  String get formEmail => _formEmail;
  set formEmail(String value) {
    _formEmail = value;
    _formEmailHasError = false;
    notifyListeners();
  }

  String? _formEmailError = 'Field cannot be empty';
  String? get formEmailError => _formEmailError;
  bool _formEmailHasError = false;
  bool get formEmailHasError => _formEmailHasError;

  void validateEmailField() {
    if (_formEmail.length == '') {
      _formEmailError = 'Field cannot be empty';
      _formEmailHasError = true;
    } else if (_formEmail.length < 5) {
      _formEmailError = 'Enter a valid email';
      _formEmailHasError = true;
    } else if (!_formEmail.contains('@')) {
      _formEmailError = 'Enter a valid email';
      _formEmailHasError = true;
    }
  }

  // Phone Field Controls
  String _formPhone = '';
  String get formPhone => _formPhone;
  set formPhone(String value) {
    _formPhone = value;
    _formPhoneHasError = false;
    notifyListeners();
  }

  String? _formPhoneError = 'Field cannot be empty';
  String? get formPhoneError => _formPhoneError;
  bool _formPhoneHasError = false;
  bool get formPhoneHasError => _formPhoneHasError;

  void validatePhoneField() {
    if (_formPhone.length == '') {
      _formPhoneError = 'Field cannot be empty';
      _formPhoneHasError = true;
    } else if (_formPhone.length < 10) {
      _formPhoneError = 'Enter a valid phone number';
      _formPhoneHasError = true;
    }
  }

  // Address Field Controls
  String _formAddress = '';
  String get formAddress => _formAddress;
  set formAddress(String value) {
    _formAddress = value;
    _formAddressHasError = false;
    notifyListeners();
  }

  String? _formAddressError = 'Field cannot be empty';
  String? get formAddressError => _formAddressError;
  bool _formAddressHasError = false;
  bool get formAddressHasError => _formAddressHasError;

  void validateAddressField() {
    if (_formAddress.length == '') {
      _formAddressError = 'Field cannot be empty';
      _formAddressHasError = true;
    } else if (_formAddress.length < 3) {
      _formAddressError = 'Enter a valid address';
      _formAddressHasError = true;
    }
  }

  // Zipcode Field Controls
  String _formZipcode = '';
  String get formZipcode => _formZipcode;
  set formZipcode(String value) {
    _formZipcode = value;
    _formZipcodeHasError = false;
    notifyListeners();
  }

  String? _formZipcodeError = 'Field cannot be empty';
  String? get formZipcodeError => _formZipcodeError;
  bool _formZipcodeHasError = false;
  bool get formZipcodeHasError => _formZipcodeHasError;

  void validateZipcodeField() {
    if (_formZipcode.length == '') {
      _formZipcodeError = 'Field cannot be empty';
      _formZipcodeHasError = true;
    } else if (_formZipcode.length < 3) {
      _formZipcodeError = 'Enter a valid zipcode';
      _formZipcodeHasError = true;
    }
  }

  // City Field Controls
  String _formCity = '';
  String get formCity => _formCity;
  set formCity(String value) {
    _formCity = value;
    _formCityHasError = false;
    notifyListeners();
  }

  String? _formCityError = 'Field cannot be empty';
  String? get formCityError => _formCityError;
  bool _formCityHasError = false;
  bool get formCityHasError => _formCityHasError;

  void validateCityField() {
    if (_formCity.length == '') {
      _formCityError = 'Field cannot be empty';
      _formCityHasError = true;
    } else if (_formCity.length < 2) {
      _formCityError = 'Enter a valid city';
      _formCityHasError = true;
    }
  }

  // Country Field Controls
  String _formCountry = '';
  String get formCountry => _formCountry;
  set formCountry(String value) {
    _formCountry = value;
    _formCountryHasError = false;
    notifyListeners();
  }

  String? _formCountryError = 'Field cannot be empty';
  String? get formCountryError => _formCountryError;
  bool _formCountryHasError = false;
  bool get formCountryHasError => _formCountryHasError;

  void validateCountryField() {
    if (_formCountry == '') {
      _formCountryError = 'Field cannot be empty';
      _formCountryHasError = true;
    }
  }

  bool isLoading = false;

  Future<void> validateForm() async {
    validateNameField();
    validateEmailField();
    validatePhoneField();
    validateAddressField();
    validateZipcodeField();
    validateCityField();
    validateCountryField();
    notifyListeners();
    if (formAddressHasError == false &&
        formNameHasError == false &&
        formEmailHasError == false &&
        formPhoneHasError == false &&
        formZipcodeHasError == false &&
        formCityHasError == false &&
        formCountryHasError == false) {
      isLoading = true;
      notifyListeners();
      try {
        int id = await Api.placeOrder(
          _auth.authToken,
          _formName,
          _formEmail,
          _formPhone,
          _formAddress,
          _formZipcode,
          _formCity,
          _formCountry,
          cart.map((e) => e.toJson()).toList(),
        );
        _cartService.clearCart();
        isLoading = false;
        notifyListeners();
        _navigator.navigateTo(Routes.orderSuccessView,
            arguments: OrderSuccessViewArguments(id: id));
      } catch (e) {
        isLoading = false;
        notifyListeners();
        print(e.toString());
      }
    }
  }
}
