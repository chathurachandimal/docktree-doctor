import 'package:doctor_app/models/referel_template_list.dart';
import 'package:doctor_app/services/referel_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ReferelTemplateListController extends GetxController {
  var referelTemplates = List<ReferelTemplateList>().obs;
  var isLoading = true.obs;
  ReferelService referel_service = new ReferelService();
  final storage_ = GetStorage();

  void fetchRreferelTemplates() async {
    try {
      isLoading(true);
      var referelTemplates_ =
          await referel_service.fetchReferelTemplates(storage_.read('doc_id'));
      if (referelTemplates_ != null) {
        referelTemplates.assignAll(referelTemplates_);
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

  // void searchRreferels(String q) async {
  //   try {
  //     isLoading(true);
  //     var referels_ = await referel_service.searchReferels(storage_.read('doc_id'),q);
  //     if (referels_ != null) {
  //       referels.assignAll(referels_);
  //     }
  //   } catch (e) {
  //     print(e);
  //     Get.snackbar(
  //       "Woops",
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
