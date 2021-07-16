class PrescriptionList {
  PrescriptionList({
    this.id,
    this.prescription_note,
    this.doctor_id,
    this.patient_id,
    this.status,
    this.createdAt,
  });

  int id;
  String prescription_note;
  Map doctor_id;
  Map patient_id;
  bool status;
  String createdAt;

  Map<String, dynamic> toJson() => {
        "id": id,
        "prescription_note": prescription_note,
        "doctor_id": doctor_id,
        "patient_id": patient_id,
        "status": status,
        "createdAt": createdAt,
      };

  PrescriptionList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        prescription_note = json['prescription_note'],
        doctor_id = json['doctor_id'],
        patient_id = json['patient_id'],
        status = json['status'],
        createdAt = json['createdAt'];
}
