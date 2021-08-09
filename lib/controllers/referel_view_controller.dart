import 'package:doctor_app/models/referel_list.dart';
import 'package:doctor_app/services/referel_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ReferelViewController extends GetxController {
  var referel = ReferelList().obs;
  var isLoading = true.obs;
  ReferelService referel_service = new ReferelService();

  void viewReferel(int id) async {
    try {
      isLoading(true);
      ReferelList registerData = await referel_service.fetchOneReferel(id);
      if (registerData != null) {
        referel.value = registerData;
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        "Woops",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }finally {
      isLoading(false);
    }
  }
}
