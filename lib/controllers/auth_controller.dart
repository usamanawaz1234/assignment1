import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  bool _isAuthenticated = false;
  final _prefs = SharedPreferences.getInstance();

  bool get isAuthenticated => _isAuthenticated;

  Future<bool> login(String username, String password) async {
    // In a real app, you would validate credentials against a backend
    if (username.isNotEmpty && password.isNotEmpty) {
      _isAuthenticated = true;
      final prefs = await _prefs;
      await prefs.setBool('isAuthenticated', true);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    final prefs = await _prefs;
    await prefs.setBool('isAuthenticated', false);
    notifyListeners();
  }
}
