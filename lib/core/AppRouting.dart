import 'package:flutter/material.dart';
import 'package:freestyles/screens/LoginPage.dart';

import '../screens/CorporateWellnessPage.dart';
import '../screens/MyHomePage.dart';
import '../screens/Register.dart';

class AppRouting {
  static const home = "home";
  static const login = "login";
  static const register = "register";
  static const corporateWellness = "corporateWellness";

  static onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) {
          return MyHomePage(title: 'Flutter freestyles pages');
        });

      case login:
        return MaterialPageRoute(builder: (_) {
          return LoginPage();
        });
      case register:
        return MaterialPageRoute(builder: (_) {
          return RegisterPage();
        });
      case corporateWellness:
        return MaterialPageRoute(builder: (_) {
          return CorporateWellnessPage();
        });
    }
  }
}
