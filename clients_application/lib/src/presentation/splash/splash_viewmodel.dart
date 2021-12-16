import 'dart:developer';

import 'package:flutter_app/src/resource/model/ApiResponse.dart';
import 'package:flutter_app/src/resource/model/secrect_model.dart';
import 'package:flutter_app/src/resource/repo/auth_repository.dart';
import 'package:flutter_app/src/utils/app_pref.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class SplashViewModel extends BaseViewModel {
  static AuthRepository authRespon = AuthRepository();
  int _status = 400;
  init() async {
    _status = await authRespon.checkAuthorization();
    log("SERECT_MODEL: " + _status.toString());
    Future.delayed(Duration(seconds: 1), () => checkFirstRunApp());
  }

  checkFirstRunApp() async {
    EasyLoading.show(status: 'loading...');
    int? firtsInstall = AppPref.firstInstallApp;
    if (firtsInstall == 0) {
      EasyLoading.dismiss();
      Get.offAllNamed(Routers.onboarding);
    } else {
      EasyLoading.dismiss();
      var token = AppPref.accessToken;
      if (token != null || token != "") {
        if (_status == 200) {
          // Get.offAllNamed(Routers.chats, arguments: "akjdhdkajdhakh");
          Get.offAllNamed(Routers.home);
        } else {
          Get.offAllNamed(Routers.login);
        }
      } else {
        Get.offAllNamed(Routers.getStarted);
      }
    }
  }
}
