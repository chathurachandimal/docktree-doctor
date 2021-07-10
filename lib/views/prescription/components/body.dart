import 'package:doctor_app/controllers/prescription_controller.dart';
import 'package:doctor_app/size_config.dart';
import 'package:doctor_app/views/prescription/components/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Body extends GetWidget<PrescriptionController> {
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.prescription_drugs.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key(index.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  // setState(() {
                  //   demoCarts.removeAt(index);
                  // });
                },
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg"),
                    ],
                  ),
                ),
                child: CartCard(controller.prescription_drugs[index]),
              ),
            ),
          ),
        ));
  }
}
