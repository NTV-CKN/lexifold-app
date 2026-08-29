import 'package:flutter/material.dart';

class ShowSnackbar {
  static void showBaseSnackbar(BuildContext ctx, String message) {
    ScaffoldMessenger.of(ctx).clearSnackBars();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text(message),
      ),
    );
  }
}
