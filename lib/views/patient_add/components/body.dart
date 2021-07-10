import 'package:doctor_app/components/rounded_button.dart';
import 'package:doctor_app/components/rounded_input_area_field.dart';
import 'package:doctor_app/components/rounded_input_field.dart';
import 'package:doctor_app/controllers/patient_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends GetWidget<PatientController> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController allergiesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "First Name",
                controller: firstNameController,
              ),
              RoundedInputField(
                hintText: "Last Name",
                controller: lastNameController,
              ),
              RoundedInputField(
                hintText: "Mobile",
                icon: Icons.phone,
                controller: mobileController,
              ),
              RoundedInputField(
                hintText: "Age",
                icon: Icons.perm_contact_calendar,
                controller: ageController,
              ),
              Divider(),
              RoundedInputAreaField(
                hintText: "Allergies",
                maxLines: 12,
                icon: Icons.perm_contact_calendar,
                controller: allergiesController,
              ),
              RoundedButton(
                text: "Save",
                press: () {
                  if (this.validate() != null) {
                    Get.snackbar(
                      "Woops",
                      this.validate(),
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return;
                  }
                  Map patient = {
                    "first_name": firstNameController.text,
                    "last_name": lastNameController.text,
                    "mobile": mobileController.text,
                    "age": ageController.text,
                    "allergies": allergiesController.text,
                  };
                  controller.register(patient);
                },
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center),
              SizedBox(height: size.height * 0.03),
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
    if (firstNameController.text.isBlank) return 'First Name field is required';
    if (lastNameController.text.isBlank) return 'Last Name field is required';
    if (mobileController.text.isBlank) return 'Mobile field is required';
    if (ageController.text.isBlank) return 'Age field is required';
  }
}
