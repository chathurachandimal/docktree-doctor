class Prescription {
  Prescription(
      {this.drug_id, this.drug_name, this.abbreviation, this.frequency});

  int drug_id;
  String drug_name;
  String abbreviation;
  String frequency;

  // factory Auth.fromJson(Map<String, dynamic> json) => Auth(
  //       auth: json["auth"],
  //       token: json["token"],
  //     );

  Map<String, dynamic> toJson() => {
        "drug_id": drug_id,
        "drug_name": drug_name,
        "abbreviation": abbreviation,
        "frequency": frequency
      };

  // Auth fromJson(Map<String, dynamic> json) {
  //   auth = json["auth"];
  //   token = json["token"];
  // }

  Prescription.fromJson(Map<String, dynamic> json)
      : drug_id = json['drug_id'],
        drug_name = json['drug_name'],
        abbreviation = json['abbreviation'],
        frequency = json['frequency'];
}
