import 'package:flutter/material.dart';
import '../../../../common/design/src/theme/const.dart';
import '../../../../common/extensions/src/context_extensions.dart';

class ChatTextFiled extends StatelessWidget {
  ChatTextFiled({
    super.key,
    this.hintText,
    this.textInputAction,
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
    this.onSubmitted,
    this.suffixIcon,
    this.suffix,
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
  final Widget? suffix;
  final Widget? prefixIcon;
  final bool? isPadding;
  final FocusNode? focus;
  final bool? isNumber;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final baseDecoration = const InputDecoration().applyDefaults(
      Theme.of(context).inputDecorationTheme,
    );

    return ValueListenableBuilder<bool>(
      valueListenable: showPassword,
      builder: (context, showPasswordValue, _) {
        return SizedBox(
          width: width ?? double.infinity,
          height: height,
          child: TextFormField(
            controller: controller,
            focusNode: focus,
            enabled: enabled,
            validator: validator,
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            textInputAction: textInputAction,
            keyboardType: isPassword
                ? TextInputType.visiblePassword
                : keyboardType,
            textDirection: isNumber == true ? TextDirection.ltr : null,
            obscureText: isPassword ? !showPasswordValue : false,
            maxLines: maxLines,
            minLines: minLines,
            cursorColor: context.primarySwatch,
            textAlignVertical: TextAlignVertical.center,
            style: context.bodySmall(
              color: context.themeExt.palette.black,
              fontSize: 16,
            ),
            decoration: baseDecoration.copyWith(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              suffix: suffix,
              filled: true,
              fillColor: fillColor,
              hintText: hintText,
              labelText: labelText,
              errorStyle: const TextStyle(fontSize: 0),
              errorMaxLines: 1,
              labelStyle: context.bodySmall(
                fontSize: 16,
                color: context.textFieldHintColor,
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
              suffixIcon: suffixIcon ??
                  (isPassword
                      ? GestureDetector(
                    onTap: () {
                      showPassword.value = !showPasswordValue;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        showPasswordValue
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  )
                      : null),
            ),
          ),
        );
      },
    );
  }
}
