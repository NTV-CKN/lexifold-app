import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/features/auth/auth_screen.dart';
import 'package:lexifold/features/auth/signup_waiting_verify_screen.dart';
import 'package:lexifold/features/auth/reset_password_screen.dart';
import 'package:lexifold/utils/theme_utils.dart';
import 'package:lexifold/utils/routes_name.dart';

import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      child: MaterialApp(
        //routes
        routes: {
          RoutesName.verifySignUp: (context) =>
              const SignupWaitingVerifyScreen(),
          RoutesName.resetPassword: (context) =>
              const ResetPasswordScreen(),
        },

        locale: const Locale("vi"),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,

        theme: ThemeUtils.lightTheme,
        darkTheme: ThemeUtils.darkTheme,
        themeMode: ThemeMode.system,
        home: const LexiFoldApp(),
      ),
    ),
  );
}

class LexiFoldApp extends StatelessWidget {
  const LexiFoldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreen();
  }
}
