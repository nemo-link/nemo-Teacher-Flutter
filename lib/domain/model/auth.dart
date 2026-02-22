import 'package:nemo_teacher/domain/model/user.dart';

class Auth {
  final String accessToken;
  final int defaultAccountId;
  final List<User> accounts;

  Auth({
    required this.accessToken,
    required this.defaultAccountId,
    required this.accounts,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
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
