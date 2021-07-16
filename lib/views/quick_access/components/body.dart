import 'package:doctor_app/constants.dart';
import 'package:doctor_app/views/doctor_list/doctor_list.dart';
import 'package:doctor_app/views/drug_list/drug_list.dart';
import 'package:doctor_app/views/patient_quick_list/patient_quick_list.dart';
import 'package:doctor_app/views/prescription_list/prescription_list.dart';
import 'package:doctor_app/views/referel_list/referel_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  double offset = 0;
  Items item1 = new Items(
      title: "Patients",
      subtitle: "Manage all patients",
      event: "3 Events",
      img: "assets/images/patient.png",
      screen_: PatientQuickListScreen());

  Items item2 = new Items(
      title: "Prescriptions",
      subtitle: "List all prescriptions",
      event: "4 Items",
      img: "assets/images/prescription_q.png",
      screen_: PrescriptionListScreen());
  Items item3 = new Items(
      title: "Referrals",
      subtitle: "List all referrals",
      event: "",
      img: "assets/images/referral.png",
      screen_: ReferelListScreen());
  Items item4 = new Items(
    title: "Investigations",
    subtitle: "coming soon",
    event: "",
    img: "assets/images/investigation.png",
  );
  Items item5 = new Items(
      title: "Drugs",
      subtitle: "Manage all drugs",
      event: "",
      img: "assets/images/drugs.png",
      screen_: DrugListScreen(),
      arg: {'patient_id': 0, 'title': 'Drugs'});
  Items item6 = new Items(
      title: "Doctors",
      subtitle: "List all doctors",
      event: "",
      img: "assets/images/doctor.png",
      screen_: DoctortListScreen(),
      arg: {'patient_id': 0, 'title': 'Doctors'});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    // This size provide us total height and width of our screen
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return GestureDetector(
            onTap: () {
              Get.to(data.screen_, arguments: data.arg);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30,
                    spreadRadius: 10,
                    color: kShadowColor,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: kTextDarkColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: kBodyTextColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  // SizedBox(
                  //   height: 14,
                  // ),
                  // Text(
                  //   data.event,
                  //   style: GoogleFonts.openSans(
                  //       textStyle: TextStyle(
                  //           color: Colors.white70,
                  //           fontSize: 11,
                  //           fontWeight: FontWeight.w600)),
                  // ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  StatelessWidget screen_;
  Map arg;
  Items(
      {this.title,
      this.subtitle,
      this.event,
      this.img,
      this.screen_,
      this.arg});
}
