import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:doctor_app/models/referel.dart';
import 'package:doctor_app/models/referel_leatest.dart';
import 'package:doctor_app/models/referel_list.dart';
import 'package:doctor_app/models/referel_template_list.dart';

class ReferelService {
  Dio dio = Dio();
  final String newURL = 'http://54.179.2.162:8090/api/medical-service/referral';
  final String fetchURL =
      'http://54.179.2.162:8090/api/medical-service/getReferralWithDoctorsAndPatientById/';
  final String searchURL =
      'http://54.179.2.162:8090/api/medical-service/referral/search/';
  final String newTemplateURL =
      'http://54.179.2.162:8090/api/medical-service/referralNoteTemplate';
  final String fetchTemplateURL =
      'http://54.179.2.162:8090/api/medical-service/referralNoteTemplateWithRefDocPatientByDoctorId/';
  final String fetchProfileURL =
      'http://54.179.2.162:8090/api/medical-service/getLastReferralByDoctorsAndPatient/';

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

  Future<Referel> newTemplate(template, referel) async {
    print(newTemplateURL);
    var res = await dio.post(newTemplateURL, data: template).catchError((e) {
      print(newTemplateURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      if (res.data != null) {
        var data = json.decode(res.data);
        referel["referral_note_template_id"] = data["referralTemplates"]["id"];
        return this.newReferel(referel);
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

  Future<List<ReferelList>> searchReferels(doc_id, String q) async {
    print(searchURL + q);
    var res = await dio.get(searchURL + q).catchError((e) {
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

  Future<List<ReferelTemplateList>> fetchReferelTemplates(doc_id) async {
    print(fetchTemplateURL + doc_id.toString());
    var res =
        await dio.get(fetchTemplateURL + doc_id.toString()).catchError((e) {
      print(fetchURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      return List<ReferelTemplateList>.from(
          res.data.map((x) => ReferelTemplateList.fromJson(x)));
    } else {
      throw ('Error ${res.statusCode}');
    }
  }

  Future<List<ReferelLeatest>> fetchReferelForProfile(
      doc_id, patient_id) async {
    print(fetchProfileURL + doc_id.toString() + "/" + patient_id.toString());
    var res = await dio
        .get(fetchProfileURL + doc_id.toString() + "/" + patient_id.toString())
        .catchError((e) {
      print(fetchURL);
      print(e);
      throw (e.message);
    });
    if (res.statusCode == 200) {
      return List<ReferelLeatest>.from(
          json.decode(res.data).map((x) => ReferelLeatest.fromJson(x)));
    } else {
      throw ('Error ${res.statusCode}');
    }
  }
}
