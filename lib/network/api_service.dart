import 'package:adminapp/network/models/LoginResponse.dart';
import 'package:adminapp/network/models/PawsomeResponse.dart';
import 'package:adminapp/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: baseUrl) //live link

abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl, String? token}) {
    dio.options = BaseOptions(
        receiveTimeout: const Duration(milliseconds: 60000),
        connectTimeout: const Duration(milliseconds: 60000),
        headers: {
          'Authorization': 'Bearer $token',
          "Content-Type": "application/json", // Assuming specific type needed
        });
    return _ApiService(dio, baseUrl: baseUrl,);
  }


  @POST('login')
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);

  @POST('pawsome/data')
  Future<PawsomeResponse> getPawSomeData(@Body() Map<String, dynamic> body);
}