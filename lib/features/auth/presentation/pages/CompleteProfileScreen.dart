import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
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

  String position = 'Striker';

  final positions = [
    'Striker',
    'Midfielder',
    'Defender',
    'Goalkeeper',
    'Winger',
  ];

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

  void _submitProfile() {
    // هنا لاحقًا تربط API أو Bloc

    // بعد الحفظ انتقل للصفحة الرئيسية
    context.go('/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // إضافة زر الرجوع هنا
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new, // أيقونة رجوع عصرية ومتناسقة
            color: Colors.white,      // لون يتناسب مع الثيم الداكن للتطبيق
          ),
          onPressed: () {
            // التحقق أولاً إذا كان هناك صفحة سابقة للرجوع إليها
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
      ),
      body: ProfileHeader(
        child: Column(
          children: [
            Expanded(
              child: ProfileGlassCard(
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
            ),

          ],
        ),
      ),
    );
  }
}