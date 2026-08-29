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
  /// **'Chúng tôi đã gửi tin nhắn xác nhận đến email: `{email}` vừa đăng kí của bạn, vui lòng mở ra và xác nhận bước cuối cùng'**
  String textExplainVerifyMail(String email);
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
