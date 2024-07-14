import 'package:adminapp/helper/shared_preference.dart';
import 'package:adminapp/network/api_service.dart';
import 'package:adminapp/network/models/PawsomeResponse.dart';
import 'package:adminapp/utils/constants.dart';
import 'dart:developer' as dev;

import 'package:dio/dio.dart' as dio;

class HomeNetwork {
  static Future<PawsomeResponse?> getPawSomeData(
      String fromDate, String toDate) async {
    PawsomeResponse pawsomeResponse = PawsomeResponse();
    String token = await SharedPreference()
        .getStringPreference(PreferenceConstants.strToken);
    try {


      print('PROFILE PAGE API');
      Map<String, dynamic> requestParams = {
        "fromdate": fromDate,
        "todate": toDate,
      };
      ApiService apiService = ApiService(dio.Dio(), token: token);
      pawsomeResponse = await apiService.getPawSomeData(requestParams);
    } catch (e) {
      dev.log('CAUGHT PROFILE_PAGE_DETAILS_RESPONSE', error: e);
    }
    return pawsomeResponse;
  }
}
