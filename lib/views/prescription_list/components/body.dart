import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/prescription_list_controller.dart';
import 'package:doctor_app/models/prescription_list.dart';
import 'package:doctor_app/models/referel_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Body extends GetWidget<PrescriptionListController> {
  @override
  Widget build(BuildContext context) {
    controller.fetchPrescriptions();
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
                        onChanged: (value) {
                          if (value.length > 0) {
                            controller.searchPrescriptions(value);
                          } else {
                            controller.fetchPrescriptions();
                          }
                        },
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
                itemCount: controller.prescriptions.length,
                itemBuilder: (context, index) =>
                    ListCard(controller.prescriptions[index]));
          }
        }))
      ],
    );
  }
}

class ListCard extends StatelessWidget {
  final PrescriptionList referel;
  ListCard(this.referel);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Stack(
              fit: StackFit.expand,
              overflow: Overflow.visible,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/prescription.png'),
                )
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                  'for ${referel.patient_id['first_name']} ${referel.patient_id['last_name']}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              SizedBox(height: 8),
              Opacity(
                opacity: 0.64,
                child: Text('${referel.createdAt}',
                    maxLines: 1, overflow: TextOverflow.clip),
              )
            ]),
          )),
          // IconButton(
          //   icon: Icon(Icons.arrow_right),
          //   onPressed: () {},
          // ),
        ]),
      ),
    );
  }
}
