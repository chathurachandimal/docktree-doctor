import 'package:doctor_app/constants.dart';
import 'package:doctor_app/controllers/welcome_controller.dart';
import 'package:doctor_app/views/Home/home_screen.dart';
import 'package:doctor_app/views/notification/notification.dart';
import 'package:doctor_app/views/patient_list/patient_list.dart';
import 'package:doctor_app/views/quick_access/quick_access.dart';
import 'package:doctor_app/views/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeScreen(),
                PatientListScreen(),
                QuickAccessScreen(),
                NotificationScreen(),
                SettingScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: appBarBackgroundColor,
            selectedItemColor: kPrimaryColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 10,
            items: [
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.home, label: 'Home', size: 22),
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.person_2, label: 'Ptients', size: 22),
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.add_circled,
                  label: 'Qiuck Access',
                  size: 30),
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.bell, label: 'Notification', size: 22),
              _bottomNavigationBarItem(
                  icon: CupertinoIcons.settings, label: 'Settings', size: 22),
            ],
          ),
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.dark,
        automaticallyImplyLeading: false,
        elevation: 0);
  }

  _bottomNavigationBarItem({IconData icon, String label, double size}) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: size),
      label: label,
    );
  }
}
