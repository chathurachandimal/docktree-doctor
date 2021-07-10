import 'package:doctor_app/models/doctor.dart';
import 'package:doctor_app/services/doctor_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DoctorProfileController extends GetxController {
  var doctor = Doctor().obs;
  var isLoading = true.obs;
  DoctorService doc_service = new DoctorService();
  final storage_ = GetStorage();

  void fetchDoctor() async {
    try {
      isLoading(true);
      var doctor_ = await doc_service.findDoctor(storage_.read('doc_id'));
      if (doctor_ != null) {
        doctor.value = doctor_;
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
