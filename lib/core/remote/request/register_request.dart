class RegisterRequest {
  final String email;
  final String password;
  final String phone;
  final String name;
  final String? accountName;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.phone,
    required this.name,
    this.accountName
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'phone': phone,
      'name': name,
      'accountName': accountName,
    };
  }
}
