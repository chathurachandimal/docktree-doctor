import 'package:doctor_app/components/header.dart';
import 'package:doctor_app/views/Home/components/quick_access_card.dart';
import 'package:doctor_app/views/patient_list/patient_list.dart';
import 'package:doctor_app/views/patient_profile/patient_profile.dart';
import 'package:doctor_app/views/prescription_list/prescription_list.dart';
import 'package:doctor_app/views/referel_list/referel_list.dart';
import 'package:doctor_app/views/welcome/components/background.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Body extends StatelessWidget {
  final controller = ScrollController();
  String qrCode = 'Unknown';
  double offset = 0;
  final storage_ = GetStorage();
  //final patient_controller = Get.find<PatientController>();

  void onScroll() {
    offset = (controller.hasClients) ? controller.offset : 0;
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(onScroll);
    //patient_controller.fetchPatients();
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Header(
              image: "assets/icons/drcorona.svg",
              textTop: "Hello,",
              textBottom: "Dr. ${storage_.read('username')}",
              offset: offset,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon:
                              SvgPicture.asset("assets/icons/qr-code-scan.svg"),
                          iconSize: 60,
                          onPressed: () {
                            scanQRCode();
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('tap to scan', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
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
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Quick Access",
                          style: kTitleTextstyle,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(15),
                        height: 115,
                        width: 115,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(60, 193, 250, 1),
                        ),
                        child: QuickAccessCard(
                            svgSrc: "assets/images/referral.png",
                            title: "Referrals",
                            size: 50,
                            screen_: ReferelListScreen()),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(15),
                        height: 115,
                        width: 115,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(202, 245, 95, 1),
                        ),
                        child: QuickAccessCard(
                            svgSrc: "assets/images/prescription.png",
                            title: "Prescription",
                            size: 50,
                            screen_: PrescriptionListScreen()),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(15),
                        height: 115,
                        width: 115,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(242, 120, 124, 1),
                        ),
                        child: QuickAccessCard(
                          svgSrc: "assets/images/investigation.png",
                          title: "Investigation",
                          size: 50,
                          //screen_: PatientListScreen()
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.white,
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
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Spread of Virus",
                        style: kTitleTextstyle,
                      ),
                      Text(
                        "See details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
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
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      //  if (!mounted) return;

      this.qrCode = qrCode;
      Get.to(PatientProfileScreen(), arguments: {"id": this.qrCode});
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
