 import 'package:adminapp/ui/home/dashboard_screen.dart';
import 'package:adminapp/ui/login_screen.dart';
import 'package:adminapp/ui/login_with_qr_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/LoginScreen":
        return MaterialPageRoute(
          builder: (context) =>   LoginScreen(),
        );
      case "/DashboardScreen":
        return MaterialPageRoute(
          builder: (context) =>   DashboardScreen(),
        );
      // case "/LoginWithQrScreen":
      //   return MaterialPageRoute(
      //     builder: (context) => const LoginWithQrScreen(),
      //   );
    }
    return null;
  }
}
