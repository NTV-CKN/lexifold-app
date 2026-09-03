import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('vi')];

  /// No description provided for @appName.
  ///
  /// In vi, this message translates to:
  /// **'LexiFold'**
  String get appName;

  /// No description provided for @textLogin.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập'**
  String get textLogin;

  /// No description provided for @textSignup.
  ///
  /// In vi, this message translates to:
  /// **'Đăng kí'**
  String get textSignup;

  /// No description provided for @textExplainSignUp.
  ///
  /// In vi, this message translates to:
  /// **'Tạo tài khoản và bắt đầu hành trình học tiếng Anh của bạn!'**
  String get textExplainSignUp;

  /// No description provided for @textEmail.
  ///
  /// In vi, this message translates to:
  /// **'Email'**
  String get textEmail;

  /// No description provided for @hintEmail.
  ///
  /// In vi, this message translates to:
  /// **'Nhập Email của bạn'**
  String get hintEmail;

  /// No description provided for @textPassword.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu'**
  String get textPassword;

  /// No description provided for @hintEnterPassword.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu chứa từ 6 đến 20 kí tự'**
  String get hintEnterPassword;

  /// No description provided for @textAcceptPassword.
  ///
  /// In vi, this message translates to:
  /// **'Xác nhận mật khẩu'**
  String get textAcceptPassword;

  /// No description provided for @hintEnterRepeatPassword.
  ///
  /// In vi, this message translates to:
  /// **'Nhập lại mật khẩu'**
  String get hintEnterRepeatPassword;

  /// No description provided for @errorEmailFormat.
  ///
  /// In vi, this message translates to:
  /// **'Email không đúng định dạng'**
  String get errorEmailFormat;

  /// No description provided for @errorPasswordNotSame.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu không giống nhau'**
  String get errorPasswordNotSame;

  /// No description provided for @errorPasswordFormat.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu phải chứa ít nhất 1 kí tự hoa, số và kí tự đặc biệt'**
  String get errorPasswordFormat;

  /// No description provided for @textRegisterAccount.
  ///
  /// In vi, this message translates to:
  /// **'Tạo tài khoản'**
  String get textRegisterAccount;

  /// No description provided for @textAlreadyHaveAnAccount.
  ///
  /// In vi, this message translates to:
  /// **'Đã có tài khoản?'**
  String get textAlreadyHaveAnAccount;

  /// No description provided for @textRegisterSuccess.
  ///
  /// In vi, this message translates to:
  /// **'Đăng kí tài khoản thành công!'**
  String get textRegisterSuccess;

  /// No description provided for @textVerifyMail.
  ///
  /// In vi, this message translates to:
  /// **'Xác thực Email'**
  String get textVerifyMail;

  /// Tên email
  ///
  /// In vi, this message translates to:
  /// **'Chúng tôi đã gửi tin nhắn xác nhận đến email: `{email}` vừa đăng kí của bạn, vui lòng mở hộp thư đến hoặc thư rác để xác nhận bước cuối cùng'**
  String textExplainVerifyMail(String email);

  /// No description provided for @textExplainSignIn.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập để bắt đầu hành trình học tiếng Anh của bạn!'**
  String get textExplainSignIn;

  /// No description provided for @textDontHaveAnAccountYet.
  ///
  /// In vi, this message translates to:
  /// **'Bạn chưa có tài khoản?'**
  String get textDontHaveAnAccountYet;

  /// No description provided for @textSocialAuth.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập với tài khoản mạng xã hội'**
  String get textSocialAuth;

  /// No description provided for @textLoginWithGoogle.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập với Google'**
  String get textLoginWithGoogle;

  /// No description provided for @textForgotPassword.
  ///
  /// In vi, this message translates to:
  /// **'Quên mật khẩu?'**
  String get textForgotPassword;

  /// No description provided for @textResetPassword.
  ///
  /// In vi, this message translates to:
  /// **'Khôi phục mật khẩu'**
  String get textResetPassword;

  /// No description provided for @textExplainResetPassword.
  ///
  /// In vi, this message translates to:
  /// **'Nhập email để khôi phục mật khẩu'**
  String get textExplainResetPassword;

  /// No description provided for @textSendRequest.
  ///
  /// In vi, this message translates to:
  /// **'Gửi yêu cầu'**
  String get textSendRequest;

  /// No description provided for @textErrorResetPassword.
  ///
  /// In vi, this message translates to:
  /// **'Lỗi xảy ra trong quá trình khôi phục mật khẩu, vui lòng thử lại'**
  String get textErrorResetPassword;

  /// No description provided for @textSuccessResetPassword.
  ///
  /// In vi, this message translates to:
  /// **'Chúng tôi đã gửi mail xác thực đến email này, vui lòng kiểm tra hộp thư và tiến hành khôi phục mật khẩu mới!'**
  String get textSuccessResetPassword;

  /// No description provided for @textEmailNotExistsInSystem.
  ///
  /// In vi, this message translates to:
  /// **'Email này chưa được đăng ký trong hệ thống.'**
  String get textEmailNotExistsInSystem;

  /// No description provided for @textErrorDuringProgress.
  ///
  /// In vi, this message translates to:
  /// **'Đã có lỗi xảy ra trong quá trình thực thi, vui lòng thử lại!'**
  String get textErrorDuringProgress;

  /// No description provided for @textUserDisabled.
  ///
  /// In vi, this message translates to:
  /// **'Tài khoản này đã bị khóa.'**
  String get textUserDisabled;

  /// No description provided for @textWrongPasswordOrCredential.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu hoặc thông tin xác thực không chính xác.'**
  String get textWrongPasswordOrCredential;

  /// No description provided for @textWeakPassword.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu quá yếu.'**
  String get textWeakPassword;

  /// No description provided for @textEmailAlreadyInUse.
  ///
  /// In vi, this message translates to:
  /// **'Email này đã được sử dụng bởi một tài khoản khác.'**
  String get textEmailAlreadyInUse;

  /// No description provided for @textAccountExistsWithDifferentCredential.
  ///
  /// In vi, this message translates to:
  /// **'Email này đã được liên kết với một phương thức đăng nhập khác.'**
  String get textAccountExistsWithDifferentCredential;

  /// No description provided for @textOperationNotAllowed.
  ///
  /// In vi, this message translates to:
  /// **'Phương thức đăng nhập này chưa được kích hoạt.'**
  String get textOperationNotAllowed;

  /// No description provided for @textTooManyRequests.
  ///
  /// In vi, this message translates to:
  /// **'Bạn đã thử quá nhiều lần. Vui lòng thử lại sau.'**
  String get textTooManyRequests;

  /// No description provided for @textNetworkRequestFailed.
  ///
  /// In vi, this message translates to:
  /// **'Lỗi kết nối mạng. Vui lòng kiểm tra lại đường truyền internet.'**
  String get textNetworkRequestFailed;

  /// No description provided for @textHome.
  ///
  /// In vi, this message translates to:
  /// **'Trang chủ'**
  String get textHome;

  /// No description provided for @textLibrary.
  ///
  /// In vi, this message translates to:
  /// **'Thư viện'**
  String get textLibrary;

  /// No description provided for @textFolder.
  ///
  /// In vi, this message translates to:
  /// **'Thư mục'**
  String get textFolder;

  /// No description provided for @textSet.
  ///
  /// In vi, this message translates to:
  /// **'Học phần'**
  String get textSet;

  /// No description provided for @textVocabScan.
  ///
  /// In vi, this message translates to:
  /// **'Từ vựng đã quét'**
  String get textVocabScan;

  /// No description provided for @textFavorite.
  ///
  /// In vi, this message translates to:
  /// **'Yêu thích'**
  String get textFavorite;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
