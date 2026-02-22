import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class ApiClient {
  static final ApiClient instance = ApiClient._internal();

  late final Dio dio;

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }
}
