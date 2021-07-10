class Drug {
  Drug({
    this.id,
    this.drug_name,
    this.abbreviation,
    this.createdAt,
    this.doctor_id,
    this.status,
  });

  int id;
  String drug_name;
  String abbreviation;
  String createdAt;
  int doctor_id;
  bool status;

  // factory Auth.fromJson(Map<String, dynamic> json) => Auth(
  //       auth: json["auth"],
  //       token: json["token"],
  //     );

  Map<String, dynamic> toJson() => {
        "id": id,
        "drug_name": drug_name,
        "abbreviation": abbreviation,
        "createdAt": createdAt,
        "doctor_id": doctor_id,
        "status": status,
      };

  // Auth fromJson(Map<String, dynamic> json) {
  //   auth = json["auth"];
  //   token = json["token"];
  // }

  Drug.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        drug_name = json['drug_name'],
        abbreviation = json['abbreviation'],
        createdAt = json['createdAt'],
        doctor_id = json['doctor_id'],
        status = json['status'];
}
