import 'package:adminapp/helper/shared_preference.dart';
import 'package:adminapp/network/api_service.dart';
import 'package:adminapp/network/models/LoginResponse.dart';
import 'package:adminapp/utils/constants.dart';
import 'dart:developer' as dev;

import 'package:dio/dio.dart' as dio;
class LoginNetwork{

  static Future<LoginResponse> login(String email, String password) async {
    LoginResponse loginResponse = LoginResponse();

    try {
      print('PROFILE PAGE API');
      Map<String, dynamic> requestParams = {
        "useremail": email,
        "password": password,
      };
      ApiService apiService = ApiService(dio.Dio());
      loginResponse = await apiService.login(requestParams);
      SharedPreference().putStringPreference(
          PreferenceConstants.strToken,  loginResponse.token);
      SharedPreference().putBoolPreference(
          PreferenceConstants.blnIsLoggedIn, true);
    } catch (e) {
      dev.log('CAUGHT PROFILE_PAGE_DETAILS_RESPONSE', error: e);
    }
    return loginResponse;
  }
}