import 'package:doctor_app/models/referel.dart';
import 'package:doctor_app/services/referel_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ReferelListController extends GetxController {
  var referels = List<Referel>().obs;
  var isLoading = true.obs;
  ReferelService referel_service = new ReferelService();

  void fetchRreferels() async {
    try {
      isLoading(true);
      var referels_ = await referel_service.fetchReferels(1);
      if (referels_ != null) {
        referels.assignAll(referels_);
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        "Woops",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }
}
