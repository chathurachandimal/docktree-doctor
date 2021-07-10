import 'package:doctor_app/views/patient_profile/components/body.dart';
import 'package:flutter/material.dart';

class PatientProfileScreen extends StatelessWidget {
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
      automaticallyImplyLeading: true,
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
