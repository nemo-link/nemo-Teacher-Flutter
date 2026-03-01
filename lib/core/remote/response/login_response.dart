import 'package:nemo_teacher/domain/model/user.dart';

class LoginResponse {
  final String accessToken;
  final int defaultAccountId;
  final List<User> accounts;

  LoginResponse({
    required this.accessToken,
    required this.defaultAccountId,
    required this.accounts,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'] ?? '',
      defaultAccountId: json['defaultAccountId'] ?? 0,
      accounts:
          (json['accounts'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e))
              .toList() ??
          [],
    );
  }
}
