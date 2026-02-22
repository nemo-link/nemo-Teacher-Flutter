import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/theme/app_colors.dart';
import '../../../core/ui/widgets/gradient_background.dart';
import '../../../core/ui/widgets/nemo_button.dart';
import '../../../core/ui/widgets/nemo_card.dart';
import '../../home/ui/home_screen.dart';
import '../presentation/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Consumer<LoginViewModel>(
      builder: (context, vm, _) {
        /// 로그인 성공 시 홈 이동
        if (vm.loginSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            vm.resetSuccess();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            );
          });
        }

        return Scaffold(
          body: GradientBackground(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceAlt,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        '로그인',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.accent,
                            ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'nemoTeacher',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      '선생님의 하루를 더 가볍게',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: AppColors.muted),
                    ),

                    const SizedBox(height: 32),

                    NemoCard(
                      padding: const EdgeInsets.all(22),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: '이메일',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '이메일을 입력해주세요.';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 16),

                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: '비밀번호',
                              ),
                              validator: (value) {
                                if (value == null || value.length < 4) {
                                  return '비밀번호를 입력해주세요.';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 12),

                            if (vm.errorMessage != null)
                              Text(
                                vm.errorMessage!,
                                style: const TextStyle(color: Colors.redAccent),
                              ),

                            const SizedBox(height: 20),

                            NemoButton(
                              label: '로그인',
                              isLoading: vm.isLoading,
                              onPressed: vm.isLoading
                                  ? null
                                  : () {
                                      final isValid =
                                          formKey.currentState?.validate() ??
                                          false;
                                      if (!isValid) return;

                                      context.read<LoginViewModel>().login(
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
                                      );
                                    },
                            ),

                            const SizedBox(height: 12),

                            NemoButton(
                              label: '새 계정 만들기',
                              onPressed: () {},
                              variant: NemoButtonVariant.ghost,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Center(
                      child: Text(
                        "서버 주소: ${const String.fromEnvironment('NEMO_API_BASE_URL', defaultValue: 'http://10.0.2.2:3001')}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
