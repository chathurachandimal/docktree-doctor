import 'package:doctor_app/components/drawer_nav.dart';
import 'package:doctor_app/views/patient_list/components/body.dart';
import 'package:flutter/material.dart';

class PatientListScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNav(),
      body: Body(),
    );
  }
}
