import 'package:doctor_app/components/rounded_input_area_field.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/referel_template_list_controller.dart';
import 'package:doctor_app/models/referel_template_list.dart';
import 'package:doctor_app/views/referel_add/referel_add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Body extends GetWidget<ReferelTemplateListController> {
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  final TextEditingController note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.fetchRreferelTemplates();

    int patient_id = Get.arguments['patient_id'];
    int doc_id = Get.arguments['doc_id'];
    String patientName = Get.arguments['patient_name'];
    String referDoc = Get.arguments['referDoc'];

    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Column(
      children: <Widget>[
        // Container(
        //     color: appBarBackgroundColor,
        //     child: Positioned(
        //       bottom: 0,
        //       left: 0,
        //       right: 0,
        //       child: Container(
        //         alignment: Alignment.center,
        //         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //         padding: EdgeInsets.symmetric(horizontal: 20),
        //         height: 40,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(20),
        //           boxShadow: [
        //             BoxShadow(
        //               offset: Offset(0, 10),
        //               blurRadius: 150,
        //               color: appBarBackgroundColor.withOpacity(0.23),
        //             ),
        //           ],
        //         ),
        //         child: Row(
        //           children: <Widget>[
        //             Expanded(
        //               child: TextField(
        //                 onChanged: (value) {
        //                   if (value.length > 0) {
        //                     controller.searchRreferels(value);
        //                   } else {
        //                     controller.fetchRreferels();
        //                   }
        //                 },
        //                 cursorColor: kTextDarkColor.withOpacity(0.5),
        //                 decoration: InputDecoration(
        //                   hintText: "Search",
        //                   hintStyle: TextStyle(
        //                     color: kTextDarkColor.withOpacity(0.5),
        //                   ),
        //                   enabledBorder: InputBorder.none,
        //                   focusedBorder: InputBorder.none,
        //                   // surffix isn't working properly  with SVG
        //                   // thats why we use row
        //                   // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
        //                 ),
        //               ),
        //             ),
        //             SvgPicture.asset("assets/icons/search.svg"),
        //           ],
        //         ),
        //       ),
        //     )),
        SizedBox(height: size.height * 0.01),
        // Expanded(child: Obx(() {
        //   if (controller.isLoading.value) {
        //     return Center(child: CircularProgressIndicator());
        //   } else {
        //     return ListView.builder(
        //         itemCount: controller.referelTemplates.length,
        //         itemBuilder: (context, index) => PreventCard(
        //             controller.referelTemplates[index],
        //             doc_id,
        //             patient_id,
        //             patientName,
        //             referDoc));
        //   }
        // }))

        Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            height: MediaQuery.of(context).size.height - 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("test tmp"),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height - 300,
                        child: Card(
                          color: Colors.white70,
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: (Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("20/22/2020",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)),
                                          SizedBox(height: size.height * 0.001),
                                          Text("Dr Chandi,",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500)),
                                          SizedBox(height: size.height * 0.01),
                                          Divider(),
                                          Text("Mr. Manee / 24 / M",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      ),
                                    ])),
                              ),
                              RoundedInputAreaField(
                                  hintText: "Note",
                                  maxLines: 12,
                                  icon: Icons.perm_contact_calendar,
                                  controller: note)
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }))
      ],
    );
  }
}

class PreventCard extends StatelessWidget {
  final ReferelTemplateList referel;
  final int doc_id;
  final int patient_id;
  final String patientName;
  final String referDoc;
  const PreventCard(this.referel, this.doc_id, this.patient_id,
      this.patientName, this.referDoc);

  @override
  Widget build(BuildContext context) {
    DateTime refDate = DateTime.parse(referel.createdAt);
    String formattedDate = DateFormat('dd/MM/yyyy').format(refDate);
    return GestureDetector(
        onTap: () {
          Get.to(ReferelAddScreen(), arguments: {
            "doc_id": doc_id,
            "patient_id": patient_id,
            "patient_name": patientName,
            "referDoc": referDoc,
            "note": referel.referel["referral_note"]
          });
        },
        child: (Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: 120,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 24,
                        color: kShadowColor,
                      ),
                    ],
                  ),
                ),
                // Image.asset(image),
                Positioned(
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    height: 136,
                    width: MediaQuery.of(context).size.width - 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          referel.name,
                          style: kTitleTextstyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          referel.referel["referral_note"],
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "${formattedDate}",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.bottomLeft,
                        //   child: SvgPicture.asset("assets/icons/forward.svg"),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
