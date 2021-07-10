import 'package:doctor_app/models/opt.dart';
import 'package:doctor_app/services/auth_service.dart';
import 'package:doctor_app/views/Login/login_screen.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class OptController extends GetxController {
  var authData = OPT().obs;
  AuthService auth_service = new AuthService();

  void checkOpt(opt) async {
    try {
      OPT registerData = await auth_service.opt_verification(opt);
      if (registerData != null && !registerData.is_issued) {
        Get.snackbar("Success", "Your account has been verified",
            snackPosition: SnackPosition.BOTTOM);

        var future = new Future.delayed(
            const Duration(milliseconds: 2000), () => Get.off(LoginScreen()));
      } else {
        Get.snackbar(
          "Info",
          'Invalid varification code.',
          snackPosition: SnackPosition.BOTTOM,
        );
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
