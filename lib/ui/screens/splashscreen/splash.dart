import 'dart:async';

import 'package:e_commerce/data/api/api_constants.dart';
import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/my_shared_preferences.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashscreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () async {
      await MySharedPreferces.init();
      var userToken = MySharedPreferces.getData(key: ApiConstants.userToken);
      String appRoute;
      if (userToken == null) {
        appRoute = LoginScreen.routeName;
      } else {
        appRoute = HomeScreen.routeName;
      }
      Navigator.pushReplacementNamed(context, appRoute);
    });
    return Scaffold(
      body: Image(
        image: AssetImage('assets/images/splash_screen.png'),
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
