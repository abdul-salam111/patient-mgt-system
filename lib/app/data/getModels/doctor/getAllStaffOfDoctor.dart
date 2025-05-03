// To parse this JSON data, do
//
//     final getAllStaffOfDoctorModel = getAllStaffOfDoctorModelFromMap(jsonString);

import 'dart:convert';

GetAllStaffOfDoctorModel getAllStaffOfDoctorModelFromMap(String str) =>
    GetAllStaffOfDoctorModel.fromMap(json.decode(str));

String getAllStaffOfDoctorModelToMap(GetAllStaffOfDoctorModel data) =>
    json.encode(data.toMap());

class GetAllStaffOfDoctorModel {
  bool? success;
  String? message;
  List<Payload>? payload;

  GetAllStaffOfDoctorModel({
    this.success,
    this.message,
    this.payload,
  });

  factory GetAllStaffOfDoctorModel.fromMap(Map<String, dynamic> json) =>
      GetAllStaffOfDoctorModel(
        success: json["success"],
        message: json["message"],
        payload:
            List<Payload>.from(json["payload"].map((x) => Payload.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "payload": List<dynamic>.from(payload!.map((x) => x.toMap())),
      };
}

class Payload {
  int id;
  String name;
  String userName;
  String email;
  String phone;
  String fax;
  dynamic emailVerifiedAt;
  String originalPassword;
  DateTime date;
  int practiceId;
  dynamic assignedDoctorId;
  int fillOutForm;
  String status;
  String createdAt;
  String updatedAt;
  dynamic image;
  dynamic staffId;
  int doctorId;

  Payload({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.phone,
    required this.fax,
    required this.emailVerifiedAt,
    required this.originalPassword,
    required this.date,
    required this.practiceId,
    required this.assignedDoctorId,
    required this.fillOutForm,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.staffId,
    required this.doctorId,
  });

  factory Payload.fromMap(Map<String, dynamic> json) => Payload(
        id: json["id"],
        name: json["name"],
        userName: json["user_name"],
        email: json["email"],
        phone: json["phone"],
        fax: json["fax"],
        emailVerifiedAt: json["email_verified_at"],
        originalPassword: json["original_password"],
        date: DateTime.parse(json["date"]),
        practiceId: json["practice_id"],
        assignedDoctorId: json["assigned_doctor_id"],
        fillOutForm: json["fill_out_form"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        image: json["image"],
        staffId: json["staff_id"],
        doctorId: json["doctor_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "user_name": userName,
        "email": email,
        "phone": phone,
        "fax": fax,
        "email_verified_at": emailVerifiedAt,
        "original_password": originalPassword,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "practice_id": practiceId,
        "assigned_doctor_id": assignedDoctorId,
        "fill_out_form": fillOutForm,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "image": image,
        "staff_id": staffId,
        "doctor_id": doctorId,
      };
}
