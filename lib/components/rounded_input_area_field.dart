import 'package:flutter/material.dart';
import 'package:doctor_app/components/text_field_container.dart';
import 'package:doctor_app/constants.dart';

class RoundedInputAreaField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final int maxLines;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedInputAreaField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.maxLines = 1,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLines: maxLines,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
