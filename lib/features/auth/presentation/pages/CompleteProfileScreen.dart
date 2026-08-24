import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/common/extensions/extensions.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/widgets.dart';

class CompleteProfileScreen extends StatefulWidget {
  final CompleteProfileParams args;

  const CompleteProfileScreen({super.key, required this.args});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final yearsPlayedController = TextEditingController();
  final ratingController = TextEditingController();
  late final AuthBloc authBloc;

  String position = 'Striker';

  final positions = [
    'Striker',
    'Midfielder',
    'Defender',
    'Goalkeeper',
    'Winger',
  ];
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    authBloc = widget.args.authBloc;
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    yearsPlayedController.dispose();
    ratingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // إضافة زر الرجوع هنا
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new, // أيقونة رجوع عصرية ومتناسقة
              color: Colors.white, // لون يتناسب مع الثيم الداكن للتطبيق
            ),
            onPressed: () {
              // التحقق أولاً إذا كان هناك صفحة سابقة للرجوع إليها
              // if (context.canPop()) {
              context.pop();
              // }
            },
          ),
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.signData.listenerFunction(
              onSuccess: () {
                context.pushNamedAndRemoveUntil('home', (p0) => false);
              },
            );
          },
          bloc: authBloc,
          child: ProfileHeader(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProfileGlassCard(
                          authBloc: authBloc,
                          confirmPassword: widget.args.confirmPassword,
                          email: widget.args.email,
                          password: widget.args.password,
                          globalKey: _globalKey,

                          firstNameController: firstNameController,
                          lastNameController: lastNameController,
                          phoneController: phoneController,
                          ageController: ageController,
                          heightController: heightController,
                          weightController: weightController,
                          yearsPlayedController: yearsPlayedController,
                          ratingController: ratingController,
                          position: position,
                          positions: positions,
                          onPositionChanged: (val) {
                            setState(() => position = val);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompleteProfileParams {
  final String email;
  final String password;
  final String confirmPassword;
  final AuthBloc authBloc;

  CompleteProfileParams({
    required this.email,
    required this.confirmPassword,
    required this.password,
    required this.authBloc,
  });
}
