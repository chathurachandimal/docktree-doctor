import 'package:doctor_app/constants.dart';
import 'package:doctor_app/views/drug_list/components/body.dart';
import 'package:doctor_app/views/drug_list/components/check_out_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DrugListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int patient_id = Get.arguments['patient_id'];
    String title = Get.arguments['title'];
    if (patient_id == 0) {
      return Scaffold(
        appBar: buildAppBar(patient_id, title),
        body: Body(),
      );
    } else {
      return Scaffold(
        appBar: buildAppBar(patient_id, title),
        body: Body(),
        bottomNavigationBar: CheckoutCard(),
      );
    }
  }

  AppBar buildAppBar(int patient_id, String title) {
    return AppBar(
      backgroundColor: appBarBackgroundColor,
      automaticallyImplyLeading: true,
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      //title: Text("Referels", style: TextStyle(color: Colors.white)),
      title: Text("${patient_id == 0 ? title : 'Select Drugs'}",
          style: TextStyle(color: Colors.white)),
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
