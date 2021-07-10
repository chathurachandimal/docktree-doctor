import 'package:doctor_app/models/doctor.dart';
import 'package:doctor_app/models/user.dart';

class DoctorResponse {
  DoctorResponse(this.user, this.doctor);

  User user;
  Doctor doctor;
}
