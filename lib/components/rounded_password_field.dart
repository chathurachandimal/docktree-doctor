import 'package:flutter/material.dart';
import 'package:doctor_app/components/text_field_container.dart';
import 'package:doctor_app/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final TextEditingController controller;
  const RoundedPasswordField({
    Key key,
    this.hintText,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: TextStyle(height: 1.5),
          icon: Icon(
            Icons.lock,
            color: kTextDarkColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kTextDarkColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
