// To parse this JSON data, do
//
//     final succesModel = succesModelFromJson(jsonString);

import 'dart:convert';

SuccesModel succesModelFromJson(String str) =>
    SuccesModel.fromJson(json.decode(str));

String succesModelToJson(SuccesModel data) => json.encode(data.toJson());

class SuccesModel {
  final bool status;
  final String message;

  SuccesModel({required this.status, required this.message});

  factory SuccesModel.fromJson(Map<String, dynamic> json) =>
      SuccesModel(status: json["status"], message: json["message"]);

  Map<String, dynamic> toJson() => {"status": status, "message": message};
}
