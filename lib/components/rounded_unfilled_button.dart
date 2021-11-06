import 'package:flutter/material.dart';
import 'package:doctor_app/constants.dart';

class RoundedUnfilledButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final double widthRatio;
  const RoundedUnfilledButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.widthRatio = 0.8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * widthRatio,
      child: OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29),
        ),
        borderSide: BorderSide(color: color, width: 1),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
