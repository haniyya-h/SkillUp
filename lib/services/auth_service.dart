import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Demo authentication - accept any email/password
    if (email.isNotEmpty && password.isNotEmpty) {
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _errorMessage = 'Please enter valid email and password';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}

