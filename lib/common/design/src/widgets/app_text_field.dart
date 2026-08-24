import 'package:flutter/material.dart';

import '../../../extensions/src/context_extensions.dart';
import '../../design.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    this.hintText,
    this.isPassword = false,
    this.enabled = true,
    this.controller,
    this.validator,
    this.width,
    this.height,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines = 1,
    this.onChanged,
    this.labelText,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.isPadding = true,
    this.focus,
  });

  final bool enabled;
  final bool isPassword;
  final int maxLines;
  final int minLines;
  final String? hintText;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final String? Function(String? text)? validator;
  final TextInputType keyboardType;
  final ValueNotifier<bool> showPassword = ValueNotifier(false);
  final Function(String text)? onChanged;
  final String? labelText;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isPadding;
  final FocusNode? focus;

  @override
  Widget build(BuildContext context) {
    final baseDecoration = const InputDecoration().applyDefaults(
      Theme.of(context).inputDecorationTheme,
    );
    return ValueListenableBuilder<bool>(
      valueListenable: showPassword,
      builder: (context, showPassowrdValue, _) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: isPadding == true ? context.height * .02 : 0,
            vertical: isPadding == true ? context.width * .04 : 0,
          ),
          width: double.infinity,
          child: TextFormField(
            focusNode: focus == null ? focus : null,
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            maxLines: maxLines,
            minLines: minLines,
            enabled: enabled,
            cursorColor: context.primarySwatch,
            keyboardType: isPassword
                ? TextInputType.visiblePassword
                : keyboardType,
            obscureText: isPassword ? !showPassowrdValue : false,
            style: context.labelMedium(
              color: context.themeExt.palette.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            decoration: baseDecoration.copyWith(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: context.primarySwatch),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: context.primarySwatch),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(width: 2, color: context.primarySwatch),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.primarySwatch),
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding: const EdgeInsets.all(PPadding.mainPadding * 1.5),
              fillColor: fillColor ?? Colors.white,
              filled: true,
              hintText: hintText,
              hintStyle: context.labelMedium(
                color: context.primarySwatch,
                fontSize: 14,
              ),
              labelStyle: context.labelMedium(
                color: context.primarySwatch,
                fontSize: 14,
              ),
              labelText: labelText,
              prefixIcon: prefixIcon == null
                  ? null
                  : SizedBox(
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(PPadding.mainPadding),
                        child: prefixIcon,
                      ),
                    ),
              suffixIcon:
                  suffixIcon ??
                  (isPassword
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Space.hS2,
                            GestureDetector(
                              onTap: () =>
                                  showPassword.value = !showPassowrdValue,
                              child: SizedBox(
                                width: 65,
                                height: 25,
                                child: Icon(
                                  Icons.remove_red_eye,
                                  size: 20,
                                  color: showPassowrdValue
                                      ? context.primarySwatch
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        )
                      : null),
              suffixIconConstraints: const BoxConstraints(minWidth: 45),
            ),
          ),
        );
      },
    );
  }
}

// class MyAppTextField extends StatelessWidget {
//   MyAppTextField({
//     super.key,
//     this.hintText,
//     this.textInputAction,
//     this.isPassword = false,
//     this.enabled = true,
//     this.controller,
//     this.validator,
//     this.width,
//     this.height,
//     this.keyboardType = TextInputType.text,
//     this.maxLines = 1,
//     this.minLines = 1,
//     this.onChanged,
//     this.labelText,
//     this.fillColor,
//     this.onSubmitted,
//     this.suffixIcon,
//     this.suffix,
//     this.prefixIcon,
//     this.isPadding = true,
//     this.focus,
//     this.isNumber = false,
//   });
//
//   final bool enabled;
//   final bool isPassword;
//   final int maxLines;
//   final int minLines;
//   final String? hintText;
//   final double? width;
//   final double? height;
//   final TextEditingController? controller;
//   final String? Function(String? text)? validator;
//   final TextInputType keyboardType;
//   final ValueNotifier<bool> showPassword = ValueNotifier(false);
//   final Function(String text)? onChanged;
//   final String? labelText;
//   final Color? fillColor;
//   final Widget? suffixIcon;
//   final Widget? suffix;
//   final Widget? prefixIcon;
//   final bool? isPadding;
//   final FocusNode? focus;
//   final bool? isNumber;
//   final TextInputAction? textInputAction;
//   final void Function(String)? onSubmitted;
//
//   @override
//   Widget build(BuildContext context) {
//     final baseDecoration = const InputDecoration().applyDefaults(
//       Theme.of(context).inputDecorationTheme,
//     );
//     return ValueListenableBuilder<bool>(
//       valueListenable: showPassword,
//       builder: (context, showPassowrdValue, _) {
//         return Container(
//           margin: EdgeInsets.symmetric(
//          //   horizontal: isPadding == true ? context.height * .02 : 0,
//             vertical: isPadding == true ? context.width * .02 : 0,
//           ),
//           width: double.infinity,
//           child: TextFormField(
//
//             textInputAction:textInputAction ,
//
//             textDirection: isNumber == true ? TextDirection.ltr : null,
//             focusNode: focus,
//             onFieldSubmitted: onSubmitted,
//
//             controller: controller,
//             onChanged: onChanged,
//             validator: validator,
//             maxLines: maxLines,
//             minLines: minLines,
//             enabled: enabled,
//
//             cursorColor: context.primarySwatch,
//             keyboardType: isPassword
//                 ? TextInputType.visiblePassword
//                 : keyboardType,
//             obscureText: isPassword ? !showPassowrdValue : false,
//             style: context.headlineSmall(
//               color: context.themeExt.palette.black,
//               fontSize: 16,
//             ),
//             decoration: baseDecoration.copyWith(
//
//               suffix: suffix,
//               errorBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: context.errorColor),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               errorStyle: context.headlineSmall(
//                 fontSize: 10,
//                 fontWeight: FontWeight.w500,
//                 color: context.errorColor,
//               ),
//
//               contentPadding: const EdgeInsets.all(PPadding.mainPadding * 1.5),
//               fillColor: fillColor ?? Colors.white,
//               filled: true,
//               hintText: hintText,
//
//               hintStyle: context.headlineSmall(
//                 color: context.textFieldHintColor,
//                 fontSize: 16,
//
//               ),
//
//               labelText: labelText,
//               labelStyle: context.headlineSmall(fontSize: 16, color: context.textFieldHintColor,),
//               floatingLabelStyle: context.headlineSmall(
//                 color: context.primarySwatch  ,
//                 fontSize: 11,
//               ),
//
//
//               prefixIcon: prefixIcon == null
//                   ? null
//                   : SizedBox(
//                       width: 50,
//                       child: Padding(
//                         padding: const EdgeInsets.all(PPadding.mainPadding),
//                         child: prefixIcon,
//                       ),
//                     ),
//               suffixIcon:
//                   suffixIcon ??
//                   (isPassword
//                       ? Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Space.hS2,
//                             GestureDetector(
//                               onTap: () {
//                                 showPassword.value = !showPassowrdValue;
//                               },
//                               child: SizedBox(
//                                     height: 25,
//                                 child: showPassowrdValue
//                                     ? SvgAsset(
//                                  Assets.images.svg.visibaleEyeIcon,
//                                   height: 25,
//                                 )
//                                     :
//                                 SvgAsset(
//                                 Assets.images.svg.unvisibaleEyeIcon,
//                                 height: 25,
//
//                               )
//                                 ,
//                               ),
//                             ),
//                           ],
//                         )
//                       : null),
//               suffixIconConstraints: const BoxConstraints(minWidth: 45),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class MyAppErrorTextField extends
StatelessWidget {
  MyAppErrorTextField({
    super.key,
    this.hintText,
    this.isPassword = false,
    this.enabled = true,
    this.controller,
    this.validator,
    this.width,
    this.height,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines = 1,
    this.onChanged,
    this.labelText,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.isPadding = true,
    this.focus,
    this.isNumber = false,
  });

  final bool enabled;
  final bool isPassword;
  final int maxLines;
  final int minLines;
  final String? hintText;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final String? Function(String? text)? validator;
  final TextInputType keyboardType;
  final ValueNotifier<bool> showPassword = ValueNotifier(false);
  final Function(String text)? onChanged;
  final String? labelText;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isPadding;
  final FocusNode? focus;
  final bool? isNumber;

  @override
  Widget build(BuildContext context) {
    final baseDecoration = const InputDecoration().applyDefaults(
      Theme.of(context).inputDecorationTheme,
    );
    return ValueListenableBuilder<bool>(
      valueListenable: showPassword,
      builder: (context, showPassowrdValue, _) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: isPadding == true ? context.height * .02 : 0,
            vertical: isPadding == true ? context.width * .04 : 0,
          ),
          width: double.infinity,
          child: TextFormField(
            textDirection: isNumber == true ? TextDirection.ltr : null,
            focusNode: focus == null ? focus : null,
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            maxLines: maxLines,
            minLines: minLines,
            enabled: enabled,

            cursorColor: context.primarySwatch,
            keyboardType: isPassword
                ? TextInputType.visiblePassword
                : keyboardType,
            obscureText: isPassword ? !showPassowrdValue : false,
            style: context.labelSmall(
              color: context.themeExt.palette.black,
              fontSize: 16,
            ),
            decoration: baseDecoration.copyWith(
              isDense: true,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.errorColor),
                borderRadius: BorderRadius.circular(16),
              ),
              errorStyle: TextStyle(
                height: 0,
                fontSize: 0,
                color: Colors.transparent,
              ),
              contentPadding: const EdgeInsets.all(PPadding.mainPadding * 1.5),
              fillColor: fillColor ?? Colors.white,
              filled: true,
              hintText: hintText,
              hintStyle: context.labelMedium(
                color: context.textFieldHintColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),

              labelText: labelText,
              labelStyle: context.bodyMedium(fontSize: 16),

              floatingLabelStyle: context.bodySmall(
                color: context.primarySwatch,
                fontSize: 11,
              ),

              prefixIcon: prefixIcon == null
                  ? null
                  : SizedBox(
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(PPadding.mainPadding),
                        child: prefixIcon,
                      ),
                    ),
              suffixIcon:
                  suffixIcon ??
                  (isPassword
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Space.hS2,
                            GestureDetector(
                              onTap: () {
                                showPassword.value = !showPassowrdValue;
                              },
                              child: SizedBox(
                                width: 65,
                                height: 25,
                                child: Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 25,
                                  color: showPassowrdValue
                                      ? context.primarySwatch
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        )
                      : null),
              suffixIconConstraints: const BoxConstraints(minWidth: 45),
            ),
          ),
        );
      },
    );
  }
}





class MyAppErrorBirthDropdownField extends
StatelessWidget {
  const MyAppErrorBirthDropdownField({
    super.key,
    required this.controller,
    this.labelText,
    this.validator,
    this.onChanged,
    this.fillColor,
    this.prefixIcon,
    this.maxLength,
    this.suffixIcon,
    this.isPadding = true,
    this.focusNode ,
    this.onSubmitted ,
    required this.errorNotifier, // ✅ 1. أضف الـ ValueNotifier هنا
  });

  final TextEditingController controller;
  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isPadding;
  final ValueNotifier<bool> errorNotifier;
  final int ? maxLength;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;

  // ✅

  @override
  Widget build(BuildContext context) {
    final baseDecoration = const InputDecoration().applyDefaults(
      Theme.of(context).inputDecorationTheme,
    );

    return ValueListenableBuilder<bool>(
      valueListenable: errorNotifier,
      builder: (context, hasError, _) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: isPadding == true ? context.height * .02 : 0,
            vertical: isPadding == true ? context.width * .04 : 0,
          ),
          width: double.infinity,
          child: TextFormField(
            maxLength: maxLength,
            focusNode: focusNode,
            buildCounter: (
                BuildContext context, {
                  required int currentLength,
                  required bool isFocused,
                  required int? maxLength,
                }) {
              return null; // ✅ يخفي العداد
            },
            onFieldSubmitted:onSubmitted ,

            keyboardType: TextInputType.number,
            validator: (value) {
              final result = validator?.call(value);
              errorNotifier.value = result != null;
              return result;
            },
            controller: controller,
            decoration: baseDecoration.copyWith(
              isDense: true,
              errorStyle: const TextStyle(
                height: 0,
                fontSize: 0,
                color: Colors.transparent,
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.errorColor),
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding: const EdgeInsets.all(
                PPadding.mainPadding * 1.5,
              ),
              fillColor: fillColor ?? Colors.white,
              filled: true,
              labelText: labelText,
              labelStyle: context.headlineSmall(
                fontSize: 16,
                color: hasError ? context.errorColor : context.grey,
              ),
              floatingLabelStyle: context.headlineSmall(
                color:hasError ? context.errorColor : context.primarySwatch,
                fontSize: 11,
              ),
              prefixIcon: prefixIcon == null
                  ? null
                  : SizedBox(
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.all(PPadding.mainPadding),
                  child: prefixIcon,
                ),
              ),
              suffixIcon: suffixIcon,
              suffixIconConstraints: const BoxConstraints(minWidth: 45),
            ),
          ),
        );
      },
    );
  }
}



class MyAppSearchField extends StatelessWidget {
  MyAppSearchField({
    super.key,
    this.hintText,
    this.isPassword = false,
    this.enabled = true,
    this.controller,
    this.validator,
    this.width,
    this.height,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines = 1,
    this.onChanged,
    this.labelText,
    this.fillColor,
    this.suffixIcon,
    this.prefix,
    this.sufix,
    this.prefixIcon,

    this.isPadding = true,
    this.focus,
  });

  final bool enabled;
  final bool isPassword;

  final int maxLines;
  final int minLines;
  final String? hintText;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final String? Function(String? text)? validator;
  final TextInputType keyboardType;
  final ValueNotifier<bool> showPassword = ValueNotifier(false);
  final Function(String text)? onChanged;
  final String? labelText;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? sufix;
  final Widget? prefixIcon;
  final bool? isPadding;
  final FocusNode? focus;

  @override
  Widget build(BuildContext context) {
    final baseDecoration = const InputDecoration().applyDefaults(
      Theme.of(context).inputDecorationTheme,
    );
    return ValueListenableBuilder<bool>(
      valueListenable: showPassword,
      builder: (context, showPassowrdValue, _) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: isPadding == true ? context.height * .02 : 0,
            vertical: isPadding == true ? context.width * .04 : 0,
          ),
          width: double.infinity,

          child: TextFormField(

            focusNode: focus == null ? focus : null,
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            maxLines: maxLines,
            minLines: minLines,
            enabled: enabled,
            cursorColor: context.primarySwatch,
            keyboardType:
            isPassword ? TextInputType.visiblePassword : keyboardType,
            obscureText: isPassword ? !showPassowrdValue : false,
            style: context.headlineSmall(
                color: context.themeExt.palette.black,
                fontSize: 16,

            ),
            decoration:   baseDecoration.copyWith(
            isDense: true,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.errorColor),
              borderRadius: BorderRadius.circular(16),
            ),
            errorStyle: TextStyle(
              height: 0,
              fontSize: 0,
              color: Colors.transparent,
            ),
            contentPadding: const EdgeInsets.all(PPadding.mainPadding * 1.5),
            fillColor: fillColor ?? Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: context.headlineSmall(
              color: context.textFieldHintColor,
              fontSize: 16,

            ),

            labelText: labelText,
            labelStyle: context.headlineSmall(fontSize: 16),

            floatingLabelStyle: context.bodySmall(
              color: context.primarySwatch,
              fontSize: 11,
            ),

            prefixIcon: prefixIcon == null
                ? null
                : SizedBox(
              width: 50,
              child: Padding(
                padding: const EdgeInsets.all(PPadding.mainPadding),
                child: prefixIcon,
              ),
            ),
            suffixIcon:
            suffixIcon ??
                (isPassword
                    ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Space.hS2,
                    GestureDetector(
                      onTap: () {
                        showPassword.value = !showPassowrdValue;
                      },
                      child: SizedBox(
                        width: 65,
                        height: 25,
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          size: 25,
                          color: showPassowrdValue
                              ? context.primarySwatch
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                )
                    : null),
            suffixIconConstraints: const BoxConstraints(minWidth: 45),
          ),
          ),
        );
      },
    );
  }
}



