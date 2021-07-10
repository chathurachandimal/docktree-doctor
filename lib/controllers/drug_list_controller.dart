import 'package:doctor_app/models/drug.dart';
import 'package:doctor_app/services/drug_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DrugListController extends GetxController {
  var drugs = List<Drug>().obs;
  var isLoading = true.obs;
  var listLength = 0.obs;
  DrugService drug_service = new DrugService();
  final storage_ = GetStorage();

  void fetchDrugs() async {
    try {
      isLoading(true);
      var drugs_ = await drug_service.fetchDrugs(storage_.read('doc_id'));
      if (drugs_ != null) {
        drugs.assignAll(drugs_);
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

  void addNewDrug(drug) async {
    try {
      drug.doctor_id = storage_.read('doc_id');
      Drug drug_ = await drug_service.newDrug(drug);
      if (drug_ != null) {
        drugs.insert(0, drug_);
        update();
        Get.snackbar(
          "Success",
          "Drug has been added",
          snackPosition: SnackPosition.BOTTOM,
        );
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
