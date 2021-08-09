import 'package:doctor_app/controllers/auth_controller.dart';
import 'package:doctor_app/controllers/doctor_controller.dart';
import 'package:doctor_app/controllers/doctor_profile_controller.dart';
import 'package:doctor_app/controllers/drug_list_controller.dart';
import 'package:doctor_app/controllers/opt_controller.dart';
import 'package:doctor_app/controllers/patient_controller.dart';
import 'package:doctor_app/controllers/patient_profile_controller.dart';
import 'package:doctor_app/controllers/patient_quick_controller.dart';
import 'package:doctor_app/controllers/prescription_controller.dart';
import 'package:doctor_app/controllers/prescription_list_controller.dart';
import 'package:doctor_app/controllers/referel_controller.dart';
import 'package:doctor_app/controllers/referel_list_controller.dart';
import 'package:doctor_app/controllers/referel_list_toggle_controller.dart';
import 'package:doctor_app/controllers/referel_template_list_controller.dart';
import 'package:doctor_app/controllers/referel_view_controller.dart';
import 'package:doctor_app/controllers/register_controller.dart';
import 'package:doctor_app/controllers/welcome_controller.dart';
import 'package:get/instance_manager.dart';

class AuthBinder extends Bindings {
  @override
  void dependencies() {
    /** WELCOME */
    Get.put(WelcomeController());
    /** WELCOME */

    /** AUTH */
    Get.put(AuthController());
    Get.put(RegisterController());
    Get.put(OptController());
    /** AUTH */

    /** PATIENT */
    Get.put(PatientController());
    Get.put(PatientQuickController());
    Get.put(PatientProfileController());
    /** PATIENT */

    /** DOCTOR */
    Get.put(DoctorController());
    Get.put(DoctorProfileController());
    /** DOCTOR */

    /** REFERRAL */
    Get.put(ReferelController());
    Get.put(ReferelListController());
    Get.put(ReferelListToggleController());
    Get.put(ReferelTemplateListController());
    Get.put(ReferelViewController());
    /** REFERRAL */

    /** DRUG */
    Get.put(DrugListController());
    /** DRUG */

    /** PRESCRIPTION */
    Get.put(PrescriptionController());
    Get.put(PrescriptionListController());
    /** PRESCRIPTION */
  }
}
