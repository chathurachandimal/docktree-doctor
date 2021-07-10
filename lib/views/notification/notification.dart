import 'package:doctor_app/constants.dart';
import 'package:doctor_app/views/notification/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: Body());
  }

  AppBar buildAppBar(Size size) {
    return AppBar(
      backgroundColor: appBarBackgroundColor,
      brightness: Brightness.dark,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Notifications", style: TextStyle(color: Colors.white))
        ],
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
