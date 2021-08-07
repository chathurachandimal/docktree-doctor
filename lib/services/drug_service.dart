import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:doctor_app/models/drug.dart';

class DrugService {
  Dio dio = Dio();
  final String newURL = 'http://54.179.2.162:8090/api/medical-service/drugs';
  final String fetchURL =
      'http://54.179.2.162:8090/api/medical-service/drugs/byDoctor/';
  final String searchURL =
      'http://54.179.2.162:8090/api/medical-service/drugs/search/';

  Future<Drug> newDrug(drug) async {
    print(newURL);
    var res = await dio.post(newURL, data: drug).catchError((e) {
      print(newURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      if (res.data != null) {
        Map drug_ = json.decode(res.data);
        return Drug.fromJson(drug_['drug']);
      } else {
        throw ('Something went wrong');
      }
    } else {
      throw ('Error ${res.statusCode}');
    }
  }

  Future<List<Drug>> fetchDrugs(doc_id) async {
    print(fetchURL + doc_id.toString());
    var res = await dio.get(fetchURL + doc_id.toString()).catchError((e) {
      print(fetchURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      return List<Drug>.from(
          json.decode(res.data).map((x) => Drug.fromJson(x)));
    } else {
      throw ('Error ${res.statusCode}');
    }
  }

  Future<List<Drug>> searchDrugs(int doc_id, String q) async {
    print(searchURL + q);
    var res = await dio.get(searchURL + q).catchError((e) {
      print(fetchURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      return List<Drug>.from(
          json.decode(res.data).map((x) => Drug.fromJson(x)));
    } else {
      throw ('Error ${res.statusCode}');
    }
  }
}
