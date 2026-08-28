import 'package:flutter/material.dart';
import 'package:lexifold/l10n/app_localizations.dart';

class SignUp extends StatefulWidget {
  const SignUp(this._navSignIn, {super.key});

  final void Function() _navSignIn;

  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  bool _visiblePsswdState = false;
  bool _visibleRepeatPsswdState = false;

  IconData _getIconDataByVisiblePassword(bool isVisible) {
    return isVisible
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorScheme.surface,
          ),
          child: Column(
            children: [
              Align(
                alignment: AlignmentGeometry.centerStart,
                child: Text(
                  l10n.textExplainSignUp,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: colorScheme.primary,
                  ),
                ),
              ),

              SizedBox(height: 20),

              //Email
              Align(
                alignment: AlignmentGeometry.centerStart,
                child: Text(
                  l10n.textEmail,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: l10n.hintEmail,
                  hintStyle: TextStyle(
                    color: Colors.grey.withAlpha(180),
                  ),
                ),
              ),

              SizedBox(height: 20),

              //password
              Align(
                alignment: AlignmentGeometry.centerStart,
                child: Text(
                  l10n.textPassword,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: !_visiblePsswdState,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _visiblePsswdState = !_visiblePsswdState;
                      });
                    },
                    icon: Icon(
                      _getIconDataByVisiblePassword(
                        _visiblePsswdState,
                      ),
                    ),
                  ),
                  hintText: l10n.hintEnterPassword,
                  hintStyle: TextStyle(
                    color: Colors.grey.withAlpha(180),
                  ),
                ),
              ),

              SizedBox(height: 20),

              //repeat password
              Align(
                alignment: AlignmentGeometry.centerStart,
                child: Text(
                  l10n.textAcceptPassword,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _repeatPasswordController,
                obscureText: !_visibleRepeatPsswdState,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _visibleRepeatPsswdState =
                            !_visibleRepeatPsswdState;
                      });
                    },
                    icon: Icon(
                      _getIconDataByVisiblePassword(
                        _visibleRepeatPsswdState,
                      ),
                    ),
                  ),
                  hintText: l10n.hintEnterRepeatPassword,
                  hintStyle: TextStyle(
                    color: Colors.grey.withAlpha(180),
                  ),
                ),
              ),

              SizedBox(height: 20),

              //button submit
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(
                          10,
                        ),
                      ),
                      backgroundColor: colorScheme.primary,
                    ),
                    onPressed: () {},
                    child: Text(
                      l10n.textRegisterAccount,
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              //already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.textAlreadyHaveAnAccount,
                    style: TextStyle(fontSize: 12),
                  ),

                  SizedBox(width: 8),

                  GestureDetector(
                    onTap: widget._navSignIn,
                    child: Text(
                      l10n.textLogin,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
