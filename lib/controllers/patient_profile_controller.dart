import 'package:doctor_app/models/patient.dart';
import 'package:doctor_app/services/patient_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class PatientProfileController extends GetxController {
  var patient = Patient().obs;
  var isLoading = true.obs;
  PatientService patient_service = new PatientService();

  void findPatient(int id) async {
    try {
      isLoading(true);
      Patient patient_ = await patient_service.findPatient(id);
      if (patient_ != null) {
        patient.value = patient_;
        print(patient);
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
