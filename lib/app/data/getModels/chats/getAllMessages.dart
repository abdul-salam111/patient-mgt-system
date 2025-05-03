// To parse this JSON data, do
//
//     final getAllMessages = getAllMessagesFromJson(jsonString);

import 'dart:convert';

GetAllMessages getAllMessagesFromJson(String str) => GetAllMessages.fromJson(json.decode(str));

String getAllMessagesToJson(GetAllMessages data) => json.encode(data.toJson());

class GetAllMessages {
    final bool? success;
    final String? message;
    final List<Payload>? payload;

    GetAllMessages({
        this.success,
        this.message,
        this.payload,
    });

    factory GetAllMessages.fromJson(Map<String, dynamic> json) => GetAllMessages(
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
    final int? senderId;
    final int? receiverId;
    final String? message;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Payload({
        this.id,
        this.senderId,
        this.receiverId,
        this.message,
        this.createdAt,
        this.updatedAt,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        message: json["message"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sender_id": senderId,
        "receiver_id": receiverId,
        "message": message,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
