import 'package:doctor_app/models/doctor.dart';
import 'package:doctor_app/services/doctor_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class DoctorController extends GetxController {
  var doctors = List<Doctor>().obs;
  var isLoading = true.obs;
  DoctorService doc_service = new DoctorService();

  void fetchDoctors() async {
    try {
      isLoading(true);
      var doctors_ = await doc_service.fetchDoctors();
      if (doctors_ != null) {
        doctors.assignAll(doctors_);
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
