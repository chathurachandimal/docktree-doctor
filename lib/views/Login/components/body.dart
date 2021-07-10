import 'dart:math';

import 'package:doctor_app/controllers/auth_controller.dart';
import 'package:doctor_app/views/login/components/background.dart';
import 'package:doctor_app/views/opt/opt_screen.dart';
import 'package:doctor_app/views/registration/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/components/already_have_an_account_acheck.dart';
import 'package:doctor_app/components/rounded_button.dart';
import 'package:doctor_app/components/rounded_input_field.dart';
import 'package:doctor_app/components/rounded_password_field.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../../size_config.dart';

class Body extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.04),
            Text(
              "Welcome Back",
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(28.0),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              "Sign in with your email and password",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.08),
            RoundedInputField(
              hintText: "Your Email",
              controller: emailController,
            ),
            RoundedPasswordField(
              hintText: "Password",
              controller: passwordController,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                controller.login(emailController.text, passwordController.text);
                //Get.off(WelcomeScreen());
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                // Get.off(OptScreen(),
                //     arguments: {'email': 'chandimal20@gmail.com'});
                Get.off(RegistrationScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
