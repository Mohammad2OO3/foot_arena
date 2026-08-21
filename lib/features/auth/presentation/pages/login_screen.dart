import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
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
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGradient(),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  const LoginLogo(),
                  const SizedBox(height: 20),
                  const LoginTitle(),
                  const SizedBox(height: 100),

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

                    onSubmit: _handleAuth,
                  ),

                  const SizedBox(height: 112),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleAuth() {
    final isLogin = _tabController.index == 0;

    if (isLogin) {
      _login();
    } else {
      _signup();
    }
  }

  void _login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _error('Please fill email & password');
      return;
    }

    // ✅ بدل pushAndRemoveUntil
    context.go('/home');
  }

  void _signup() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirm = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirm.isEmpty) {
      _error('Please fill all fields');
      return;
    }

    if (password != confirm) {
      _error('Passwords do not match');
      return;
    }


    context.push('/complete_profile');
  }

  void _error(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
      ),
    );
  }
}