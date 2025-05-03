// To parse this JSON data, do
//
//     final createNewDoctor = createNewDoctorFromJson(jsonString);

import 'dart:convert';

CreateNewDoctor createNewDoctorFromJson(String str) => CreateNewDoctor.fromJson(json.decode(str));

String createNewDoctorToJson(CreateNewDoctor data) => json.encode(data.toJson());

class CreateNewDoctor {
    final String? name;
    final String? email;
    final int? practiceId;
    final String? userName;
    final String? phone;
    final String? date;
    final String? password;
    final String? fax;
    final int?fill_out_form;


    CreateNewDoctor({
        this.name,
        this.email,
        this.practiceId,
        this.userName,
        this.phone,
        this.date,
        this.password,
        this.fax,
        this.fill_out_form,
    });

    factory CreateNewDoctor.fromJson(Map<String, dynamic> json) => CreateNewDoctor(
        name: json["name"],
        email: json["email"],
        practiceId: json["practice_id"],
        userName: json["user_name"],
        phone: json["phone"],
        date: json["date"],
        password: json["password"],
        fax: json["fax"],
        fill_out_form:json["fill_out_form"]
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "practice_id": practiceId,
        "user_name": userName,
        "phone": phone,
        "date": date,
        "password": password,
        "fax": fax,
        "fill_out_form":fill_out_form
    };
}
