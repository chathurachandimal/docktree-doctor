class Auth {
  Auth({
    this.auth,
    this.token,
    this.user,
    this.doctor,
  });

  bool auth;
  String token;
  Map user;
  Map doctor;

  // factory Auth.fromJson(Map<String, dynamic> json) => Auth(
  //       auth: json["auth"],
  //       token: json["token"],
  //     );

  Map<String, dynamic> toJson() => {
        "auth": auth,
        "token": token,
        "user": user,
        "doctor": doctor,
      };

  // Auth fromJson(Map<String, dynamic> json) {
  //   auth = json["auth"];
  //   token = json["token"];
  // }

  Auth.fromJson(Map<String, dynamic> json)
      : auth = json['auth'],
        user = json['user'],
        doctor = json['doctor'],
        token = json['token'];
}
