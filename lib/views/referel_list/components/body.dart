import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/referel_list_controller.dart';
import 'package:doctor_app/models/referel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Body extends GetWidget<ReferelListController> {
  @override
  Widget build(BuildContext context) {
    controller.fetchRreferels();
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Column(
      children: <Widget>[
        Container(
            color: appBarBackgroundColor,
            child: Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 150,
                      color: appBarBackgroundColor.withOpacity(0.23),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        cursorColor: kTextDarkColor.withOpacity(0.5),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: kTextDarkColor.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          // surffix isn't working properly  with SVG
                          // thats why we use row
                          // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                        ),
                      ),
                    ),
                    SvgPicture.asset("assets/icons/search.svg"),
                  ],
                ),
              ),
            )),
        SizedBox(height: size.height * 0.01),
        Expanded(child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: controller.referels.length,
                itemBuilder: (context, index) =>
                    ListCard(controller.referels[index]));
          }
        }))
      ],
    );
  }
}

class ListCard extends StatelessWidget {
  final Referel referel;
  ListCard(this.referel);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Chathura Chandimal',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              SizedBox(height: 8),
              Opacity(
                opacity: 0.64,
                child: Text('Chathura Chandimal',
                    maxLines: 1, overflow: TextOverflow.clip),
              )
            ]),
          )),
          IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
