class Referel {
  Referel({
    this.id,
    this.referral_note,
    this.doctor_id,
    this.doctor_id_referral,
    this.patient_id,
    this.status,
    this.createdAt,
  });

  int id;
  String referral_note;
  int doctor_id;
  int doctor_id_referral;
  int patient_id;
  bool status;
  String createdAt;

  Map<String, dynamic> toJson() => {
        "id": id,
        "referral_note": referral_note,
        "doctor_id": doctor_id,
        "doctor_id_referral": doctor_id_referral,
        "patient_id": patient_id,
        "status": status,
        "createdAt": createdAt,
      };

  Referel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        referral_note = json['referral_note'],
        doctor_id = json['doctor_id'],
        patient_id = json['patient_id'],
        status = json['status'],
        createdAt = json['createdAt'],
        doctor_id_referral = json['doctor_id_referral'];
}
