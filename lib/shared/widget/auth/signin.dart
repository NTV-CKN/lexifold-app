import 'package:flutter/cupertino.dart';
import 'package:lexifold/utils/show_progress_dialog.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ShowProgressDialog.showDialogLoading(context);
      },
      child: Text("Tap"),
    );
  }
}
