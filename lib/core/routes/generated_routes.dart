
import 'package:expence/features/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
    return null;
  }
}
