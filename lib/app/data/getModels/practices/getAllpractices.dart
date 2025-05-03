// To parse this JSON data, do
//
//     final getAllPractices = getAllPracticesFromJson(jsonString);

import 'dart:convert';

GetAllPractices getAllPracticesFromJson(String str) => GetAllPractices.fromJson(json.decode(str));

String getAllPracticesToJson(GetAllPractices data) => json.encode(data.toJson());

class GetAllPractices {
    final bool? success;
    final String? message;
    final List<Payload>? payload;

    GetAllPractices({
        this.success,
        this.message,
        this.payload,
    });

    factory GetAllPractices.fromJson(Map<String, dynamic> json) => GetAllPractices(
        success: json["success"],
        message: json["message"],
        payload: json["payload"] == null ? [] : List<Payload>.from(json["payload"]!.map((x) => Payload.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
    };
}

class Payload {
    final int? id;
    final String? name;
    final String? zipcode;
    final String? address;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Payload({
        this.id,
        this.name,
        this.zipcode,
        this.address,
        this.createdAt,
        this.updatedAt,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        name: json["name"],
        zipcode: json["zipcode"],
        address: json["address"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
