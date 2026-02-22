class ApiConstants {
  static const String baseUrl = String.fromEnvironment(
    'NEMO_BASE_URL',
    defaultValue: 'http://10.0.2.2:3001',
    //  defaultValue: 'http://localhost:3001',
  );

  // AUTH
  static const String login = '/auth/login';
}
