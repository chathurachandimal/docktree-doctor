class ReferelTemplateList {
  ReferelTemplateList({
    this.id,
    this.name,
    this.template,
    this.referel,
    this.doctor,
    this.patient,
    this.status,
    this.createdAt,
  });

  int id;
  String name;
  String template;
  Map referel;
  Map doctor;
  Map patient;
  bool status;
  String createdAt;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "template": template,
        "referel": referel,
        "doctor": doctor,
        "patient": patient,
        "status": status,
        "createdAt": createdAt,
      };

  ReferelTemplateList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        template = json['template'],
        referel = json['referral'],
        doctor = json['doctor'],
        status = json['status'],
        createdAt = json['createdAt'],
        patient = json['patient'];
}
