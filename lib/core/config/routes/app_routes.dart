import 'package:flutter/material.dart';

import '../../../modules/dashboard/dashboard_screen.dart';
import '../../../modules/intro/intro_screen.dart';
import '../../../modules/navigation/navigation_screen.dart';

class AppRoutes {
  static const String intro = '/';
  static const String home = '/home';
  static const String navigation = '/navigation';

  static Map<String, WidgetBuilder> get routes {
    return {
      intro: (context) => IntroScreen(),
      home: (context) => DashboardScreen(),
      navigation: (context) => NavigationScreen(),
    };
  }
}
