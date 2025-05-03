// To parse this JSON data, do
//
//     final getAllChats = getAllChatsFromJson(jsonString);

import 'dart:convert';

GetAllChats getAllChatsFromJson(String str) =>
    GetAllChats.fromJson(json.decode(str));

String getAllChatsToJson(GetAllChats data) => json.encode(data.toJson());

class GetAllChats {
  final bool? success;
  final String? message;
  final List<Payload>? payload;

  GetAllChats({
    this.success,
    this.message,
    this.payload,
  });

  factory GetAllChats.fromJson(Map<String, dynamic> json) => GetAllChats(
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
  final dynamic latestMessage;
  final List<Role>? roles;

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
    this.latestMessage,
    this.roles,
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
        latestMessage: json["latest_message"],
        roles: json["roles"] == null
            ? []
            : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
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
        "latest_message": latestMessage,
        "roles": roles == null
            ? []
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
      };
}

class Role {
  final int? id;
  final String? name;
  final String? guardName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;

  Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        guardName: json["guard_name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guard_name": guardName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toJson(),
      };
}

class Pivot {
  final String? modelType;
  final int? modelId;
  final int? roleId;

  Pivot({
    this.modelType,
    this.modelId,
    this.roleId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        modelType: json["model_type"],
        modelId: json["model_id"],
        roleId: json["role_id"],
      );

  Map<String, dynamic> toJson() => {
        "model_type": modelType,
        "model_id": modelId,
        "role_id": roleId,
      };
}
