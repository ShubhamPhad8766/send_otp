// To parse this JSON data, do
//
//     final verifyModel = verifyModelFromJson(jsonString);

import 'dart:convert';

VerifyModel verifyModelFromJson(String str) => VerifyModel.fromJson(json.decode(str));

String verifyModelToJson(VerifyModel data) => json.encode(data.toJson());

class VerifyModel {
    String? status;
    Data? data;
    String? message;
    String? token;

    VerifyModel({
        this.status,
        this.data,
        this.message,
        this.token,
    });

    factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
        "token": token,
    };
}

class Data {
    bool? userExists;

    Data({
        this.userExists,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userExists: json["userExists"],
    );

    Map<String, dynamic> toJson() => {
        "userExists": userExists,
    };
}
