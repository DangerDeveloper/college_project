import 'package:collegeproject/logins/ui/login_page.dart';
import 'package:collegeproject/pages/splash_scree.dart';
import 'package:collegeproject/provider/auth.dart';
import 'package:collegeproject/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(builder: (ctx, auth, _) {
      return auth.isAuth
          ? SideBarLayout()
          : FutureBuilder(
              future: auth.tryAutoLogin(),
              builder: (c, result) =>
                  result.connectionState == ConnectionState.waiting
                      ? SplashScreen()
                      : LoginPage(),
            );
    });
  }
}
