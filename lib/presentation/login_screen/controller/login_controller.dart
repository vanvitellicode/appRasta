import 'dart:convert';

import 'package:rms/core/app_export.dart';
import 'package:rms/data/apiClient/api_client.dart';
import 'package:rms/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController emailInputField = TextEditingController();

  TextEditingController passwordInputField = TextEditingController();

  Rx<LoginModel> googleLoginModelObj = LoginModel().obs;

  Rx<bool> isShowPassword = true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailInputField.dispose();
    passwordInputField.dispose();
  }
  
  void onTapLogin()  {
    Get.toNamed(AppRoutes.homeScreen);
  }

  Future onTapLogin2() async {
    var response = await ApiClient().login(emailInputField.text, passwordInputField.text);
    if (response != null) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        googleLoginModelObj.update((val) {
          val!.fromJson(data);
        });
      }
    }

  }
}
