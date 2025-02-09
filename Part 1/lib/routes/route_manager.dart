import 'package:flutter/material.dart';
import '../views/login_view.dart';
import '../views/page1_view.dart';
import '../views/page2_view.dart';

class RouteManager {
  static const String initial = '/';
  static const String login = '/login';
  static const String page1 = '/page1';
  static const String page2 = '/page2';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
      case page1:
        return MaterialPageRoute(builder: (_) => const Page1());
      case page2:
        return MaterialPageRoute(builder: (_) => const Page2());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
