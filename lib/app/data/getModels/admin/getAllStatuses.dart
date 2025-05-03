// To parse this JSON data, do
//
//     final getAllStatusesModel = getAllStatusesModelFromMap(jsonString);

import 'dart:convert';

GetAllStatusesModel getAllStatusesModelFromMap(String str) =>
    GetAllStatusesModel.fromMap(json.decode(str));

String getAllStatusesModelToMap(GetAllStatusesModel data) =>
    json.encode(data.toMap());

class GetAllStatusesModel {
  List<Status>? statuses;

  GetAllStatusesModel({
    this.statuses,
  });

  factory GetAllStatusesModel.fromMap(Map<String, dynamic> json) =>
      GetAllStatusesModel(
        statuses:
            List<Status>.from(json["statuses"].map((x) => Status.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "statuses": List<dynamic>.from(statuses!.map((x) => x.toMap())),
      };
}

class Status {
  int id;
  String name;
  String createdAt;
  String updatedAt;
  List<dynamic> notificationPreference;

  Status({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.notificationPreference,
  });

  factory Status.fromMap(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        notificationPreference:
            List<dynamic>.from(json["notification_preference"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "notification_preference":
            List<dynamic>.from(notificationPreference.map((x) => x)),
      };
}
