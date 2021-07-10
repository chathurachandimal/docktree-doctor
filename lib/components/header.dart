import 'package:doctor_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;

  const Header(
      {Key key, this.image, this.textTop, this.textBottom, this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      padding: EdgeInsets.only(left: 10, top: 35, right: 20),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            kPrimaryColor,
            kPrimaryLightColor,
          ],
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 10,
            color: Color(0xFFDADADA).withOpacity(0.3),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: 10 - offset,
                    left: 10,
                    child: SizedBox(
                      height: 115,
                      width: 115,
                      child: Stack(
                        fit: StackFit.expand,
                        overflow: Overflow.visible,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/user.png"),
                          )
                        ],
                      ),
                    )),
                Positioned(
                  top: 10 - offset,
                  left: 150,
                  child: Text(
                    "$textTop",
                    style: kHeadingTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 35 - offset,
                  left: 150,
                  child: Text(
                    "$textBottom",
                    style: kHeadingTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                // I dont know why it can't work without container
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
