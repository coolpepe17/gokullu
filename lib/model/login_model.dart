// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.message,
    this.user,
  });

  Message message;
  List<User> user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: Message.fromJson(json["message"]),
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    this.message,
    this.messagelocal,
    this.status,
  });

  String message;
  String messagelocal;
  String status;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json["message"],
        messagelocal: json["messagelocal"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "messagelocal": messagelocal,
        "status": status,
      };
}

class User {
  User({
    this.emergencyContact1,
    this.emergencyContact2,
    this.emergencyName1,
    this.emergencyName2,
    this.idDeleted,
    this.loggedIn,
    this.trekkerAddress,
    this.trekkerGender,
    this.trekkerId,
    this.trekkerMobile,
    this.trekkerName,
    this.trekkerloggedIn,
  });

  String emergencyContact1;
  String emergencyContact2;
  String emergencyName1;
  String emergencyName2;
  String idDeleted;
  String loggedIn;
  String trekkerAddress;
  String trekkerGender;
  String trekkerId;
  String trekkerMobile;
  String trekkerName;
  dynamic trekkerloggedIn;

  factory User.fromJson(Map<String, dynamic> json) => User(
        emergencyContact1: json["emergencyContact1"],
        emergencyContact2: json["emergencyContact2"],
        emergencyName1: json["emergencyName1"],
        emergencyName2: json["emergencyName2"],
        idDeleted: json["idDeleted"],
        loggedIn: json["loggedIn"],
        trekkerAddress: json["trekkerAddress"],
        trekkerGender: json["trekkerGender"],
        trekkerId: json["trekkerId"],
        trekkerMobile: json["trekkerMobile"],
        trekkerName: json["trekkerName"],
        trekkerloggedIn: json["trekkerloggedIn"],
      );

  Map<String, dynamic> toJson() => {
        "emergencyContact1": emergencyContact1,
        "emergencyContact2": emergencyContact2,
        "emergencyName1": emergencyName1,
        "emergencyName2": emergencyName2,
        "idDeleted": idDeleted,
        "loggedIn": loggedIn,
        "trekkerAddress": trekkerAddress,
        "trekkerGender": trekkerGender,
        "trekkerId": trekkerId,
        "trekkerMobile": trekkerMobile,
        "trekkerName": trekkerName,
        "trekkerloggedIn": trekkerloggedIn,
      };
}
