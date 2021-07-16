import 'package:doctor_app/constants.dart';
import 'package:doctor_app/views/prescription_list/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PrescriptionListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: appBarBackgroundColor,
      automaticallyImplyLeading: true,
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      //title: Text("Referels", style: TextStyle(color: Colors.white)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // IconButton(
          //   icon: Icon(Icons.home),
          //   color: Colors.white,
          //   onPressed: () {
          //     Get.back();
          //   },
          // ),
          Text("Prescriptions", style: TextStyle(color: Colors.white))
        ],
      ),
      elevation: 0,
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.add),
      //     onPressed: () {},
      //   ),
      // ],
    );
  }
}
