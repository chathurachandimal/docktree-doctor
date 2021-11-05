import 'package:doctor_app/constants.dart';
import 'package:doctor_app/views/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: Body());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.dark,
      automaticallyImplyLeading: false,
      centerTitle: false,
      leadingWidth: 0,
      title: Padding(
        padding: const EdgeInsets.all(0),
        child: Image.asset(
          "assets/images/app_logo.png",
          fit: BoxFit.cover,
          width: 150,
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
