import 'package:dio/dio.dart';
import 'package:doctor_app/models/doctor.dart';

class DoctorService {
  Dio dio = Dio();
  final String fetchURL = 'http://54.179.2.162:8088/api/doctor';

  Future<List<Doctor>> fetchDoctors() async {
    print(fetchURL);
    var res = await dio.get(fetchURL).catchError((e) {
      print(fetchURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      return List<Doctor>.from(res.data.map((x) => Doctor.fromJson(x)));
    } else {
      throw ('Error ${res.statusCode}');
    }
  }

  Future<Doctor> findDoctor(int id) async {
    print(fetchURL + '/$id');
    var res = await dio.get(fetchURL + '/$id').catchError((e) {
      print(fetchURL + '/$id');
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      return Doctor.fromJson(res.data);
      // List<Patient>.from(res.data.map((x) => Patient.fromJson(x)));
    } else {
      throw ('Error ${res.statusCode}');
    }
  }
}
