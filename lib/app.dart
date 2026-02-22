import 'package:flutter/material.dart';
import 'package:nemo_teacher/data/di/auth_providers.dart';
import 'package:nemo_teacher/feat/auth/ui/login_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthProviders(
      child: MaterialApp(title: 'Nemo Teacher', home: const LoginScreen()),
    );
  }
}
