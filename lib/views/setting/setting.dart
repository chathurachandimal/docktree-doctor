import 'package:doctor_app/views/setting/components/body.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(size),
      body: Body(),
    );
  }

  AppBar buildAppBar(Size size) {
    return AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.dark,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Transform(
        transform: Matrix4.translationValues(5.0, 0.0, 0.0),
        child: Text(
          "Settings",
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
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
