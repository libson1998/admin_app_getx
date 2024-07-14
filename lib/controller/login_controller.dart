import 'package:adminapp/helper/shared_preference.dart';
import 'package:adminapp/network/login_network/login_network.dart';
import 'package:adminapp/network/models/LoginResponse.dart';
import 'package:adminapp/ui/home/dashboard_screen.dart';
import 'package:adminapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isPasswordObscure = true.obs;
  RxBool isCheckBoxSelected = false.obs;
  RxString strEmail = "".obs;
  RxString strPassword = "".obs;
  var loginResponse = LoginResponse().obs;

  void login() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isLoading.value = true;

    });
    try {
      var response =
          await LoginNetwork.login(strEmail.value, strPassword.value);
      if (response.statuscode == 200) {
        print(response);
        loginResponse.value = response;
        String? token = loginResponse.value.token;
        loginResponse.value = response;

        Get.snackbar(
          "Success",
          response.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Get.off(DashboardScreen());
      } else if (response.statuscode == 401) {
        loginResponse.value = response;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
