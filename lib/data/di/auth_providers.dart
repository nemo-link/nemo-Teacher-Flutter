import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/repo/auth_repository.dart';
import '../../feat/auth/presentation/login_viewmodel.dart';
import '../dataSource/local/token_dataStore.dart';
import '../dataSource/remote/auth_remote_datasource.dart';

class AuthProviders extends StatelessWidget {
  final Widget child;

  const AuthProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final remote = AuthRemoteDataSource();
    final tokenDataStore = TokenDataStore();

    final repository = AuthRepository(remote, tokenDataStore);

    return MultiProvider(
      providers: [
        Provider<AuthRemoteDataSource>.value(value: remote),
        Provider<AuthRepository>.value(value: repository),
        ChangeNotifierProvider<LoginViewModel>(
          create: (_) => LoginViewModel(repository),
        ),
      ],
      child: child,
    );
  }
}
