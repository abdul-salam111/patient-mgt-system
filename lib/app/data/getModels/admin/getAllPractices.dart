// To parse this JSON data, do
//
//     final getAllPractices = getAllPracticesFromJson(jsonString);

import 'dart:convert';

GetAllPractices getAllPracticesFromJson(String str) =>
    GetAllPractices.fromJson(json.decode(str));

String getAllPracticesToJson(GetAllPractices data) =>
    json.encode(data.toJson());

class GetAllPractices {
  final bool? success;
  final String? message;
  final List<Payload>? payload;

  GetAllPractices({
    this.success,
    this.message,
    this.payload,
  });

  factory GetAllPractices.fromJson(Map<String, dynamic> json) =>
      GetAllPractices(
        success: json["success"],
        message: json["message"],
        payload: json["payload"] == null
            ? []
            : List<Payload>.from(
                json["payload"]!.map((x) => Payload.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "payload": payload == null
            ? []
            : List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class Payload {
  final int? id;
  final String? name;
  final String? zipcode;
  final String? address;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Doctor>? doctor;

  Payload({
    this.id,
    this.name,
    this.zipcode,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.doctor,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        name: json["name"],
        zipcode: json["zipcode"],
        address: json["address"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        doctor: json["doctor"] == null
            ? []
            : List<Doctor>.from(json["doctor"]!.map((x) => Doctor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "zipcode": zipcode,
        "address": address,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "doctor": doctor == null
            ? []
            : List<dynamic>.from(doctor!.map((x) => x.toJson())),
      };
}

class Doctor {
  final int? id;
  final String? name;
  final String? userName;
  final String? email;
  final String? phone;
  final String? fax;
  final dynamic emailVerifiedAt;
  final String? originalPassword;
  final DateTime? date;
  final int? practiceId;
  final dynamic assignedDoctorId;
  final String? fillOutForm;
  final String? status;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic doctorId;

  Doctor({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.phone,
    this.fax,
    this.emailVerifiedAt,
    this.originalPassword,
    this.date,
    this.practiceId,
    this.assignedDoctorId,
    this.fillOutForm,
    this.status,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.doctorId,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        name: json["name"],
        userName: json["user_name"],
        email: json["email"],
        phone: json["phone"],
        fax: json["fax"],
        emailVerifiedAt: json["email_verified_at"],
        originalPassword: json["original_password"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        practiceId: json["practice_id"],
        assignedDoctorId: json["assigned_doctor_id"],
        fillOutForm: json["fill_out_form"],
        status: json["status"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        doctorId: json["doctor_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_name": userName,
        "email": email,
        "phone": phone,
        "fax": fax,
        "email_verified_at": emailVerifiedAt,
        "original_password": originalPassword,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "practice_id": practiceId,
        "assigned_doctor_id": assignedDoctorId,
        "fill_out_form": fillOutForm,
        "status": status,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "doctor_id": doctorId,
      };
}
