import 'package:doctor_app/models/referel.dart';
import 'package:doctor_app/services/referel_service.dart';
import 'package:doctor_app/views/patient_list/patient_list.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ReferelController extends GetxController {
  var referels = List<Referel>().obs;
  ReferelService referel_service = new ReferelService();

  void newReferel(referel) async {
    try {
      Referel registerData = await referel_service.newReferel(referel);
      if (registerData != null) {
        referels.insert(0, registerData);
        Get.snackbar("Success", "Referral has been created",
            snackPosition: SnackPosition.BOTTOM);
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
