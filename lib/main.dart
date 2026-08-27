import 'package:flutter/material.dart';
import 'package:lexifold/utils/theme_utils.dart';

void main() {
  runApp(
    MaterialApp(
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
      body: Text("LexiFoldApp"),
    );
  }
}
