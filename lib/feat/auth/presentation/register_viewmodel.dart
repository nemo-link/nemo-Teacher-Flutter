import 'package:flutter/material.dart';

import '../../../domain/repo/auth_repository.dart';

class RegisterViewmodel extends ChangeNotifier {
  final AuthRepository _repository;

  RegisterViewmodel(this._repository);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _registerSuccess = false;

  bool get registerSuccess => _registerSuccess;

  Future<void> register({
    required String email,
    required String password,
    required String phone,
    required String name,
    String? accountName,
  }) async {
    _setLoading(true);
    _errorMessage = null;
    _registerSuccess = false;

    try {
      await _repository.register(email, password, phone, name, accountName!);

      _registerSuccess = true;
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
    _registerSuccess = false;
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
