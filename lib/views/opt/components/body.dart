import 'package:doctor_app/components/or_divider.dart';
import 'package:doctor_app/components/rounded_button.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/opt_controller.dart';
import 'package:doctor_app/views/opt/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Body extends GetWidget<OptController> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  final TextEditingController thirdController = TextEditingController();
  final TextEditingController fourthController = TextEditingController();
  FocusNode _nameFocusNode;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String email = Get.arguments['email'];
    return Background(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: (size.width * (20 / 375))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "OTP VARIFICATION",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              // SvgPicture.asset(
              //   "assets/icons/otp.svg",
              //   height: size.height * 0.20,
              // ),
              Text(
                "Please your check your mobile",
              ),
              Text("(077xxxxxx) and enter the verification code received"),
              //buildTimer(),
              SizedBox(height: size.height * 0.1),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                  width: (size.width * (60 / 375)),
                  child: TextField(
                    autofocus: true,
                    maxLength: 1,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    obscureText: true,
                    cursorColor: kTextDarkColor,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: firstController,
                 
                     
                     
                  ),
                ),
                SizedBox(
                  width: (size.width * (60 / 375)),
                  child: TextField(
                    maxLength: 1,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    autofocus: true,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    cursorColor: kTextDarkColor,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: secondController,
                
                  ),
                ),
                SizedBox(
                  width: (size.width * (60 / 375)),
                  child: TextField(
                    autofocus: true,
                    maxLength: 1,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    cursorColor: kTextDarkColor,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: thirdController,
                    textInputAction: TextInputAction.next
                  ),
                ),
                SizedBox(
                  width: (size.width * (60 / 375)),
                  child: TextField(
                    maxLength: 1,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    autofocus: true,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    cursorColor: kTextDarkColor,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: fourthController,
                  ),
                ),
              ]),
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                text: "Verify",
                press: () {
                  String opt_ = firstController.text +
                      secondController.text +
                      thirdController.text +
                      fourthController.text;
                  controller.checkOpt({'code': opt_, 'email': email});
                },
              ),
              SizedBox(height: size.height * 0.03),
              OrDivider(),
              SizedBox(height: size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // OTP code resend
                    },
                    child: Text(
                      "Change Mobile No",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // OTP code resend
                    },
                    child: Text(
                      "Resend OTP Code",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
