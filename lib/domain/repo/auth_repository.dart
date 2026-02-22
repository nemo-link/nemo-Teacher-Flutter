import '../../core/network/base_response.dart';
import '../../core/remote/request/login_request.dart';
import '../../data/dataSource/local/token_dataStore.dart';
import '../../data/dataSource/remote/auth_remote_datasource.dart';
import '../model/auth.dart';

class AuthRepository {
  final AuthRemoteDataSource _remote;
  final TokenDataStore _tokenDataStore;

  AuthRepository(this._remote, this._tokenDataStore);

  Future<Auth> login(String email, String password) async {
    final response = await _remote.login(
      LoginRequest(email: email, password: password),
    );

    final result = BaseResponse<Auth>.fromJson(response.data, Auth.fromJson);

    result.ensureSuccess();

    final authData = result.data!;

    /// 토큰 저장
    await _tokenDataStore.saveAccessToken(authData.accessToken);

    return authData;
  }
}
