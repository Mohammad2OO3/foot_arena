// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:evowash_user_flutter_app/common/extensions/extensions.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../../helper/src/locale_keys.dart';
//
// Future<void> GetAweomeDialog({
//   required BuildContext context,
//   required Function() fun,
//   required String sucMessage,
// }) async {
//   await AwesomeDialog(
//     context: context,
//     animType: AnimType.leftSlide,
//     headerAnimationLoop: true,
//     dialogType: DialogType.success,
//     showCloseIcon: true,
//     title: sucMessage,
//     titleTextStyle: context.headlineMedium(),
//     btnOkOnPress: () {
//       debugPrint('OnClick');
//     },
//     btnOkIcon: Icons.check_circle,
//     btnOkColor: context.primarySwatch,
//     onDismissCallback: (type) {
//       debugPrint('Dialog Dismissed from callback $type');
//     },
//     btnOkText: LocaleKeys.profileSave.tr()
//   ).show();
//
//   // Call `fun` after dialog is closed
//   fun();
// }
