import 'package:doctor_app/components/title_msg.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/register_controller.dart';
import 'package:doctor_app/views/login/login_screen.dart';
import 'package:doctor_app/views/opt/opt_screen.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/components/already_have_an_account_acheck.dart';
import 'package:doctor_app/components/rounded_button.dart';
import 'package:doctor_app/components/rounded_input_field.dart';
import 'package:doctor_app/components/rounded_password_field.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

enum Gender { male, female }

class RegistrationScreen extends GetWidget<RegisterController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Gender _character = Gender.male;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.1),
              Text(
                "CREATE AN ACCOUNT",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.02),

              Text(
                'We will be sending you an OTP verification',
                style: TextStyle(color: kPrimaryColor),
              ),
              Text(
                'to proceed in next step.',
                style: TextStyle(color: kPrimaryColor),
              ),
              SizedBox(height: size.height * 0.01),
              RoundedInputField(
                hintText: "Your Email *",
                controller: emailController,
              ),
              RoundedPasswordField(
                hintText: "Password *",
                controller: passwordController,
              ),
              RoundedPasswordField(
                hintText: "Confirm Password *",
                controller: confirmPasswordController,
              ),
              Divider(),
              RoundedInputField(
                hintText: "First Name *",
                controller: firstNameController,
              ),
              RoundedInputField(
                hintText: "Last Name *",
                controller: lastNameController,
              ),
              RoundedInputField(
                hintText: "Mobile *",
                icon: Icons.phone,
                controller: mobileController,
              ),
              RoundedInputField(
                hintText: "Age *",
                icon: Icons.perm_contact_calendar,
                controller: ageController,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: kTextDarkColor,
                    onChanged: (value) {
                      print("radio $value");
                    }),
                Text("Male"),
                Radio(
                    value: 0,
                    groupValue: 1,
                    activeColor: kTextDarkColor,
                    onChanged: (value) {
                      print("radio $value");
                    }),
                Text("Female")
              ]),
              RoundedButton(
                text: "Create Account",
                press: () {
                  if (this.validate() != null) {
                    Get.snackbar(
                      "Woops",
                      this.validate(),
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                  Map doctor = {
                    "first_name": firstNameController.text,
                    "last_name": lastNameController.text,
                    "email": emailController.text,
                    "password": passwordController.text,
                    "c_password": confirmPasswordController.text,
                    "mobile": mobileController.text,
                    "age": ageController.text,
                  };
                  controller.register(doctor);
                  //Get.off(OptScreen());
                },
              ),
              SizedBox(height: size.height * 0.01),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Get.off(LoginScreen());
                },
              )
              //Row(mainAxisAlignment: MainAxisAlignment.center)
              // SizedBox(height: size.height * 0.03),
              // AlreadyHaveAnAccountCheck(
              //   login: false,
              //   press: () {
              //     Get.off(LoginScreen());
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }

  String validate() {
    String msg = '';
    if (emailController.text.isBlank) return 'Email field is required';
    if (passwordController.text.isBlank) return 'Password field is required';
    if (confirmPasswordController.text.isBlank)
      return 'Confirm Password field is required';
    if (firstNameController.text.isBlank) return 'First Name field is required';
    if (lastNameController.text.isBlank) return 'Last Name field is required';
    if (mobileController.text.isBlank) return 'Mobile field is required';
    if (ageController.text.isBlank) return 'Age field is required';
    if (passwordController.text != confirmPasswordController.text)
      return 'Confirm Password miss match';
  }
}
