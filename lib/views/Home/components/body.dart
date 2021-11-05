import 'package:doctor_app/components/header.dart';
import 'package:doctor_app/views/Home/components/quick_access_card.dart';
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
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -15),
                    blurRadius: 10,
                    color: Color(0xFFDADADA).withOpacity(0.3),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 10),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage('assets/images/uni_logo.jpg'),
                        ),
                        Text(
                          "  Unicef",
                          style: kTitleTextstyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    height: 178,
                    width: size.width,
                    child: Image.asset(
                      "assets/images/banner_1.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -15),
                    blurRadius: 10,
                    color: Color(0xFFDADADA).withOpacity(0.3),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 10),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage('assets/images/uni_logo.jpg'),
                        ),
                        Text(
                          "  Unicef",
                          style: kTitleTextstyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    height: 178,
                    width: size.width,
                    child: Image.asset(
                      "assets/images/banner_2.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -15),
                    blurRadius: 10,
                    color: Color(0xFFDADADA).withOpacity(0.3),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 10),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage('assets/images/uni_logo.jpg'),
                        ),
                        Text(
                          "  Unicef",
                          style: kTitleTextstyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    height: 178,
                    width: size.width,
                    child: Image.asset(
                      "assets/images/banner_3.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
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
      Get.to(PatientProfileScreen(),
          arguments: {"id": int.parse(this.qrCode.toString())});
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
