import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/app_localizations.dart';

class SignupWaitingVerifyScreen extends ConsumerWidget {
  const SignupWaitingVerifyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    //args
    final args =
        ModalRoute.of(context)?.settings.arguments
            as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.textVerifyMail)),
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.textRegisterSuccess,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: colorScheme.primary,
              ),
            ),
            SizedBox(height: 12),
            Text(
              l10n.textExplainVerifyMail(args["email"]),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.primary.withAlpha(240),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
