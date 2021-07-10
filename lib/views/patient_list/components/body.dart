import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/patient_controller.dart';
import 'package:doctor_app/models/patient.dart';
import 'package:doctor_app/views/doctor_list/doctor_list.dart';
import 'package:doctor_app/views/drug_list/drug_list.dart';
import 'package:doctor_app/views/patient_add/patient_add.dart';
import 'package:doctor_app/views/patient_profile/patient_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class Body extends GetWidget<PatientController> {
  double offset = 0;

  @override
  Widget build(BuildContext context) {
    controller.fetchPatients();
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
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Get.to(PatientAddScreen());
                  },
                  child: Text(
                    "+ Register new patient",
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.w500),
                  ),
                ),
              ]),
        ),
        SizedBox(height: size.height * 0.01),
        Divider(),
        Expanded(child: Obx(
          () {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return RefreshIndicator(
                onRefresh: () {
                  onRefresh();
                },
                child: ListView.separated(
                  itemCount: controller.patients.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    // final item = items[index];
                    return ListCard(controller.patients[index]);
                  },
                ),
              );
            }
          },
        ))
      ],
    );
  }

  Future<Null> onRefresh() {
    controller.fetchPatients();
    return null;
  }
}

class ListCard extends StatelessWidget {
  final Patient patient;
  ListCard(this.patient);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(PatientProfileScreen(), arguments: {"id": patient.id});
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
              Text('${patient.first_name} ${patient.last_name}',
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
                    child: Text('-', maxLines: 1, overflow: TextOverflow.clip),
                  ),
                  SizedBox(width: 90),
                  GestureDetector(
                      onTap: () {
                        Get.to(DrugListScreen(),
                            arguments: {"patient_id": patient.id});
                      },
                      child: (Container(
                        //margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 5,
                              color: kShadowColor,
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.local_hospital, size: 12),
                                SizedBox(width: 5),
                                Text(
                                  'Prescription',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: kTextDarkColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ))),
                  SizedBox(width: 15),
                  GestureDetector(
                      onTap: () {
                        Get.to(DoctortListScreen(),
                            arguments: {"patient_id": patient.id});
                      },
                      child: (Container(
                        //margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 5,
                              color: kShadowColor,
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(Icons.note, size: 12),
                                SizedBox(width: 5),
                                Text(
                                  'Referral',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: kTextDarkColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ))),
                ],
              )
            ]),
          ),
          // IconButton(
          //   icon: Icon(Icons.arrow_right),
          //   onPressed: () {},
          // ),
        ]),
      ),
    );
  }
}
