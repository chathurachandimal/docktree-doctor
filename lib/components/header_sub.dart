import 'package:flutter/material.dart';

class HeaderSub extends StatelessWidget {
  final String title;
  final IconData icon;
  final double offset;
  //final VoidCallback onPressed;

  const HeaderSub({Key key, this.title, this.icon, this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text(title),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {},
        ),
      ],
    );
  }
}
