import '../../helper/src/locale_keys.dart';

extension Validator on String? {
  String? get isValidEmail {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regExp = RegExp(pattern);
    if (this == null || this!.isEmpty) {
      return LocaleKeys.validationRequiredfield.tr();
    } else if (!regExp.hasMatch(this!)) {
      return LocaleKeys.validationInvalidemailaddress.tr();
    }
    return null;
  }

  bool _isPasswordStrong(String password) {
    bool hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowerCase = password.contains(RegExp(r'[a-z]'));
    bool hasDigits = password.contains(RegExp(r'\d'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinimumLength = password.length >= 8;

    return hasUpperCase &&
        hasLowerCase &&
        hasDigits &&
        hasSpecialCharacters &&
        hasMinimumLength;
  }

  String? get validatePassword {
    if (this == null || this!.isEmpty) {
      return LocaleKeys.validationPasswordtooshort.tr();
    } else if (!_isPasswordStrong(this!)) {
      return LocaleKeys.validationPasswordnotstrong.tr();
    }
    return null;
  }

  String? get isNotShortText {
    return (this == null || this!.isEmpty)
        ? LocaleKeys.validationRequiredfield.tr()
        : (this!.length < 4)
            ? LocaleKeys.validationFieldtooshort.tr()
            : null;
  }

  String? isConfirmPassword(String password) {
    return (this == null || this!.isEmpty)
        ? LocaleKeys.validationRequiredfield.tr()
        : (this != password)
            ? LocaleKeys.validationPasswordsdonotmatch.tr()
            : null;
  }

  // bool get isValidPhone {
  //   return RegExp(
  //     r'^((\+|00)963|0)9\d{8}$',
  //     caseSensitive: false,
  //     multiLine: false,
  //   ).hasMatch(this);
  // }

  // bool get isValidPassword {
  //   return RegExp(
  //     r'[a-z0-9]{8,}',
  //     caseSensitive: false,
  //     multiLine: false,
  //   ).hasMatch(this);
  // }

  // bool get isValidWebsite {
  //   return RegExp(
  //     r"^(((https:\/\/)|(http:\/\/)){1})?(w{3}\.)?([a-z0-9])(.[a-z0-9]{1,})",
  //     caseSensitive: false,
  //     multiLine: false,
  //   ).hasMatch(this);
  // }

  // bool get isValidFacebook {
  //   return RegExp(
  //     r"^((https:\/\/){1})?(w{3}\.)?(facebook)(.com)\/[0-9a-zA-Z]+\/?",
  //     caseSensitive: false,
  //     multiLine: false,
  //   ).hasMatch(this);
  // }

  // bool get isValidInstagram {
  //   return RegExp(
  //     r"^((https:\/\/){1})?(w{3}\.)?(instagram)(.com)\/[0-9a-zA-Z]+\/?",
  //     caseSensitive: false,
  //     multiLine: false,
  //   ).hasMatch(this);
  // }

  // bool get isValidLinkedin {
  //   return RegExp(
  //     r"^((https:\/\/){1})?(w{3}\.)?(linkedin)(.com)\/[0-9a-zA-Z]+\/?",
  //     caseSensitive: false,
  //     multiLine: false,
  //   ).hasMatch(this);
  // }

  // bool get isValidTiktok {
  //   return RegExp(
  //     r"^((https:\/\/){1})?(w{3}\.)?(tiktok)(.com)\/[0-9a-zA-Z]+\/?",
  //     caseSensitive: false,
  //     multiLine: false,
  //   ).hasMatch(this);
  // }

  // bool get isValidYoutube {
  //   return RegExp(
  //     r"^((https:\/\/){1})?(w{3}\.)?(youtube)(.com)\/[0-9a-zA-Z]+\/?",
  //     caseSensitive: false,
  //     multiLine: false,
  //   ).hasMatch(this);
  // }
}
