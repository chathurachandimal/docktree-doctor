import 'package:doctor_app/controllers/bindings/auth_binder.dart';
import 'package:doctor_app/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinder(),
      debugShowCheckedModeBanner: false,
      title: 'Tree Docker',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
      ),
      home: SplashScreen(),
    );
  }
}
