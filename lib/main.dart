import 'package:adminapp/helper/shared_preference.dart';
import 'package:adminapp/utils/constants.dart';
import 'package:adminapp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = await SharedPreference()
      .getBoolPreference(PreferenceConstants.blnIsLoggedIn);
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({super.key, required this.isLoggedIn});

  final RouteGenerator _routeGenerator = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Admin app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? "/DashboardScreen" : "/LoginScreen",
      onGenerateRoute: _routeGenerator.generateRoute,
    );
  }
}
