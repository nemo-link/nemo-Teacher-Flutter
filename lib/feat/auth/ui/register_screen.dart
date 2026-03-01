import 'package:flutter/material.dart';
import 'package:nemo_teacher/feat/auth/presentation/register_viewmodel.dart';
import 'package:nemo_teacher/feat/auth/ui/login_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/theme/app_colors.dart';
import '../../../core/ui/widgets/gradient_background.dart';
import '../../../core/ui/widgets/nemo_button.dart';
import '../../../core/ui/widgets/nemo_card.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final accountController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  String? _message;

  Future<void> _register() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    setState(() {
      _isLoading = true;
      _message = null;
    });

    final vm = context.read<RegisterViewmodel>();

    try {
      await vm.register(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        phone: phoneController.text.trim(),
        name: nameController.text.trim(),
        accountName: accountController.text.trim().isEmpty
            ? null
            : accountController.text.trim(),
      );
    } catch (e) {
      setState(() {
        _message = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterViewmodel>(
      builder: (context, vm, _) {
        if (vm.registerSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            vm.resetSuccess();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          });
        }

        return Scaffold(
          appBar: AppBar(),
          body: GradientBackground(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NemoCard(
                    padding: const EdgeInsets.all(22),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(labelText: '이름'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '이름을 입력해주세요.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(labelText: '이메일'),
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
                              if (value == null || value.length < 8) {
                                return '8자 이상 입력해주세요.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: '휴대폰 번호',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '휴대폰 번호를 입력해주세요.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: accountController,
                            decoration: const InputDecoration(
                              labelText: '계정 이름 (선택)',
                            ),
                          ),
                          if (_message != null) ...[
                            const SizedBox(height: 12),
                            Text(
                              _message!,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.muted),
                            ),
                          ],
                          const SizedBox(height: 20),
                          NemoButton(
                            label: '가입 완료',
                            onPressed: _isLoading ? null : _register,
                            isLoading: _isLoading,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    accountController.dispose();
    super.dispose();
  }
}
