// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'LexiFold';

  @override
  String get textLogin => 'Đăng nhập';

  @override
  String get textSignup => 'Đăng kí';

  @override
  String get textExplainSignUp =>
      'Tạo tài khoản và bắt đầu hành trình học tiếng Anh của bạn!';

  @override
  String get textEmail => 'Email';

  @override
  String get hintEmail => 'Nhập Email của bạn';

  @override
  String get textPassword => 'Mật khẩu';

  @override
  String get hintEnterPassword => 'Mật khẩu chứa từ 6 đến 20 kí tự';

  @override
  String get textAcceptPassword => 'Xác nhận mật khẩu';

  @override
  String get hintEnterRepeatPassword => 'Nhập lại mật khẩu';

  @override
  String get errorEmailFormat => 'Email không đúng định dạng';

  @override
  String get errorPasswordNotSame => 'Mật khẩu không giống nhau';

  @override
  String get errorPasswordFormat =>
      'Mật khẩu phải chứa ít nhất 1 kí tự hoa, số và kí tự đặc biệt';

  @override
  String get textRegisterAccount => 'Tạo tài khoản';

  @override
  String get textAlreadyHaveAnAccount => 'Đã có tài khoản?';
}
