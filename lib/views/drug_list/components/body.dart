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
import 'package:get/get.dart';

class Body extends GetWidget<DrugListController> {
  final TextEditingController drugController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int patient_id = Get.arguments['patient_id'];
    controller.fetchDrugs();
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen

    return ListView(children: <Widget>[
      SizedBox(height: 10.0),
      _buildSearchBar(),
      SizedBox(height: 20.0),
      _buildAddLink(size),
      SizedBox(height: 10.0),
      Divider(),
      _buildList(size, patient_id),
      SizedBox(height: 20.0),
    ]);
  }

  _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search drugs",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  _buildAddLink(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
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
                          hintText: "Drug name", controller: drugController),
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
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500),
          ),
        ),
      ]),
    );
  }

  Future<Null> onRefresh() {
    controller.fetchDrugs();
    return null;
  }

  _buildList(Size size, int patient_id) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return RefreshIndicator(
              onRefresh: () {
                onRefresh();
              },
              child: ListView.separated(
                shrinkWrap: true,
                primary: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.drugs.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  // final item = items[index];
                  return ListCard(size, controller.drugs[index], patient_id);
                },
              ));
        }
      },
    );
  }

  _buildFooter(int patient_id) {
    return Container(
      height: 200,
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

class ListCard extends GetWidget<PrescriptionController> {
  final TextEditingController abbrevationController = TextEditingController();
  final TextEditingController frequencyController = TextEditingController();
  final Size size;
  final Drug drug;
  final int patient_id;
  ListCard(this.size, this.drug, this.patient_id);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
          patient_id != 0
              ? RoundedIconBtn(
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
                )
              : Text("")
        ]),
      ),
    );
  }
}
