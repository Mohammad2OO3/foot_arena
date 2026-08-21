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
    this.onChanged,
    this.labelText,
    this.fillColor,
    this.suffixIcon,
  });
  final bool enabled;
  final bool isPassword;
  final int maxLines;
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

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: showPassword,
        builder: (context, showPassowrdValue, _) {
          return TextFormField(
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            maxLines: maxLines,
            enabled: enabled,
            cursorColor: context.primaryColor,
            keyboardType:
                isPassword ? TextInputType.visiblePassword : keyboardType,
            obscureText: isPassword ? !showPassowrdValue : false,
            style: context.textTheme.labelMedium?.copyWith(fontSize: 14),
            decoration: inputDecorationBordered.copyWith(
              constraints: BoxConstraints(
                maxHeight: double.infinity,
                minHeight: 0.0,
                maxWidth: width ?? context.width * .9,
                minWidth: width ?? context.width * .9,
              ),
              contentPadding: const EdgeInsets.all(PPadding.mainPadding * 1.5),
              fillColor:
                  fillColor ?? context.scaffoldBackgroundColor.withOpacity(.6),
              filled: true,
              hintText: hintText,
              hintStyle: context.textTheme.labelMedium?.copyWith(
                color: PColors.grey,
                fontSize: 14,
              ),
              labelStyle: context.textTheme.labelMedium?.copyWith(
                color: PColors.grey,
                fontSize: 14,
              ),
              labelText: labelText,
              suffixIcon: suffixIcon ??
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
                                  Icons.remove_red_eye,
                                  size: 20,
                                  color: showPassowrdValue
                                      ? context.primaryColor
                                      : Colors.grey.shade300,
                                ),
                              ),
                            ),
                          ],
                        )
                      : null),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 45,
              ),
            ),
          );
        });
  }
}
