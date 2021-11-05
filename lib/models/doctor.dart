class Doctor {
  Doctor({
    this.id,
    this.first_name,
    this.last_name,
    this.address,
    this.email,
    this.mobile,
    this.dob,
    this.user_id,
    this.status,
    this.speciality,
  });

  int id;
  String first_name;
  String last_name;
  String address;
  String email;
  String mobile;
  String dob;
  int user_id;
  bool status;
  List speciality;

  // factory Auth.fromJson(Map<String, dynamic> json) => Auth(
  //       auth: json["auth"],
  //       token: json["token"],
  //     );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": first_name,
        "last_name": last_name,
        "address": address,
        "email": email,
        "mobile": mobile,
        "dob": dob,
        "user_id": user_id,
        "status": status,
        "speciality": speciality,
      };

  // Auth fromJson(Map<String, dynamic> json) {
  //   auth = json["auth"];
  //   token = json["token"];
  // }

  Doctor.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        first_name = json['first_name'],
        last_name = json['last_name'],
        address = json['address'],
        email = json['email'],
        mobile = json['mobile'],
        dob = json['dob'],
        user_id = json['user_id'],
        status = json['status'],
        speciality = json['speciality'];
}
