class OPT {
  OPT({
    this.is_issued,
    this.code,
    this.user_email,
    this.used_at,
  });

  bool is_issued;
  String code;
  String user_email;
  String used_at;

  Map<String, dynamic> toJson() => {
        "is_issued": is_issued,
        "code": code,
        "user_email": user_email,
        "used_at": used_at,
      };

  OPT.fromJson(Map<String, dynamic> json)
      : is_issued = json['is_issued'],
        code = json['code'],
        used_at = json['used_at'],
        user_email = json['user_email'];
}
