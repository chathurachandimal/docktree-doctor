import 'package:doctor_app/constants.dart';
import 'package:doctor_app/views/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: appBarBackgroundColor,
      brightness: Brightness.dark,
      automaticallyImplyLeading: false,
    );
  }
}
