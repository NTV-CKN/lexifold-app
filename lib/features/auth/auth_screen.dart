import 'package:flutter/material.dart';
import 'package:lexifold/l10n/app_localizations.dart';
import 'package:lexifold/shared/widget/auth/signin.dart';
import 'package:lexifold/shared/widget/auth/signup.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.book),
              SizedBox(width: 13),
              Text(l10n.appName),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.light_mode),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.surface,
                ),
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.all(10),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withAlpha(35),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(
                      text: l10n.textLogin,
                      icon: Icon(Icons.login),
                    ),
                    Tab(
                      text: l10n.textSignup,
                      icon: Icon(Icons.app_registration),
                    ),
                  ],
                ),
              ),
              //tab view
              Expanded(
                child: TabBarView(
                  children: [
                    //Navigate SignIn
                    Builder(
                      builder: (tabCtx) {
                        return SignIn(() {
                          DefaultTabController.of(
                            tabCtx,
                          ).animateTo(1);
                        });
                      },
                    ),
                    //Navigate SignUp
                    Builder(
                      builder: (tabCtx) {
                        return SignUp(
                          () => DefaultTabController.of(
                            tabCtx,
                          ).animateTo(0),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
