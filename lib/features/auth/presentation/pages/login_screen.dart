import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/common/extensions/extensions.dart';
import 'package:footarena/core/di/injection.dart';
import 'package:footarena/features/auth/domain/use_cases/login_usecase.dart';
import 'package:footarena/features/auth/presentation/pages/CompleteProfileScreen.dart';
import 'package:footarena/router/app_router.dart';

import '../bloc/auth_bloc.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  late final AuthBloc autBloc;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
    autBloc = getIt<AuthBloc>();
  }

  @override
  void dispose() {
    _tabController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // إخفاء شريط النظام الأبيض واستبداله بتصميم شفاف بالكامل
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

    return Form(
      key: _globalKey,
      child: Container(
        // وضع خلفية الـ Gradient على مستوى الـ Container الأساسي للغطاء الكامل
        decoration: const BoxDecoration(
          color: Color(0xFF0C100E), // لون خلفية حمايتي لو كان الـ Gradient غير كامل
        ),
        child: Stack(
          children: [
            const Positioned.fill(
              child: BackgroundGradient(),
            ),
            Scaffold(
              backgroundColor: Colors.transparent, // لجعل الـ Scaffold يتشرب خلفية الـ Container
              body: BlocListener<AuthBloc, AuthState>(
                bloc: autBloc,
                listener: (context, state) {
                  state.loginData.listenerFunction(
                    onSuccess: () {
                      context.pushNamedAndRemoveUntil('home', (p0) => false);
                    },
                  );
                },
                child: SafeArea(
                  bottom: false, // إلغاء اقتطاع الجزء السفلي لمنع ظهور اللون الأبيض
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        const LoginLogo(),
                        const SizedBox(height: 20),
                        const LoginTitle(),
                        const SizedBox(height: 40),

                        AuthGlassCard(
                          tabController: _tabController,
                          emailController: emailController,
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                          obscurePassword: obscurePassword,
                          obscureConfirmPassword: obscureConfirmPassword,
                          onTogglePassword: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          onToggleConfirmPassword: () {
                            setState(() {
                              obscureConfirmPassword = !obscureConfirmPassword;
                            });
                          },
                          authBloc: autBloc,
                          onTap: () {
                            if (!(_globalKey.currentState?.validate() ?? false)) return;

                            if (_tabController.index == 0) {
                              autBloc.add(
                                LoginEvent(
                                  params: LoginParams(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                            } else {
                              context.pushNamed(
                                RouteName.completeProfile,
                                arguments: CompleteProfileParams(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  confirmPassword: confirmPasswordController.text,
                                  authBloc: autBloc,
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _error(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
    );
  }
}