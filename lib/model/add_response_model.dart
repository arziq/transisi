// To parse this JSON data, do
//
//     final dataResponseModel = dataResponseModelFromJson(jsonString);

import 'dart:convert';

AddResponseModel AddResponseModelFromJson(String str) =>
    AddResponseModel.fromJson(json.decode(str));

String AddResponseModelToJson(AddResponseModel data) =>
    json.encode(data.toJson());

class AddResponseModel {
  AddResponseModel({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  String name;
  String job;
  String id;
  DateTime createdAt;

  factory AddResponseModel.fromJson(Map<String, dynamic> json) =>
      AddResponseModel(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
}
