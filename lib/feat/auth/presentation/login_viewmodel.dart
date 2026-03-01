import 'package:flutter/material.dart';

import '../../../domain/usecase/login_usecase.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginUseCase _login;

  LoginViewModel(this._login);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _loginSuccess = false;

  bool get loginSuccess => _loginSuccess;

  Future<void> login(String email, String password) async {
    _setLoading(true);
    _errorMessage = null;
    _loginSuccess = false;

    try {
      await _login(email, password);

      _loginSuccess = true;
      notifyListeners();
    } catch (e) {
      _handleError(e);
    } finally {
      _setLoading(false);
    }
  }

  void _handleError(Object e) {
    _errorMessage = e.toString();
    notifyListeners();
  }

  void resetSuccess() {
    _loginSuccess = false;
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
