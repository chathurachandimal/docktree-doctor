import 'package:doctor_app/models/auth.dart';
import 'package:doctor_app/services/auth_service.dart';
import 'package:doctor_app/views/welcome/welcome_screen.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  var authData = Auth().obs;
  AuthService auth_service = new AuthService();
  final storage_ = GetStorage();

  void login(String username, String password) async {
    try {
      if (username.isBlank || password.isBlank) {
        throw ('Invalid username or password');
      }
      Auth authData_ = await auth_service.login(username, password);
      if (authData_ != null && authData_.doctor != null) {
        storage_.write('is_logged', authData_.auth);
        storage_.write('username', authData_.doctor['first_name']);
        storage_.write('doc_id', authData_.doctor['id']);
        storage_.write('token', authData_.token);
        Get.off(WelcomeScreen());
      } else {
        throw ('Invalid username or password');
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
