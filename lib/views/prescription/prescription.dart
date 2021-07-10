import 'package:doctor_app/controllers/prescription_controller.dart';
import 'package:doctor_app/views/prescription/components/body.dart';
import 'package:doctor_app/views/prescription/components/check_out_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrescriptionScreen extends GetWidget<PrescriptionController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Column(
        children: [
          Text(
            "Prescription",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${controller.prescription_drugs.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
