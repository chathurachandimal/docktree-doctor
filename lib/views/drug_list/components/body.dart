import 'package:doctor_app/components/rounded_button.dart';
import 'package:doctor_app/components/rounded_icon_btn.dart';
import 'package:doctor_app/components/rounded_input_field.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/drug_list_controller.dart';
import 'package:doctor_app/controllers/prescription_controller.dart';
import 'package:doctor_app/models/drug.dart';
import 'package:doctor_app/models/prescription.dart';
import 'package:doctor_app/size_config.dart';
import 'package:doctor_app/views/prescription/prescription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Body extends GetWidget<DrugListController> {
  final TextEditingController drugController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int patient_id = Get.arguments['patient_id'];
    controller.fetchDrugs();
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
        SizedBox(height: size.height * 0.01),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                        title: "Add Drug",
                        textConfirm: "Save",
                        textCancel: "Cancel",
                        confirmTextColor: Colors.white,
                        barrierDismissible: false,
                        radius: 20,
                        content: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              SizedBox(height: size.height * 0.01),
                              RoundedInputField(
                                  hintText: "Drug name",
                                  controller: drugController),
                            ],
                          ),
                        ),
                        onConfirm: () {
                          Drug product = new Drug(
                              drug_name: drugController.text,
                              abbreviation: "",
                              doctor_id: 0,
                              status: true);
                          controller.addNewDrug(product);
                          drugController.text = '';
                          //drug_list_controller.listLength.value += 1;
                          Get.back();
                        });
                  },
                  child: Text(
                    "+ Add new drug",
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.w500),
                  ),
                ),
              ]),
        ),
        SizedBox(height: size.height * 0.01),
        // Expanded(
        //     child: ListView.builder(
        //         itemCount: 5, itemBuilder: (context, index) => ListCard(size)))
        Expanded(child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: controller.drugs.length,
                itemBuilder: (context, index) =>
                    ListCard(size, controller.drugs[index]));
          }
        })),
        Container(
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
                  Get.to(PrescriptionScreen());
                },
              ),
              // Obx(() => Positioned(
              //       top: 5,
              //       right: 5,
              //       child: Container(
              //         height: getProportionateScreenWidth(16),
              //         width: getProportionateScreenWidth(16),
              //         decoration: BoxDecoration(
              //           color: Color(0xFFFF4848),
              //           shape: BoxShape.circle,
              //           border:
              //               Border.all(width: 1.5, color: Color(0xFFFF4848)),
              //         ),
              //         child: Center(
              //           child: Text(
              //             "${controller.listLength}",
              //             style: TextStyle(
              //               fontSize: getProportionateScreenWidth(10),
              //               height: 1,
              //               fontWeight: FontWeight.w600,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ))
            ]),
          ),
        )
      ],
    );
  }
}

class ListCard extends GetWidget<PrescriptionController> {
  final TextEditingController abbrevationController = TextEditingController();
  final TextEditingController frequencyController = TextEditingController();
  final Size size;
  final Drug drug;
  ListCard(this.size, this.drug);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/user.png'),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${drug.drug_name}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ]),
          )),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {
              Get.defaultDialog(
                  title: "Add Drug",
                  textConfirm: "Add to prescription",
                  textCancel: "Cancel",
                  confirmTextColor: Colors.white,
                  barrierDismissible: false,
                  radius: 20,
                  content: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('${drug.drug_name}'),
                          ],
                        ),
                        SizedBox(height: size.height * 0.01),
                        RoundedInputField(
                            hintText: "Abbrevation",
                            controller: abbrevationController),
                        RoundedInputField(
                            hintText: "Frequency",
                            controller: frequencyController),
                      ],
                    ),
                  ),
                  onConfirm: () {
                    Prescription product = new Prescription(
                        drug_id: drug.id,
                        drug_name: drug.drug_name,
                        abbreviation: abbrevationController.text,
                        frequency: frequencyController.text);
                    controller.addProduct(product);
                    //drug_list_controller.listLength.value += 1;
                    Get.back();
                  });
            },
          ),
        ]),
      ),
    );
  }
}
