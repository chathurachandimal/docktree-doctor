import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/patient_quick_controller.dart';
import 'package:doctor_app/models/patient.dart';
import 'package:doctor_app/size_config.dart';
import 'package:doctor_app/views/doctor_list/doctor_list.dart';
import 'package:doctor_app/views/drug_list/drug_list.dart';
import 'package:doctor_app/views/patient_add/patient_add.dart';
import 'package:doctor_app/views/patient_profile/patient_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends GetWidget<PatientQuickController> {
  final TextEditingController drugController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controller.fetchPatients();
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen

    return ListView(children: <Widget>[
      SizedBox(height: 20.0),
      _buildSearchBar(),
      SizedBox(height: 20.0),
      _buildAddLink(),
      SizedBox(height: 10.0),
      Divider(),
      _buildList(size),
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
        onChanged: (value) => {
          if (value.length > 0)
            {controller.searchPatients(value)}
          else
            {controller.fetchPatients()}
        },
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

  _buildAddLink() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        GestureDetector(
          onTap: () {
            Get.to(PatientAddScreen());
          },
          child: Text(
            "+ Register new patient",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500),
          ),
        ),
      ]),
    );
  }

  Future<Null> onRefresh() {
    controller.fetchPatients();
    return null;
  }

  _buildList(Size size) {
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
    );
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
                    child: Text('', maxLines: 1, overflow: TextOverflow.clip),
                  ),
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
                        Get.to(DoctortListScreen(), arguments: {
                          "patient_id": patient.id,
                          "patient_name":
                              patient.first_name + ' ' + patient.last_name
                        });
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
