import 'package:doctor_app/controllers/register_controller.dart';
import 'package:doctor_app/views/login/components/background.dart';
import 'package:doctor_app/views/login/login_screen.dart';
import 'package:doctor_app/views/registration/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/components/already_have_an_account_acheck.dart';
import 'package:doctor_app/components/rounded_button.dart';
import 'package:doctor_app/components/rounded_input_field.dart';
import 'package:doctor_app/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class Body  extends GetWidget<RegisterController> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.30,
            ),
            RoundedInputField(
              hintText: "Your Email",
              controller: emailController,
            ),
            RoundedPasswordField(
              hintText: "Password",
              controller: passwordController,
            ),
            RoundedPasswordField(
              hintText: "Confirm Password",
              controller: passwordController,
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                Get.off(RegistrationScreen());
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Get.off(LoginScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
