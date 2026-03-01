import 'package:nemo_teacher/core/remote/request/register_request.dart';
import 'package:nemo_teacher/core/remote/response/login_response.dart';
import 'package:nemo_teacher/core/remote/response/register_response.dart';

import '../../core/network/base_response.dart';
import '../../core/remote/request/login_request.dart';
import '../../data/dataSource/remote/auth_remote_datasource.dart';

class AuthRepository {
  final AuthRemoteDataSource _remote;

  AuthRepository(this._remote);

  Future<LoginResponse> login(String email, String password) async {
    final response = await _remote.login(
      LoginRequest(email: email, password: password),
    );

    final result = BaseResponse<LoginResponse>.fromJson(
      response.data,
      LoginResponse.fromJson,
    );

    result.ensureSuccess();

    final data = result.data;
    if (data == null) {
      throw StateError('LoginResponse data is null');
    }
    return data;
  }

  Future<RegisterResponse> register(
    String email,
    String password,
    String phone,
    String name,
    String accountName,
  ) async {
    final response = await _remote.register(
      RegisterRequest(
        email: email,
        password: password,
        phone: phone,
        name: name,
        accountName: accountName,
      ),
    );

    final result = BaseResponse<RegisterResponse>.fromJson(
      response.data,
      RegisterResponse.fromJson,
    );

    result.ensureSuccess();

    final data = result.data;
    if (data == null) {
      throw StateError('LoginResponse data is null');
    }
    return data;
  }
}
