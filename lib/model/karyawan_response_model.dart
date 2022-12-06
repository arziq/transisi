// To parse this JSON data, do
//
//     final karyawanResponseModel = karyawanResponseModelFromJson(jsonString);

import 'dart:convert';

KaryawanResponseModel karyawanResponseModelFromJson(String str) =>
    KaryawanResponseModel.fromJson(json.decode(str));

String karyawanResponseModelToJson(KaryawanResponseModel data) =>
    json.encode(data.toJson());

class KaryawanResponseModel {
  KaryawanResponseModel({
    required this.data,
  });

  List<Datum> data;

  factory KaryawanResponseModel.fromJson(Map<String, dynamic> json) =>
      KaryawanResponseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
