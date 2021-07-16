import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:doctor_app/constants.dart';
import 'package:doctor_app/models/auth.dart';
import 'package:doctor_app/models/doctor.dart';
import 'package:doctor_app/models/doctor_response.dart';
import 'package:doctor_app/models/opt.dart';
import 'package:doctor_app/models/user.dart';

class AuthService {
  Dio dio = Dio();
  final String authURL = 'http://54.179.2.162:8086/api/auth';
  final String registerURL = 'http://54.179.2.162:8088/api/doctor/withUser';
  final String optURL = 'http://54.179.2.162:8087/api/users/verification';

  Future<Auth> login(String username, String password) async {
    var res = await dio.post(authURL,
        data: {"email": username, "password": password}).catchError((e) {
      print(authURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      Map auth_ = res.data;
      if (auth_['auth']) {
        return new Auth(
            auth: auth_['auth'],
            token: auth_['token'],
            user: auth_['user'],
            doctor: auth_['doctor']);
      } else {
        throw ('Invalid username or password');
      }
    } else {
      throw ('Error ${res.statusCode}');
    }
  }

  Future<User> register(doctor) async {
    print(registerURL);
    var res = await dio.post(registerURL, data: doctor).catchError((e) {
      print(registerURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      Map user_ = json.decode(res.data);
      if (user_['user'] != null) {
        print(user_['user']['user_name']);
        String username = user_['user']['user_name'];
        String email = user_['user']['email'];
        return new User(user_name: username, email: email);
        // Doctor doctor = new Doctor();
        // return new DoctorResponse(user, doctor);
      } else {
        throw ('Something went wrong');
      }
    } else {
      throw ('Error ${res.statusCode}');
    }
  }

  Future<OPT> opt_verification(opt) async {
    print(optURL);
    var res = await dio.post(optURL, data: opt).catchError((e) {
      print(optURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      Map opt_ = json.decode(res.data);
      if (opt_ != null) {
        bool is_issued = opt_['is_issued'];
        String code = opt_['details']['code'];
        String used_at = opt_['details']['used_at'];
        String user_email = opt_['details']['user_email'];
        return new OPT(
            is_issued: is_issued,
            code: code,
            used_at: used_at,
            user_email: user_email);
      } else {
        throw ('Something went wrong');
      }
    } else {
      throw ('Error ${res.statusCode}');
    }
  }
}
