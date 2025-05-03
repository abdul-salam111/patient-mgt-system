// To parse this JSON data, do
//
//     final createStaffModel = createStaffModelFromJson(jsonString);

import 'dart:convert';

CreateStaffModel createStaffModelFromJson(String str) =>
    CreateStaffModel.fromJson(json.decode(str));

String createStaffModelToJson(CreateStaffModel data) =>
    json.encode(data.toJson());

class CreateStaffModel {
  final String? name;
  final String? email;
  final String? practiceId;
  final String? userName;
  final String? phone;
  final String? date;
  final String? password;
  final String? fax;
  final String? fillOutForm;
  final int? doctor_id;

  CreateStaffModel({
    this.name,
    this.email,
    this.practiceId,
    this.userName,
    this.phone,
    this.date,
    this.password,
    this.fax,
    this.fillOutForm,
    this.doctor_id,
  });

  factory CreateStaffModel.fromJson(Map<String, dynamic> json) =>
      CreateStaffModel(
          name: json["name"],
          email: json["email"],
          practiceId: json["practice_id"],
          userName: json["user_name"],
          phone: json["phone"],
          date: json["date"],
          password: json["password"],
          fax: json["fax"],
          fillOutForm: json["fill_out_form"],
          doctor_id: json["doctor_id"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "practice_id": practiceId,
        "user_name": userName,
        "phone": phone,
        "date": date,
        "password": password,
        "fax": fax,
        "fill_out_form": fillOutForm,
        "doctor_id": doctor_id
      };
}
