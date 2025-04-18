
import 'package:Xpenso/features/homeScreen/home_screen.dart';
import 'package:Xpenso/features/splashScreen/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case "/splash":
        return MaterialPageRoute(builder: (context) => Splash());
    }
    return null;
  }
}
