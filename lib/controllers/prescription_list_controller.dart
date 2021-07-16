import 'package:doctor_app/models/prescription_list.dart';
import 'package:doctor_app/services/prescription_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PrescriptionListController extends GetxController {
  var prescriptions = List<PrescriptionList>().obs;
  var isLoading = true.obs;
  PrescriptionService rprescription_service = new PrescriptionService();
  final storage_ = GetStorage();

  void fetchPrescriptions() async {
    try {
      isLoading(true);
      var prescriptions_ = await rprescription_service
          .fetchPrescriptions(storage_.read('doc_id'));
      if (prescriptions_ != null) {
        prescriptions.assignAll(prescriptions_);
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
