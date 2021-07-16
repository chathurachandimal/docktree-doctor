import 'package:doctor_app/constants.dart';
import 'package:doctor_app/views/doctor_list/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctortListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int patient_id = Get.arguments['patient_id'];
    String title = Get.arguments['title'];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(size, patient_id, title),
      body: Body(),
    );
  }

  AppBar buildAppBar(Size size, int patient_id, String title) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      backgroundColor: appBarBackgroundColor,
      automaticallyImplyLeading: true,
      title: Text("${patient_id == 0 ? title : 'Select a doctor'}",
          style: TextStyle(color: Colors.white)),
      elevation: 0,
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.add),
      //     onPressed: () {
      //       Get.to(PatientAddScreen());
      //     },
      //   ),
      // ],
    );
  }
}
