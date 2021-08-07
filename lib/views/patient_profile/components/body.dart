import 'package:doctor_app/components/custom_list_tile.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/patient_profile_controller.dart';
import 'package:doctor_app/views/Home/components/quick_access_card.dart';
import 'package:doctor_app/views/doctor_list/doctor_list.dart';
import 'package:doctor_app/views/drug_list/drug_list.dart';
import 'package:doctor_app/views/patient_history/patient_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Body extends GetWidget<PatientProfileController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int id = Get.arguments['id'];
    controller.findPatient(id);
    controller.fetchRreferels(id);
    // String joinedDate =
    //     DateFormat('MMMM yyyy').format(profile.createdAt).toString();
    // print(joinedDate);
    // This size provide us total height and width of our screen
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Patient Profile",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3.0,
                                offset: Offset(0, 4.0),
                                color: Colors.black38),
                          ],
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/user.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${controller.patient.value.first_name} ${controller.patient.value.last_name}',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "User since ${DateFormat('MMMM yyyy').format(controller.patient.value.createdAt).toString()}",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          // SmallButton(btnText: "Edit"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "BASIC PROFILE",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          CustomListTile(
                              icon: Icons.person,
                              text:
                                  '${controller.patient.value.first_name} ${controller.patient.value.last_name}',
                              text2:
                                  'Age ${controller.patient.value.age ?? 'n/a'}'),
                          Divider(
                            height: 10.0,
                            color: Colors.grey,
                          ),
                          CustomListTile(
                            icon: Icons.phone,
                            text: '${controller.patient.value.mobile ?? '-'}',
                          ),
                          Divider(
                            height: 10.0,
                            color: Colors.grey,
                          ),
                          CustomListTile(
                            icon: Icons.people_alt_rounded,
                            text: '${controller.patient.value.gender ?? 'n/a'}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "PRIVATE INFORMATION",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                print('ABC');
                                //Get.to(screen_);
                              },
                              child: (Container(
                                //margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.only(left: 10, right: 10),
                                height: 40,
                                width: 205,
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
                                        Icon(Icons.accessibility_new, size: 25),
                                        SizedBox(width: 5),
                                        Text(
                                          'Request Sensitive Data',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                  color: kTextDarkColor,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "REFEREL NOTE",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        controller.referels.length > 0
                            ? 'Dr. ' +
                                controller.referels[0].doctor_id['first_name'] +
                                ' ' +
                                controller.referels[0].doctor_id['last_name']
                            : '-',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            controller.referels.length > 0
                                ? controller.referels[0].referral_note
                                : 'no any referels',
                            maxLines: 8,
                            style: TextStyle(height: 1.2, letterSpacing: 1.0)),
                      ]),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(20),
                        height: 130,
                        width: 115,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 30,
                              color: kShadowColor,
                            ),
                          ],
                        ),
                        child: QuickAccessCard(
                            svgSrc: "assets/images/investigation.png",
                            title: "History",
                            size: 50,
                            screen_: PatientHistoryScreen(),
                            arg_: {"patient_": id}),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(20),
                        height: 130,
                        width: 115,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 30,
                              color: kShadowColor,
                            ),
                          ],
                        ),
                        child: QuickAccessCard(
                            svgSrc: "assets/images/referral.png",
                            title: "Referral",
                            size: 50,
                            screen_: DoctortListScreen(),
                            arg_: {
                              "patient_": id,
                              "patient_name":
                                  controller.patient.value.first_name +
                                      ' ' +
                                      controller.patient.value.last_name
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(20),
                        height: 130,
                        width: 115,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 30,
                              color: kShadowColor,
                            ),
                          ],
                        ),
                        child: QuickAccessCard(
                          svgSrc: "assets/images/prescription.png",
                          size: 40,
                          title: "Prescription",
                          screen_: DrugListScreen(),
                          arg_: {"patient_": id},
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
