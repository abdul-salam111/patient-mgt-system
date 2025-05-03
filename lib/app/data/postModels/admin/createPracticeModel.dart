// To parse this JSON data, do
//
//     final createPracticeModel = createPracticeModelFromJson(jsonString);

import 'dart:convert';

CreatePracticeModel createPracticeModelFromJson(String str) => CreatePracticeModel.fromJson(json.decode(str));

String createPracticeModelToJson(CreatePracticeModel data) => json.encode(data.toJson());

class CreatePracticeModel {
    final String? name;
    final String? zipcode;
    final String? address;

    CreatePracticeModel({
        this.name,
        this.zipcode,
        this.address,
    });

    factory CreatePracticeModel.fromJson(Map<String, dynamic> json) => CreatePracticeModel(
        name: json["name"],
        zipcode: json["zipcode"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "zipcode": zipcode,
        "address": address,
    };
}
