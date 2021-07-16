import 'package:doctor_app/constants.dart';
import 'package:doctor_app/views/patient_quick_list/components/body.dart';
import 'package:flutter/material.dart';

class PatientQuickListScreen extends StatelessWidget {
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
      title: Text("Patients", style: TextStyle(color: Colors.white)),
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
