import 'package:doctor_app/components/rounded_button.dart';
import 'package:doctor_app/components/rounded_input_area_field.dart';
import 'package:doctor_app/controllers/referel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class Body extends GetWidget<ReferelController> {
  final TextEditingController note = TextEditingController();
  final storage_ = GetStorage();
  @override
  Widget build(BuildContext context) {
    int patient_id = Get.arguments['patient_id'];
    int doc_id = Get.arguments['doc_id'];
    int created_by = storage_.read('doc_id');
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SizedBox(height: size.height * 0.03),
              // RoundedInputField(
              //   hintText: "First Name",
              //   onChanged: (value) {},
              // ),
              // RoundedInputField(
              //   hintText: "Last Name",
              //   onChanged: (value) {},
              // ),
              // RoundedInputField(
              //   hintText: "Mobile",
              //   icon: Icons.phone,
              //   onChanged: (value) {},
              // ),
              // RoundedInputField(
              //   hintText: "Age",
              //   icon: Icons.perm_contact_calendar,
              //   onChanged: (value) {},
              // ),
              Divider(),
              RoundedInputAreaField(
                  hintText: "Note",
                  maxLines: 12,
                  icon: Icons.perm_contact_calendar,
                  controller: note),
              RoundedButton(
                text: "Save",
                press: () {
                  controller.newReferel({
                    "referral_note": note.text,
                    "doctor_id": created_by,
                    "doctor_id_referral": doc_id,
                    "patient_id": patient_id
                  });
                  Get.back();
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
}
