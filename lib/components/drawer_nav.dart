import 'package:doctor_app/constants.dart';
import 'package:doctor_app/views/doctor_profile/doctor_profile.dart';
import 'package:doctor_app/views/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class DrawerNav extends StatelessWidget {
  final storage_ = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kBackgroundColor,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('Chathura Chandimal',
                    style: TextStyle(color: kTextDarkColor)),
                accountEmail: Text('info.chandimal@gmail.com',
                    style: TextStyle(color: kTextDarkColor)),
                currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                        child: Image.asset("assets/images/user.png",
                            height: 90, width: 90, fit: BoxFit.cover))),
                decoration: BoxDecoration(color: kBackgroundColor)),
            ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Dashboard'),
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                }),
            // ListTile(
            //     leading: Icon(Icons.local_hospital),
            //     title: Text('Patients'),
            //     onTap: () {
            //       Get.to(PatientListScreen());
            //     }),
            // ListTile(
            //     leading: Icon(Icons.supervised_user_circle),
            //     title: Text('Referals'),
            //     onTap: () {
            //       Get.to(ReferelListScreen());
            //     }),
            // ListTile(
            //     leading: Icon(Icons.medical_services), title: Text('Doctors')),
            ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Get.to(DoctorProfileScreen());
                }),
            Divider(),
            ListTile(leading: Icon(Icons.settings), title: Text('Preferences')),
            ListTile(leading: Icon(Icons.info), title: Text('About')),
            ListTile(leading: Icon(Icons.help), title: Text('Contact Support')),
            ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text('Privacy Policy')),
            Divider(),
            ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  storage_.remove('is_logged');
                  storage_.remove('token');
                  storage_.remove('username');
                  Get.offAll(LoginScreen());
                }),
          ],
        ),
      ),
    );
  }
}
