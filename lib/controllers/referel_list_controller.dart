import 'package:doctor_app/models/referel.dart';
import 'package:doctor_app/models/referel_list.dart';
import 'package:doctor_app/services/referel_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ReferelListController extends GetxController {
  var referels = List<ReferelList>().obs;
  var isLoading = true.obs;
  ReferelService referel_service = new ReferelService();
  final storage_ = GetStorage();

  void fetchRreferels() async {
    try {
      isLoading(true);
      var referels_ = await referel_service.fetchReferels(storage_.read('doc_id'));
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
