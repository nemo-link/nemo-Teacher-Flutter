import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/constants/storage_keys.dart';

class TokenDataStore {
  final _storage = FlutterSecureStorage();

  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: StorageKeys.accessToken, value: token);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: StorageKeys.accessToken);
  }

  Future<void> clear() async {
    await _storage.delete(key: StorageKeys.accessToken);
  }
}
