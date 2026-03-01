import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../core/network/api_client.dart';
import '../../domain/repo/auth_repository.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../feat/auth/presentation/login_viewmodel.dart';
import '../../feat/auth/presentation/register_viewmodel.dart';
import '../dataSource/local/token_dataStore.dart';
import '../dataSource/remote/auth_remote_datasource.dart';

class AuthProviders extends StatelessWidget {
  final Widget child;

  const AuthProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 1) ApiClient
        Provider<ApiClient>(create: (_) => ApiClient()),

        // 2) Remote DS (ApiClient 의존)
        ProxyProvider<ApiClient, AuthRemoteDataSource>(
          update: (_, apiClient, __) => AuthRemoteDataSource(apiClient),
        ),

        // 3) TokenDataStore (한 번만)
        Provider<TokenDataStore>(create: (_) => TokenDataStore()),

        // 4) AuthRepository 등록 (Remote DS 의존)
        ProxyProvider<AuthRemoteDataSource, AuthRepository>(
          update: (_, remote, __) => AuthRepository(remote),
        ),

        // 5) LoginUseCase (Repo + TokenDataStore 의존)
        ProxyProvider2<AuthRepository, TokenDataStore, LoginUseCase>(
          update: (_, repo, tokenStore, __) => LoginUseCase(repo, tokenStore),
        ),

        // 6) LoginViewModel (LoginUseCase 의존)
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(context.read<LoginUseCase>()),
        ),
        ChangeNotifierProvider<RegisterViewmodel>(
          create: (context) => RegisterViewmodel(context.read<AuthRepository>()),
        ),
      ],
      child: child,
    );
  }
}
