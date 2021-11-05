import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/referel_list_controller.dart';
import 'package:doctor_app/controllers/referel_list_toggle_controller.dart';
import 'package:doctor_app/models/referel_list.dart';
import 'package:doctor_app/views/referel_view/referel_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Body extends GetWidget<ReferelListController> {
  @override
  Widget build(BuildContext context) {
    int action = Get.arguments['action'];
    controller.selectedIndex.value = action;
    controller.fetchRreferels();
    //List<bool> _selections = List.generate(2, (_) => false);

    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen

    return ListView(children: <Widget>[
      _buildSearchBar(),
      SizedBox(height: 10.0),
      Divider(),
      _buildList(size),
    ]);
  }

  _buildSearchBar() {
    return Container(
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
                    onChanged: (value) {
                      if (value.length > 0) {
                        controller.searchRreferels(value);
                      } else {
                        controller.fetchRreferels();
                      }
                    },
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
        ));
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
              itemCount: controller.referels.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                // final item = items[index];
                return ListCard(
                    controller.referels[index], controller.selectedIndex.value);
              },
            ),
          );
        }
      },
    );
  }

  Future<Null> onRefresh() {
    controller.fetchRreferels();
    return null;
  }

  _buildToggle(Size size) {
    return Center(
      child: ToggleButtons(
          children: <Widget>[
            Container(
                width: (size.width - 50) / 2,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "Added by me",
                    )
                  ],
                )),
            Container(
                width: (size.width - 50) / 2,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[new Text("For me")],
                )),
          ],
          isSelected: controller.selections,
          onPressed: (int index) {
            controller.selectedIndex.value = index;
            controller.selections[index] = !controller.selections[index];
            controller.fetchRreferels();
          },
          fillColor: kPrimaryColor,
          selectedColor: kTextFillColor),
    );
  }
}

class BuildToggle extends GetWidget<ReferelListToggleController> {
  final Size size;
  final ReferelListController refController = Get.find<ReferelListController>();

  BuildToggle(this.size);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
          child: ToggleButtons(
              children: <Widget>[
                Container(
                    width: (size.width - 50) / 2,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "Added by me",
                        )
                      ],
                    )),
                Container(
                    width: (size.width - 50) / 2,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[new Text("For me")],
                    )),
              ],
              isSelected: controller.selections,
              onPressed: (int index) {
                refController.selectedIndex.value = index;
                if (index == 0) {
                  controller.selections[0] = !controller.selections[0];
                  controller.selections[1] = !controller.selections[1];
                } else {
                  controller.selections[0] = !controller.selections[0];
                  controller.selections[1] = !controller.selections[1];
                }
                refController.fetchRreferels();
              },
              fillColor: kPrimaryColor,
              selectedColor: kTextFillColor),
        ));
  }
}

class ListCard extends StatelessWidget {
  final ReferelList referel;
  final int selectedindex;
  ListCard(this.referel, this.selectedindex);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ReferelViewScreen(), arguments: {"ref_id": referel.id});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                  '${selectedindex == 0 ? 'For' : 'By'} Dr. ${selectedindex == 0 ? referel.doctor_id_referral['first_name'] + ' ' + referel.doctor_id_referral['last_name'] : referel.doctor_id['first_name'] + ' ' + referel.doctor_id['last_name']}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              Opacity(
                opacity: 0.64,
                child: Text('${referel.referral_note}',
                    maxLines: 1, overflow: TextOverflow.clip),
              )
            ]),
          )),
          // IconButton(
          //   icon: Icon(Icons.arrow_right),
          //   onPressed: () {},
          // ),
        ]),
      ),
    );
  }
}
