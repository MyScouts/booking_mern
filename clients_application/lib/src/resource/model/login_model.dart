import 'dart:developer';

import 'package:flutter_app/src/resource/model/serializable.dart';
import 'package:flutter_app/src/resource/model/token_model.dart';
import 'package:flutter_app/src/resource/model/user_model.dart';

class LoginModel extends Serialzeliable {
  String? successToken;
  String? firstName;
  String? lastName;

  LoginModel({this.firstName, this.lastName, this.successToken});

  factory LoginModel.formJson(Map<String, dynamic> json) {
    return LoginModel(
        firstName: json['firstName'],
        lastName: json['lastName'],
        successToken: json['successToken']);
  }

  @override
  Map<String, dynamic> toJson() => {
        "successToken": this.successToken,
        "firstName": this.firstName,
        "lastName": this.lastName,
      };
}
