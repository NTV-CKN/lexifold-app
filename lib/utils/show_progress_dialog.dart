import 'dart:ui';

import 'package:flutter/material.dart';

class ShowProgressDialog {
  static void showDialogLoading(BuildContext ctx) {
    showDialog(
      barrierDismissible: false,
      fullscreenDialog: true,
      barrierColor: Colors.transparent,
      context: ctx,
      builder: (context) {
        return dialogLoadingWidget(context);
      },
    );
  }

  static void hideDialogLoading(BuildContext ctx) {
    Navigator.of(ctx, rootNavigator: true).pop();
  }

  static Widget dialogLoadingWidget(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            Text(
              'Loading...',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
