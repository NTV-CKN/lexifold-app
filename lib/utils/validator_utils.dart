import '../l10n/app_localizations.dart';

class Validators {
  static String? validateEmail(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.errorEmailFormat;
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value.trim())) {
      return l10n.errorEmailFormat;
    }

    return null;
  }

  static String? validatePassword(
    String? value,
    AppLocalizations l10n,
  ) {
    if (value == null || value.isEmpty) {
      return l10n.hintEnterPassword;
    }

    if (value.length < 6 || value.length > 20) {
      return l10n.hintEnterPassword;
    }

    final passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$',
    );

    if (!passwordRegExp.hasMatch(value)) {
      return l10n.errorPasswordFormat;
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String originalPassword,
    AppLocalizations l10n,
  ) {
    if (value == null || value.isEmpty) {
      return l10n.errorPasswordNotSame;
    }

    if (value != originalPassword) {
      return l10n.errorPasswordNotSame;
    }

    return null;
  }
}
