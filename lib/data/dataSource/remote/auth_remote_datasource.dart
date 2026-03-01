import 'package:dio/dio.dart';
import 'package:nemo_teacher/core/remote/request/register_request.dart';

import '../../../core/network/api_client.dart';
import '../../../core/remote/request/login_request.dart';

class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(ApiClient apiClient) : _dio = apiClient.dio;

  Future<Response> login(LoginRequest loginRequest) {
    return _dio.post('/auth/login', data: loginRequest.toJson());
  }

  Future<Response> register(RegisterRequest registerRequest) {
    return _dio.post('/auth/register', data: registerRequest.toJson());
  }
}
