// To parse this JSON data, do
//
//     final getTechnicianModel = getTechnicianModelFromJson(jsonString);

import 'dart:convert';

GetTechnicianModel getTechnicianModelFromJson(String str) =>
    GetTechnicianModel.fromJson(json.decode(str));

String getTechnicianModelToJson(GetTechnicianModel data) =>
    json.encode(data.toJson());

class GetTechnicianModel {
  final bool? success;
  final String? message;
  final List<Payload>? payload;

  GetTechnicianModel({
    this.success,
    this.message,
    this.payload,
  });

  factory GetTechnicianModel.fromJson(Map<String, dynamic> json) =>
      GetTechnicianModel(
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
  final dynamic practiceId;
  final dynamic assignedDoctorId;
  final String? fillOutForm;
  final String? status;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic doctorId;
  final List<Type>? type;

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
    this.type,
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
        type: json["type"] == null
            ? []
            : List<Type>.from(json["type"]!.map((x) => Type.fromJson(x))),
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
        "type": type == null
            ? []
            : List<dynamic>.from(type!.map((x) => x.toJson())),
      };
}

class Type {
  final int? id;
  final int? technicianId;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Type({
    this.id,
    this.technicianId,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        technicianId: json["technician_id"],
        type: json["type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "technician_id": technicianId,
        "type": type,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
