import 'package:flutter/material.dart';
import 'package:doctor_app/constants.dart';

class TitleMsg extends StatelessWidget {
  final String msg_1;
  final String msg_2;
  const TitleMsg({Key key, this.msg_1, this.msg_2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '$msg_1',
          style: TextStyle(color: kPrimaryColor),
        ),
        Text(
          '$msg_2',
          style: TextStyle(color: kPrimaryColor),
        ),
      ],
    );
  }
}
