// To parse this JSON data, do
//
//     final getNotificationsModel = getNotificationsModelFromJson(jsonString);

import 'dart:convert';

GetNotificationsModel getNotificationsModelFromJson(String str) => GetNotificationsModel.fromJson(json.decode(str));

String getNotificationsModelToJson(GetNotificationsModel data) => json.encode(data.toJson());

class GetNotificationsModel {
    final bool? success;
    final String? message;
    final List<Payload>? payload;

    GetNotificationsModel({
        this.success,
        this.message,
        this.payload,
    });

    factory GetNotificationsModel.fromJson(Map<String, dynamic> json) => GetNotificationsModel(
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
    final String? notification;

    Payload({
        this.notification,
    });

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        notification: json["notification"],
    );

    Map<String, dynamic> toJson() => {
        "notification": notification,
    };
}
