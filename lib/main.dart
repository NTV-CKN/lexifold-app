import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lexifold/utils/theme_utils.dart';

import 'l10n/app_localizations.dart';

void main() {
  runApp(
    MaterialApp(
      locale: const Locale("vi"),
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
  );
}

class LexiFoldApp extends StatelessWidget {
  const LexiFoldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello world!')),
      body: Text(AppLocalizations.of(context)?.appName ?? "Unknown"),
    );
  }
}
