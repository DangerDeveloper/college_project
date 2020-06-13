import 'dart:async';

import 'package:collegeproject/pages/splash_scree.dart';
import 'package:collegeproject/provider/onbording_auth.dart';
import 'package:collegeproject/routs/routs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllPage extends StatefulWidget {
  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  void initState() {
    super.initState();

    var onboarding = Provider.of<OnbordingAuth>(context, listen: false);
    onboarding.isIntroScreenOpenedBeforeGetter.then((value) => {
          value == false || value == null
              ? Timer.run(() {
                  Navigator.of(context).pushReplacementNamed(ROUTES.ONBOARDING);
                })
              : Timer.run(() {
                  Navigator.of(context)
                      .pushReplacementNamed(ROUTES.AUTHENTICATION_SCREEN);
                })
        });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
