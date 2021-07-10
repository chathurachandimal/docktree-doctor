import 'package:doctor_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class QuickAccessCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final StatelessWidget screen_;
  final double size;
  const QuickAccessCard({
    Key key,
    this.svgSrc,
    this.title,
    this.screen_,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            // Get.to(screen_);
          },
          child: Image.asset(
            svgSrc,
            color: kTextDarkColor,
            width: size,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: kTextDarkColor, fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
