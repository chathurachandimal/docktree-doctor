import 'package:doctor_app/models/prescription.dart';
import 'package:doctor_app/services/prescription_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PrescriptionController extends GetxController {
  var prescription_drugs = List<Prescription>().obs;
  var note = ''.obs;
  var isLoading = true.obs;
  PrescriptionService prescription_service = new PrescriptionService();
  final storage_ = GetStorage();

  void addProduct(product) {
    prescription_drugs.add(product);
  }

  void newPrescription(int patientId) async {
    try {
      Map pres = {
        "prescription": {
          "prescription_note": note.value,
          "doctor_id": storage_.read('doc_id'),
          "patient_id": patientId,
          "status": 1
        },
        "prescriptionDetails": prescription_drugs
      };
      var registerData = await prescription_service.newPrescription(pres);
      print(registerData);
      if (registerData != null) {
        //referels.insert(0, registerData);
        Get.snackbar("Success", "Prescription has been created",
            snackPosition: SnackPosition.BOTTOM);

        var future = new Future.delayed(
            const Duration(milliseconds: 2000), () => Get.back());
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
