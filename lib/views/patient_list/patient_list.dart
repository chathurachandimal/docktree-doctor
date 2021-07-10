import 'package:doctor_app/constants.dart';
import 'package:doctor_app/views/patient_list/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PatientListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    Size size = MediaQuery.of(context).size;
    return Scaffold(appBar: buildAppBar(size), body: Body());
  }

  AppBar buildAppBar(Size size) {
    return AppBar(
      backgroundColor: appBarBackgroundColor,
      brightness: Brightness.dark,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Text("Patients", style: TextStyle(color: Colors.white))],
      ),
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
