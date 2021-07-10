import 'dart:async';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/views/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../size_config.dart';

class SplashScreen extends StatelessWidget {
  startTimeout() {
    return new Timer(Duration(seconds: 2), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    Get.off(LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    startTimeout();
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/app-icon.png",
              height: 300.0,
              width: 300.0,
            ),
          ],
        ),
      ),
    );
  }
}
