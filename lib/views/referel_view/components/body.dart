import 'package:doctor_app/components/rounded_input_area_field.dart';
import 'package:doctor_app/controllers/referel_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class Body extends GetWidget<ReferelViewController> {
  final TextEditingController note = TextEditingController();
  final TextEditingController tplNameController = TextEditingController();

  final storage_ = GetStorage();
  @override
  Widget build(BuildContext context) {
    int ref_id = Get.arguments['ref_id'];

    controller.viewReferel(ref_id);
    Size size = MediaQuery.of(context).size;

    DateTime now = DateTime.parse(controller.referel.value.createdAt);
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    note.text = controller.referel.value?.referral_note;
    // This size provide us total height and width of our screen
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: SingleChildScrollView(
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: size.height * 0.001),
                              Text(
                                  "Dear Dr. ${controller.referel.value.doctor_id_referral['first_name']} ${controller.referel.value.doctor_id_referral['last_name']},",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: size.height * 0.01),
                              Divider(),
                              Text(
                                  "Mr. ${controller.referel.value.patient_id['first_name']} ${controller.referel.value.patient_id['last_name']}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ])),
                  ),
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    "Dr. ${controller.referel.value.doctor_id['first_name']} ${controller.referel.value.doctor_id['last_name']}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ]))),
                ],
              )),
        ),
      ),
    );
  }
}
