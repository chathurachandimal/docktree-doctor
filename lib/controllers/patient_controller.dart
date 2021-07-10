import 'package:doctor_app/models/patient.dart';
import 'package:doctor_app/services/patient_service.dart';
import 'package:doctor_app/views/patient_list/patient_list.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class PatientController extends GetxController {
  var patients = List<Patient>().obs;
  var patient = Patient().obs;
  var isLoading = true.obs;
  PatientService patient_service = new PatientService();

  // @override
  // void onInit() {
  //   fetchPatients();
  //   super.onInit();
  // }

  void register(patient) async {
    try {
      Patient registerData = await patient_service.register(patient);
      if (registerData != null) {
        patients.insert(0, registerData);
        Get.snackbar("Success", "Patient has benn registered",
            snackPosition: SnackPosition.BOTTOM);
        var future = new Future.delayed(const Duration(milliseconds: 2000),
            () => Get.off(PatientListScreen()));
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

  void fetchPatients() async {
    try {
      isLoading(true);
      var patients_ = await patient_service.fetchPatients();
      if (patients_ != null) {
        patients.assignAll(patients_);
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
