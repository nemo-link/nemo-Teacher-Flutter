class User {
  final int accountId;
  final String accountName;
  final String accountType;
  final String role;

  User({
    required this.accountId,
    required this.accountName,
    required this.accountType,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      accountId: json['accountId'] ?? 0,
      accountName: json['accountName'] ?? '',
      accountType: json['accountType'] ?? '',
      role: json['role'] ?? '',
    );
  }
}
