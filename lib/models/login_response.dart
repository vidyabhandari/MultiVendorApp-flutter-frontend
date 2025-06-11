// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final String id;
  final String username;
  final String email;
  final String fcm;
  final String phone;
  final bool phoneVerification;
  final String userType;
  final String profile;
  final String usertoken;

  LoginResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.fcm,
    required this.phone,
    required this.phoneVerification,
    required this.userType,
    required this.profile,
    required this.usertoken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    fcm: json["fcm"],
    phone: json["phone"],
    phoneVerification: json["phoneVerification"],
    userType: json["userType"],
    profile: json["profile"],
    usertoken: json["usertoken"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "email": email,
    "fcm": fcm,
    "phone": phone,
    "phoneVerification": phoneVerification,
    "userType": userType,
    "profile": profile,
    "usertoken": usertoken,
  };
}
