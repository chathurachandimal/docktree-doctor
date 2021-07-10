import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:doctor_app/models/referel.dart';

class ReferelService {
  Dio dio = Dio();
  final String newURL = 'http://54.179.2.162:8090/api/medical-service/referral';
  final String fetchURL =
      'http://54.179.2.162:8090/api/medical-service/referralByCreatedDoctor/';

  Future<Referel> newReferel(referel) async {
    print(newURL);
    var res = await dio.post(newURL, data: referel).catchError((e) {
      print(newURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      if (res.data != null) {
        return Referel.fromJson(json.decode(res.data));
      } else {
        throw ('Something went wrong');
      }
    } else {
      throw ('Error ${res.statusCode}');
    }
  }

  Future<List<Referel>> fetchReferels(doc_id) async {
    print(fetchURL + doc_id.toString());
    var res = await dio.get(fetchURL + doc_id.toString()).catchError((e) {
      print(fetchURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      return List<Referel>.from(
          json.decode(res.data).map((x) => Referel.fromJson(x)));
    } else {
      throw ('Error ${res.statusCode}');
    }
  }
}
