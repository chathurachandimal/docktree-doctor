import 'package:doctor_app/models/user.dart';
import 'package:doctor_app/services/auth_service.dart';
import 'package:doctor_app/views/opt/opt_screen.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var authData = User().obs;
  AuthService auth_service = new AuthService();

  void register(doctor) async {
    try {
      User registerData = await auth_service.register(doctor);
      if (registerData != null) {
        print(registerData);
        Get.off(OptScreen(), arguments: {'email': registerData.email});
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        "Woops",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
