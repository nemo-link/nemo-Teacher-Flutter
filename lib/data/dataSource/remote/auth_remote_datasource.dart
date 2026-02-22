import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/network/api_client.dart';
import '../../../core/remote/request/login_request.dart';

class AuthRemoteDataSource {
  final Dio _dio = ApiClient.instance.dio;

  /// LOGIN
  Future<Response> login(LoginRequest request) async {
    return await _dio.post(ApiConstants.login, data: request.toJson());
  }
}
