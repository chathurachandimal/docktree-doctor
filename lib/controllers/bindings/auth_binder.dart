import 'package:doctor_app/controllers/auth_controller.dart';
import 'package:doctor_app/controllers/doctor_controller.dart';
import 'package:doctor_app/controllers/doctor_profile_controller.dart';
import 'package:doctor_app/controllers/drug_list_controller.dart';
import 'package:doctor_app/controllers/opt_controller.dart';
import 'package:doctor_app/controllers/patient_controller.dart';
import 'package:doctor_app/controllers/patient_profile_controller.dart';
import 'package:doctor_app/controllers/prescription_controller.dart';
import 'package:doctor_app/controllers/referel_controller.dart';
import 'package:doctor_app/controllers/referel_list_controller.dart';
import 'package:doctor_app/controllers/register_controller.dart';
import 'package:doctor_app/controllers/welcome_controller.dart';
import 'package:get/instance_manager.dart';

class AuthBinder extends Bindings {
  @override
  void dependencies() {
    /** WELCOME */
    Get.lazyPut<WelcomeController>(() => WelcomeController());
    /** WELCOME */

    /** AUTH */
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<OptController>(() => OptController());
    /** AUTH */

    /** PATIENT */
    Get.lazyPut<PatientController>(() => PatientController());
    Get.lazyPut<PatientProfileController>(() => PatientProfileController());
    /** PATIENT */

    /** DOCTOR */
    Get.lazyPut<DoctorController>(() => DoctorController());
    Get.lazyPut<DoctorProfileController>(() => DoctorProfileController());
    /** DOCTOR */

    /** REFERRAL */
    Get.lazyPut<ReferelController>(() => ReferelController());
    Get.lazyPut<ReferelListController>(() => ReferelListController());
    /** REFERRAL */

    /** DRUG */
    Get.lazyPut<DrugListController>(() => DrugListController());
    /** DRUG */

    /** PRESCRIPTION */
    Get.lazyPut<PrescriptionController>(() => PrescriptionController());
    /** PRESCRIPTION */
  }
}
