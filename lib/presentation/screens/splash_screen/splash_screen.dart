import 'package:flutter/material.dart';
import 'package:odc_workshop/presentation/screens/login/login_screen.dart';
import 'package:splashscreen/splashscreen.dart';

import '../../../constants/app_assets.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: LoginScreen(),
      image: new Image.asset(
        AppAssets.odcImagePng,
        fit: BoxFit.cover,
      ),
      photoSize: 150.0,
      loaderColor: Colors.orange,
    );
  }
}
