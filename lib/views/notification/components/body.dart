import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  double offset = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(child: Text("All catch up!")),
    );
  }
}
