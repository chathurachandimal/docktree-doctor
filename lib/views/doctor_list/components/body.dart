import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/doctor_controller.dart';
import 'package:doctor_app/models/doctor.dart';
import 'package:doctor_app/size_config.dart';
import 'package:doctor_app/views/Home/components/background.dart';
import 'package:doctor_app/views/referel_add/referel_add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class Body extends GetWidget<DoctorController> {
  @override
  Widget build(BuildContext context) {
    controller.fetchDoctors();
    int patient_id = Get.arguments['patient_id'];
    String patient_name = Get.arguments['patient_name'];
    Size size = MediaQuery.of(context).size;

    return ListView(children: <Widget>[
      SizedBox(height: 10.0),
      _buildSearchBar(),
      SizedBox(height: 10.0),
      Divider(),
      _buildList(size, patient_id, patient_name),
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
            {controller.searchDoctors(value)}
          else
            {controller.fetchDoctors()}
        },
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

  _buildList(Size size, int patient_id, String patientName) {
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
                  return ListCard(
                      controller.doctors[index], patient_id, patientName);
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
  final String patientName;
  ListCard(this.doctor, this.patient_id, this.patientName);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (patient_id != 0) {
          Get.to(ReferelAddScreen(), arguments: {
            "doc_id": doctor.id,
            "patient_id": patient_id,
            "patient_name": patientName,
            "referDoc": doctor.first_name + ' ' + doctor.last_name,
            "note": ""
          });
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
                  // Opacity(
                  //   opacity: 0.64,
                  //   child: Text('${doctor.speciality.length}',
                  //       maxLines: 1, overflow: TextOverflow.clip),
                        
                  // ),
                   getTextWidgets(doctor.speciality)
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

  Widget getTextWidgets(List<dynamic> strings)
  {
    if(strings != null && strings.length > 0   ){
       return Wrap( spacing: 5 , runSpacing: 2,children:   strings.map((item) =>  new Text(item['speciality'] , style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)) ).toList() ) ; 
    }else{
      return new Row( children : [Text('',) ] );
    }
   
  }
}
