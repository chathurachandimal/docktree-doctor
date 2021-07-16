import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/doctor_controller.dart';
import 'package:doctor_app/models/doctor.dart';
import 'package:doctor_app/size_config.dart';
import 'package:doctor_app/views/referel_add/patient_add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class Body extends GetWidget<DoctorController> {
  @override
  Widget build(BuildContext context) {
    controller.fetchDoctors();
    int patient_id = Get.arguments['patient_id'];
    Size size = MediaQuery.of(context).size;

    return ListView(children: <Widget>[
      SizedBox(height: 10.0),
      _buildSearchBar(),
      SizedBox(height: 10.0),
      Divider(),
      _buildList(size, patient_id),
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
            hintText: "Search doctor",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  Future<Null> onRefresh() {
    controller.fetchDoctors();
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
                itemCount: controller.doctors.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  // final item = items[index];
                  return ListCard(controller.doctors[index], patient_id);
                },
              ));
        }
      },
    );
  }
}

class ListCard extends StatelessWidget {
  final Doctor doctor;
  final int patient_id;
  ListCard(this.doctor, this.patient_id);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (patient_id != 0) {
          Get.to(ReferelAddScreen(),
              arguments: {"doc_id": doctor.id, "patient_id": patient_id});
        }
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
              Text('${doctor.first_name} ${doctor.last_name}',
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
                    child: Text('${doctor.mobile}',
                        maxLines: 1, overflow: TextOverflow.clip),
                  ),
                ],
              )
            ]),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: () {
              Get.to(ReferelAddScreen(),
                  arguments: {"doc_id": doctor.id, "patient_id": patient_id});
            },
          ),
        ]),
      ),
    );
  }
}
