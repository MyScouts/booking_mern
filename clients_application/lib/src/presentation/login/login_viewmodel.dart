import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:flutter_app/src/resource/model/ApiResponse.dart';
import 'package:flutter_app/src/resource/model/login_model.dart';
import 'package:flutter_app/src/resource/repo/auth_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginViewModel extends BaseViewModel {
  bool rememberMe = false;
  // formGloble
  final GlobalKey<FormState> formKeyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // text editingcontroller
  final passwordController = new TextEditingController();
  final emailController = new TextEditingController();
  static AuthRepository authRespon = AuthRepository();
  ApiResponse<LoginModel> loginResult = new ApiResponse<LoginModel>();
  initial() async {}

  onRememberMe(value) {
    rememberMe = value;
    notifyListeners();
  }

  onSignIn() async {
    EasyLoading.show(status: 'loading...');
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email != "" && password != "") {
      loginResult =
          await authRespon.getLoginResponse(email: email, password: password);
      if (loginResult.status == 200) {
        EasyLoading.showSuccess('Great Success!');
        Get.offAllNamed(Routers.chatDetail);
      } else {
        EasyLoading.showError('Failed with Error');
      }
    } else {
      EasyLoading.showError('Failed with Error');
    }
  }
}
