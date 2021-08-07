import 'package:doctor_app/models/patient.dart';
import 'package:doctor_app/models/referel_leatest.dart';
import 'package:doctor_app/services/patient_service.dart';
import 'package:doctor_app/services/referel_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PatientProfileController extends GetxController {
  var patient = Patient().obs;
  var isLoading = true.obs;
  var referels = List<ReferelLeatest>().obs;
  final storage_ = GetStorage();

  onInit() {
    print("patient init");
  }

  PatientService patient_service = new PatientService();
  ReferelService referel_service = new ReferelService();

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

  void fetchRreferels(int patient_id) async {
    try {
      // isLoading(true);
      var referels_ = await referel_service.fetchReferelForProfile(
          storage_.read('doc_id'), patient_id);
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
    }
  }
}
