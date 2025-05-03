// To parse this JSON data, do
//
//     final createCodeModel = createCodeModelFromJson(jsonString);

import 'dart:convert';

CreateCodeModel createCodeModelFromJson(String str) =>
    CreateCodeModel.fromJson(json.decode(str));

String createCodeModelToJson(CreateCodeModel data) =>
    json.encode(data.toJson());

class CreateCodeModel {
  final String? code;
  final String? description;

  CreateCodeModel({
    this.code,
    this.description,
  });

  factory CreateCodeModel.fromJson(Map<String, dynamic> json) =>
      CreateCodeModel(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
      };
}
