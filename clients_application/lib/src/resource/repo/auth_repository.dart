import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_app/src/resource/model/ApiResponse.dart';
import 'package:flutter_app/src/resource/model/login_model.dart';
import 'package:flutter_app/src/resource/model/secrect_model.dart';
import 'package:flutter_app/src/utils/app_pref.dart';
import 'package:flutter_app/src/utils/utils.dart';

class AuthRepository {
  AuthRepository._();

  static AuthRepository? _instance;

  factory AuthRepository() {
    if (_instance == null) _instance = AuthRepository._();
    return _instance!;
  }

// Get login
  Future<ApiResponse<LoginModel>> getLoginResponse({email, password}) async {
    String url = "auth/signin";
    try {
      Response response = await AppClients()
          .post(url, data: {'email': email, "password": password});
      ApiResponse<LoginModel> result = ApiResponse<LoginModel>.fromJson(
          response.data, (data) => LoginModel.formJson(data));
      AppPref.accessToken = result.data!.successToken;
      AppPref.firstName = result.data!.firstName;
      AppPref.lastName = result.data!.lastName;
      AppPref.email = email;
      return result;
    } catch (e) {
      return ApiResponse<LoginModel>();
    }
  }

  // check auth
  Future<int> checkAuthorization() async {
    String url = 'auth/serect';
    try {
      Response response = await AppClients().get(url);
      return response.data['status'];
    } catch (e) {
      return 400;
    }
  }
}
