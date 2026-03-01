import '../../core/remote/response/login_response.dart';
import '../../data/dataSource/local/token_dataStore.dart';
import '../repo/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repo;
  final TokenDataStore _tokenLocal;

  LoginUseCase(this._repo, this._tokenLocal);

  Future<LoginResponse> call(String email, String password) async {
    final authData = await _repo.login(email, password);

    await _tokenLocal.saveAccessToken(authData.accessToken);
    return authData;
  }
}
