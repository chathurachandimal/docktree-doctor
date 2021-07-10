import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/doctor_controller.dart';
import 'package:doctor_app/models/doctor.dart';
import 'package:doctor_app/views/referel_add/patient_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class Body extends GetWidget<DoctorController> {
  @override
  Widget build(BuildContext context) {
    controller.fetchDoctors();
    int patient_id = Get.arguments['patient_id'];
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
        SizedBox(height: size.height * 0.03),
        Expanded(child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemCount: controller.doctors.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                // final item = items[index];
                return ListCard(controller.doctors[index], patient_id);
              },
            );
          }
        }))
      ],
    );
  }
}

class ListCard extends StatelessWidget {
  final Doctor doctor;
  final int patient_id;
  ListCard(this.doctor, this.patient_id);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ReferelAddScreen(),
            arguments: {"doc_id": doctor.id, "patient_id": patient_id});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${doctor.first_name} ${doctor.last_name}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              // Opacity(
              //   opacity: 0.64,
              //   child: Text('700305', maxLines: 1, overflow: TextOverflow.clip),
              // ),
              //SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Opacity(
                    opacity: 0.64,
                    child: Text('${doctor.mobile}',
                        maxLines: 1, overflow: TextOverflow.clip),
                  ),
                ],
              )
            ]),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: () {
              Get.to(ReferelAddScreen(),
                  arguments: {"doc_id": doctor.id, "patient_id": patient_id});
            },
          ),
        ]),
      ),
    );
  }
}
