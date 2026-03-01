class RegisterResponse {
  final String accessToken;

  RegisterResponse({
    required this.accessToken
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      accessToken: json['accessToken'] ?? '',
    );
  }
}
