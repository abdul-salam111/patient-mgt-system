import 'dart:convert';

CreateTechnicianModel createTechnicianModelFromJson(String str) =>
    CreateTechnicianModel.fromJson(json.decode(str));

String createTechnicianModelToJson(CreateTechnicianModel data) =>
    json.encode(data.toJson());

class CreateTechnicianModel {
  final String? name;
  final String? email;
  final String? practiceId;
  final String? userName;
  final String? phone;
  final String? date;
  final String? password;
  final String? fax;
  final List<String>? roles;

  // Unnamed constructor
  CreateTechnicianModel({
    this.name,
    this.email,
    this.practiceId,
    this.userName,
    this.phone,
    this.date,
    this.password,
    this.fax,
    this.roles,
  });

  // Named constructor can still exist
  CreateTechnicianModel.createTechnicianModel({
    this.name,
    this.email,
    this.practiceId,
    this.userName,
    this.phone,
    this.date,
    this.password,
    this.fax,
    this.roles,
  });

  factory CreateTechnicianModel.fromJson(Map<String, dynamic> json) =>
      CreateTechnicianModel(
          name: json["name"],
          email: json["email"],
          practiceId: json["practice_id"],
          userName: json["user_name"],
          phone: json["phone"],
          date: json["date"],
          password: json["password"],
          fax: json["fax"],
          roles: json['roles']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "practice_id": practiceId,
        "user_name": userName,
        "phone": phone,
        "date": date,
        "password": password,
        "fax": fax,
        "roles": roles,
      };
}
