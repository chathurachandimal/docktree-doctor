import 'dart:convert';

List<Patient> patientFromJson(String str) =>
    List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));

String patientToJson(List<Patient> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Patient {
  Patient({
    this.id,
    this.first_name,
    this.last_name,
    this.mobile,
    this.age,
    this.allergies,
    this.dob,
    this.userId,
    this.gender,
    this.about,
    this.patientTypeId,
    this.status,
    this.code,
    this.createdAt,
  });

  int id;
  String first_name;
  String last_name;
  String mobile;
  String age;
  String allergies;
  String email;
  DateTime dob;
  int userId;
  String gender;
  String about;
  int patientTypeId;
  bool status;
  String code;
  DateTime createdAt;

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": first_name,
        "last_name": last_name,
        "mobile": mobile,
        "age": age,
        "allergies": allergies,
      };

  Patient.fromJson(Map<String, dynamic> json)
      : first_name = json['first_name'],
        last_name = json['last_name'],
        id = json['id'],
        mobile = json['mobile'],
        age = json['age'],
        allergies = json['allergies'],
        dob = json["dob"] == null ? null : DateTime.parse(json["dob"]),
        createdAt = json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        userId = json["user_id"] == null ? null : json["user_id"],
        gender = json["gender"] == null ? null : json["gender"],
        about = json["about"] == null ? null : json["about"],
        patientTypeId = json["patient_type_id"],
        status = json["status"],
        code = json["code"];
}
