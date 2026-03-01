import 'package:nemo_teacher/core/remote/response/register_response.dart';

import '../repo/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repo;

  RegisterUseCase(this._repo);

  Future<RegisterResponse> call(
    String email,
    String password,
    String phone,
    String name,
    String accountName,
  ) async {
    final registerData = await _repo.register(
      email,
      password,
      phone,
      name,
      accountName,
    );

    return registerData;
  }
}
