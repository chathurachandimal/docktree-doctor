import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:doctor_app/models/patient.dart';

class PatientService {
  Dio dio = Dio();
  final String registerURL = 'http://54.179.2.162:8089/api/patient';
  final String fetchURL = 'http://54.179.2.162:8089/api/patient';
  final String searchURL = 'http://54.179.2.162:8089/api/patient/search';
  final String findURL = 'http://54.179.2.162:8089/api/patient';

  Future<Patient> register(patient) async {
    print(registerURL);
    var res = await dio.post(registerURL, data: patient).catchError((e) {
      print(registerURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      Map patient_ = json.decode(res.data);
      if (patient_['patient'] != null) {
        print(patient_['patient']['first_name']);
        String first_name = patient_['patient']['first_name'];
        String last_name = patient_['patient']['last_name'];
        String mobile = patient_['patient']['mobile'];
        String age = patient_['patient']['age'];
        String allergies = patient_['patient']['allergies'];
        return new Patient(
            first_name: first_name,
            last_name: last_name,
            mobile: mobile,
            age: age,
            allergies: allergies);
      } else {
        throw ('Something went wrong');
      }
    } else {
      throw ('Error ${res.statusCode}');
    }
  }

  Future<List<Patient>> fetchPatients() async {
    print(fetchURL);
    var res = await dio.get(fetchURL).catchError((e) {
      print(registerURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      return List<Patient>.from(res.data.map((x) => Patient.fromJson(x)));
    } else {
      throw ('Error ${res.statusCode}');
    }
  }

  Future<List<Patient>> searchPatients(String q) async {
    print(searchURL + "/" + q);
    var res = await dio.get(searchURL + "/" + q).catchError((e) {
      print(registerURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      return List<Patient>.from(res.data.map((x) => Patient.fromJson(x)));
    } else {
      throw ('Error ${res.statusCode}');
    }
  }

  Future<Patient> findPatient(int id) async {
    print(findURL + '/$id');
    var res = await dio.get(findURL + '/$id').catchError((e) {
      print(findURL + '/$id');
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      return Patient.fromJson(res.data);
      // List<Patient>.from(res.data.map((x) => Patient.fromJson(x)));
    } else {
      throw ('Error ${res.statusCode}');
    }
  }
}
