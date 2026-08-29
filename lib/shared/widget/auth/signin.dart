import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/shared/widget/auth/text_divider_center.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utils/validator_utils.dart';

class SignIn extends ConsumerStatefulWidget {
  final void Function() _navSignUp;

  const SignIn(this._navSignUp, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends ConsumerState<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();
  bool _visiblePsswdState = false;

  void _handleLoginWithEmailPassword() {}

  IconData _getIconDataByVisiblePassword(bool isVisible) {
    return isVisible
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
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
                  l10n.textExplainSignIn,
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
                validator: (value) =>
                    Validators.validateEmail(value, l10n),
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
                validator: (value) =>
                    Validators.validatePassword(value, l10n),
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

              //button submit
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
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
                    onPressed: _handleLoginWithEmailPassword,
                    child: Text(
                      l10n.textLogin,
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

              //Option login with social
              TextDividerCenter(l10n.textSocialAuth),

              SizedBox(height: 20),

              //Google
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
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
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: _handleLoginWithEmailPassword,
                    child: Row(
                      children: [
                        Icon(
                          Icons.g_mobiledata_outlined,
                          size: 30,
                          color: Colors.white,
                        ),

                        SizedBox(width: 8),

                        Expanded(
                          child: Text(
                            l10n.textLoginWithGoogle,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              //Don't have an account yet?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.textDontHaveAnAccountYet,
                    style: TextStyle(fontSize: 12),
                  ),

                  SizedBox(width: 8),

                  GestureDetector(
                    onTap: widget._navSignUp,
                    child: Text(
                      l10n.textSignup,
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
