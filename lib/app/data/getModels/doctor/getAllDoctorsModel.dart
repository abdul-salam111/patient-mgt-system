// To parse this JSON data, do
//
//     final getAllDoctorsModel = getAllDoctorsModelFromJson(jsonString);

import 'dart:convert';

GetAllDoctorsModel getAllDoctorsModelFromJson(String str) =>
    GetAllDoctorsModel.fromJson(json.decode(str));

String getAllDoctorsModelToJson(GetAllDoctorsModel data) =>
    json.encode(data.toJson());

class GetAllDoctorsModel {
  final bool? success;
  final String? message;
  final List<Payload>? payload;

  GetAllDoctorsModel({
    this.success,
    this.message,
    this.payload,
  });

  factory GetAllDoctorsModel.fromJson(Map<String, dynamic> json) =>
      GetAllDoctorsModel(
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
  final Practice? practice;

  Payload({
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
    this.practice,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
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
        practice: json["practice"] == null
            ? null
            : Practice.fromJson(json["practice"]),
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
        "practice": practice?.toJson(),
      };
}

class Practice {
  final int? id;
  final String? name;
  final String? zipcode;
  final String? address;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Practice({
    this.id,
    this.name,
    this.zipcode,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory Practice.fromJson(Map<String, dynamic> json) => Practice(
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "zipcode": zipcode,
        "address": address,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
