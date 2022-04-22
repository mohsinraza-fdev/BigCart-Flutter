import 'dart:convert';
import 'package:big_cart/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app/api.dart';

@lazySingleton
class AuthenticationService {
  String? get authToken => _user?.accessToken;
  String? get email => _user?.email;

  User? _user;

  Future<void> loadUser() async {
    final pref = await SharedPreferences.getInstance();
    try {
      _user = User.fromJson(jsonDecode(pref.getString('user') ?? ''));
    } catch (e) {
      return;
    }
  }

  Future<void> resetUser() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    _user = null;
  }

  Future<void> _saveUser() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('user', jsonEncode(_user?.toJson()));
  }

  Future login({
    required String email,
    required String password,
    required bool shouldRemember,
  }) async {
    _user = null;
    try {
      _user = await Api.loginUser(email, password);
      if (shouldRemember == true) {
        await _saveUser();
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future signup({
    required String email,
    required String password,
    required String phone,
  }) async {
    _user = null;
    try {
      _user = await Api.signupUser(email, phone, password);
    } catch (e) {
      throw (e.toString());
    }
  }

  Future logout() async {
    try {
      _user = await Api.logoutUser(
        _user?.accessToken,
      );
      await resetUser();
    } catch (e) {
      throw (e.toString());
    }
  }
}
