import 'package:doctor_app/components/custom_list_tile.dart';
import 'package:doctor_app/components/small_button.dart';
import 'package:doctor_app/controllers/doctor_profile_controller.dart';
import 'package:doctor_app/views/Login/login_screen.dart';
import 'package:doctor_app/views/doctor_profile/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Body extends GetWidget<DoctorProfileController> {
  bool turnOnNotification = false;
  bool turnOnLocation = false;
  final storage_ = GetStorage();

  @override
  Widget build(BuildContext context) {
    controller.fetchDoctor();
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Obx(
            () => Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3.0,
                                offset: Offset(0, 4.0),
                                color: Colors.black38),
                          ],
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/user.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${controller.doctor.value.first_name} ${controller.doctor.value.last_name}",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            "${controller.doctor.value.email}",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          SmallButton(
                              btnText: "Edit",
                              press: () {
                                Get.to(DoctorProfileScreen());
                              }),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Divider(),
                  ListTile(
                      leading: Icon(Icons.info, color: Colors.blue[800]),
                      title: Text('About'),
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      trailing: Icon(Icons.arrow_forward_ios, size: 15)),
                  ListTile(
                      leading: Icon(Icons.help, color: Colors.yellow[800]),
                      title: Text('Contact Support'),
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      trailing: Icon(Icons.arrow_forward_ios, size: 15)),
                  ListTile(
                      leading: Icon(Icons.privacy_tip, color: Colors.red[800]),
                      title: Text('Privacy Policy'),
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      trailing: Icon(Icons.arrow_forward_ios, size: 15)),
                  Divider(),
                  SizedBox(height: 50),
                  ListTile(
                      leading: Icon(Icons.logout, color: Colors.green[800]),
                      title: Text('Logout'),
                      onTap: () {
                        Get.defaultDialog(
                            title: "Confirm Logout",
                            textConfirm: "Yes",
                            textCancel: "No",
                            confirmTextColor: Colors.white,
                            barrierDismissible: false,
                            radius: 20,
                            content: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  ListTile(
                                      leading: Icon(Icons.info_sharp,
                                          color: Colors.blue[800], size: 40),
                                      title: Text(
                                          'Are you sure you want to Logout?'))
                                ],
                              ),
                            ),
                            onConfirm: () {
                              storage_.remove('is_logged');
                              storage_.remove('token');
                              storage_.remove('username');
                              Get.offAll(LoginScreen());
                            });
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
