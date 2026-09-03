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

  @override
  String get textRegisterSuccess => 'Đăng kí tài khoản thành công!';

  @override
  String get textVerifyMail => 'Xác thực Email';

  @override
  String textExplainVerifyMail(String email) {
    return 'Chúng tôi đã gửi tin nhắn xác nhận đến email: `$email` vừa đăng kí của bạn, vui lòng mở hộp thư đến hoặc thư rác để xác nhận bước cuối cùng';
  }

  @override
  String get textExplainSignIn =>
      'Đăng nhập để bắt đầu hành trình học tiếng Anh của bạn!';

  @override
  String get textDontHaveAnAccountYet => 'Bạn chưa có tài khoản?';

  @override
  String get textSocialAuth => 'Đăng nhập với tài khoản mạng xã hội';

  @override
  String get textLoginWithGoogle => 'Đăng nhập với Google';

  @override
  String get textForgotPassword => 'Quên mật khẩu?';

  @override
  String get textResetPassword => 'Khôi phục mật khẩu';

  @override
  String get textExplainResetPassword => 'Nhập email để khôi phục mật khẩu';

  @override
  String get textSendRequest => 'Gửi yêu cầu';

  @override
  String get textErrorResetPassword =>
      'Lỗi xảy ra trong quá trình khôi phục mật khẩu, vui lòng thử lại';

  @override
  String get textSuccessResetPassword =>
      'Chúng tôi đã gửi mail xác thực đến email này, vui lòng kiểm tra hộp thư và tiến hành khôi phục mật khẩu mới!';

  @override
  String get textEmailNotExistsInSystem =>
      'Email này chưa được đăng ký trong hệ thống.';

  @override
  String get textErrorDuringProgress =>
      'Đã có lỗi xảy ra trong quá trình thực thi, vui lòng thử lại!';

  @override
  String get textUserDisabled => 'Tài khoản này đã bị khóa.';

  @override
  String get textWrongPasswordOrCredential =>
      'Mật khẩu hoặc thông tin xác thực không chính xác.';

  @override
  String get textWeakPassword => 'Mật khẩu quá yếu.';

  @override
  String get textEmailAlreadyInUse =>
      'Email này đã được sử dụng bởi một tài khoản khác.';

  @override
  String get textAccountExistsWithDifferentCredential =>
      'Email này đã được liên kết với một phương thức đăng nhập khác.';

  @override
  String get textOperationNotAllowed =>
      'Phương thức đăng nhập này chưa được kích hoạt.';

  @override
  String get textTooManyRequests =>
      'Bạn đã thử quá nhiều lần. Vui lòng thử lại sau.';

  @override
  String get textNetworkRequestFailed =>
      'Lỗi kết nối mạng. Vui lòng kiểm tra lại đường truyền internet.';

  @override
  String get textHome => 'Trang chủ';

  @override
  String get textLibrary => 'Thư viện';
}
