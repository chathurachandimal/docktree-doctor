import 'package:doctor_app/components/rounded_button.dart';
import 'package:doctor_app/components/rounded_input_area_field.dart';
import 'package:doctor_app/components/rounded_input_field.dart';
import 'package:doctor_app/controllers/referel_controller.dart';
import 'package:doctor_app/views/referel_template_list/referel_template_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class Body extends GetWidget<ReferelController> {
  final TextEditingController note = TextEditingController();
  final TextEditingController tplNameController = TextEditingController();

  final storage_ = GetStorage();
  @override
  Widget build(BuildContext context) {
    int patient_id = Get.arguments['patient_id'];
    int doc_id = Get.arguments['doc_id'];
    String patientName = Get.arguments['patient_name'];
    String referDoc = Get.arguments['referDoc'];
    String note_ = Get.arguments['note'];

    int created_by = storage_.read('doc_id');
    String created_doc_name = storage_.read('full_name');
    Size size = MediaQuery.of(context).size;
    note.text = "";
    note.text = note_;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
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
              RoundedButton(
                text: "Load From Template",
                press: () {
                  Get.to(ReferelTemplateListScreen(), arguments: {
                    "doc_id": doc_id,
                    "patient_id": patient_id,
                    "patient_name": patientName,
                    "referDoc": referDoc
                  });
                },
              ),
              Divider(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: (Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${formattedDate}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          SizedBox(height: size.height * 0.001),
                          Text("Dear Dr ${referDoc},",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                          SizedBox(height: size.height * 0.01),
                          Divider(),
                          Text("Mr. ${patientName}",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ])),
              ),
              // Container(
              //     padding: const EdgeInsets.symmetric(horizontal: 50),
              //     child: (Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: <Widget>[
              //           Text("Mr. GAMAGE",
              //               style: TextStyle(
              //                   fontSize: 14, fontWeight: FontWeight.w500)),
              //         ]))),
              RoundedInputAreaField(
                  hintText: "Note",
                  maxLines: 12,
                  icon: Icons.perm_contact_calendar,
                  controller: note),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: (Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("From",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            Text("Dr ${created_doc_name}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ]))),
              SizedBox(height: size.height * 0.05),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: (Row(
                    children: [
                      RoundedButton(
                        text: "Save & Send",
                        widthRatio: .45,
                        press: () {
                          Get.defaultDialog(
                              title: "Save as a Template",
                              textConfirm: "Save",
                              textCancel: "Cancel",
                              confirmTextColor: Colors.white,
                              barrierDismissible: false,
                              radius: 20,
                              content: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    SizedBox(height: size.height * 0.01),
                                    RoundedInputField(
                                        hintText: "Template name",
                                        controller: tplNameController)
                                  ],
                                ),
                              ),
                              onConfirm: () {
                                if (tplNameController.text.isBlank) {
                                  Get.snackbar(
                                    "Woops",
                                    "Invalid template name",
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                  return;
                                }
                                controller.saveAndNextReferel({
                                  "template": "",
                                  "name": tplNameController.text,
                                  "doctor_id": created_by,
                                  "status": 1
                                }, {
                                  "referral_note": note.text,
                                  "doctor_id": created_by,
                                  "doctor_id_referral": doc_id,
                                  "patient_id": patient_id
                                });
                                Get.back();
                              });
                        },
                      ),
                      Spacer(),
                      RoundedButton(
                        text: "Send",
                        widthRatio: .45,
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
                    ],
                  ))),
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
