import 'package:doctor_app/constants.dart';
import 'package:doctor_app/views/referel_add/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferelAddScreen extends StatelessWidget {
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
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      backgroundColor: appBarBackgroundColor,
      automaticallyImplyLeading: true,
      title: Text("New Referral", style: TextStyle(color: Colors.white)),
      elevation: 1,
    );
  }
}
