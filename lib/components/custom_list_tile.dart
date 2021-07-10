import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final String text2;

  // ignore: avoid_init_to_null
  CustomListTile({this.icon, this.text, this.text2 = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black54,
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            "$text",
            style: TextStyle(fontSize: 16.0),
          ),
          Spacer(),
          Text(
            "$text2",
            style: TextStyle(fontSize: 12.0),
          )
        ],
      ),
    );
  }

  Widget secondView() {
    if (text2 != null) {
      return Container(
        child: Row(children: <Widget>[
          Spacer(),
          Text(
            "Age 42",
            style: TextStyle(fontSize: 12.0),
          )
        ]),
      );
    } else {
      return Row(children: <Widget>[]);
    }
  }
}
