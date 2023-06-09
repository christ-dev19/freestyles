import 'package:flutter/material.dart';
import 'package:freestyles/screens/LoginPage.dart';

import '../screens/CorporateWellnessPage.dart';
import '../screens/DragableCustom.dart';
import '../screens/EventMobileApp/EventMobileApp1.dart';
import '../screens/EventMobileApp/EventMobileApp2.dart';
import '../screens/EventMobileApp/EventMobileApp3.dart';
import '../screens/FoodOrderingApp/FoodOrderingApp1.dart';
import '../screens/FoodOrderingApp/FoodOrderingApp2.dart';
import '../screens/FoodOrderingApp/FoodOrderingApp3.dart';
import '../screens/MyHomePage.dart';
import '../screens/RegisterPage.dart';

class AppRouting {
  static const home = "home";
  static const login = "login";
  static const register = "register";
  static const foodOrderingApp1 = "FoodOrderingApp1";
  static const foodOrderingApp2 = "FoodOrderingApp2";
  static const foodOrderingApp3 = "FoodOrderingApp3";
  static const corporateWellness = "corporateWellness";
  static const draggableCustom = "DragableCustom";
  static const eventMobileApp1 = "EventMobileApp1";
  static const eventMobileApp2 = "EventMobileApp2";
  static const eventMobileApp3 = "EventMobileApp3";

  static onGenerateRoute(RouteSettings settings) {
    debugPrint('settings ${settings.name}');

    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) {
          return const MyHomePage(title: 'Flutter freestyles pages');
        });

      case draggableCustom:
        return MaterialPageRoute(builder: (_) {
          return const DraggableCustom(title: "Draggable Custom");
        });

      case login:
        return MaterialPageRoute(builder: (_) {
          return const LoginPage();
        });
      case register:
        return MaterialPageRoute(builder: (_) {
          return const RegisterPage();
        });
      case corporateWellness:
        return MaterialPageRoute(builder: (_) {
          return const CorporateWellnessPage();
        });
      case foodOrderingApp1:
        return MaterialPageRoute(builder: (_) {
          return const FoodOrderingApp1();
        });
      case foodOrderingApp2:
        return MaterialPageRoute(builder: (_) {
          return const FoodOrderingApp2();
        });
      case eventMobileApp1:
        return MaterialPageRoute(builder: (_) {
          return const EventMobileApp1();
        });
      case eventMobileApp2:
        return MaterialPageRoute(builder: (_) {
          return const EventMobileApp2();
        });
      case eventMobileApp3:
        return MaterialPageRoute(builder: (_) {
          return const EventMobileApp3();
        });
      case foodOrderingApp3:
        return MaterialPageRoute(builder: (_) {
          return const FoodOrderingApp3();
        });
    }
  }
}
