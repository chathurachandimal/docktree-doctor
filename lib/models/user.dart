class User {
  User({
    this.user_name,
    this.email,
  });

  String user_name;
  String email;
  // factory Auth.fromJson(Map<String, dynamic> json) => Auth(
  //       auth: json["auth"],
  //       token: json["token"],
  //     );

  Map<String, dynamic> toJson() => {
        "user_name": user_name,
        "email": email,
      };

  // Auth fromJson(Map<String, dynamic> json) {
  //   auth = json["auth"];ss
  //   token = json["token"];
  // }

  User.fromJson(Map<String, dynamic> json)
      : user_name = json['user_name'],
        email = json['email'];
}
