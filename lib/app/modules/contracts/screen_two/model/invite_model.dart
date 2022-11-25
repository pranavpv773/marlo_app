// To parse this JSON data, do
//
//     final inviteModel = inviteModelFromJson(jsonString);

import 'dart:convert';

InviteModel inviteModelFromJson(String str) =>
    InviteModel.fromJson(json.decode(str));

String inviteModelToJson(InviteModel data) => json.encode(data.toJson());

class InviteModel {
  InviteModel({
    this.errorFlag,
    this.message,
    this.data,
  });

  String? errorFlag;
  String? message;
  Datas? data;

  factory InviteModel.fromJson(Map<String, dynamic> json) => InviteModel(
        errorFlag: json["error_flag"],
        message: json["message"],
        data: Datas.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error_flag": errorFlag,
        "message": message,
        "data": data!.toJson(),
      };
}

class Datas {
  Datas({
    this.inviteId,
    this.email,
    this.role,
  });

  String? inviteId;
  String? email;
  String? role;

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
        inviteId: json["invite_id"],
        email: json["email"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "invite_id": inviteId,
        "email": email,
        "role": role,
      };
}
