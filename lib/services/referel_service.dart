import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:doctor_app/models/referel.dart';
import 'package:doctor_app/models/referel_list.dart';

class ReferelService {
  Dio dio = Dio();
  final String newURL = 'http://54.179.2.162:8090/api/medical-service/referral';
  final String fetchURL =
      'http://54.179.2.162:8090/api/medical-service/getReferralWithDoctorsAndPatientById/';

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

  Future<List<ReferelList>> fetchReferels(doc_id) async {
    print(fetchURL + doc_id.toString());
    var res = await dio.get(fetchURL + doc_id.toString()).catchError((e) {
      print(fetchURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      return List<ReferelList>.from(
          res.data.map((x) => ReferelList.fromJson(x)));
    } else {
      throw ('Error ${res.statusCode}');
    }
  }
}
