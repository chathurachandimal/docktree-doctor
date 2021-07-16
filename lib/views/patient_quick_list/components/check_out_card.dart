import 'package:doctor_app/components/rounded_button.dart';
import 'package:doctor_app/controllers/prescription_controller.dart';
import 'package:doctor_app/views/prescription/prescription.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';

class CheckoutCard extends GetWidget<PrescriptionController> {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int patient_id = Get.arguments['patient_id'];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.45),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.screenWidth * 0.15,
          right: SizeConfig.screenWidth * 0.15,
          bottom: getProportionateScreenWidth(40),
          top: getProportionateScreenWidth(15),
        ),
        child: Stack(overflow: Overflow.visible, children: [
          RoundedButton(
            text: "Go To Prescription",
            press: () {
              Get.to(PrescriptionScreen(),
                  arguments: {'patient_id': patient_id});
            },
          ),
        ]),
      ),
    );
  }
}
