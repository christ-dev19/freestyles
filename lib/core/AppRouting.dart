import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:freestyles/screens/LoginPage.dart';

import '../screens/CorporateWellnessPage.dart';
import '../screens/CorporateWellnessWithModalPage.dart';
import '../screens/DragableCustom.dart';
import '../screens/FoodOrderingApp/FoodOrderingApp1.dart';
import '../screens/FoodOrderingApp/FoodOrderingApp2.dart';
import '../screens/MyHomePage.dart';
import '../screens/RegisterPage.dart';

class AppRouting {
  static const home = "home";
  static const login = "login";
  static const register = "register";
  static const foodOrderingApp1 = "FoodOrderingApp1";
  static const foodOrderingApp2 = "FoodOrderingApp2";
  static const corporateWellness = "corporateWellness";
  static const corporateWellnessWithModalPage =
      "CorporateWellnessWithModalPage";
  static const draggableCustom = "DragableCustom";

  static onGenerateRoute(RouteSettings settings) {
    developer.log('${settings.name}', name: "settings");

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
          return LoginPage();
        });
      case register:
        return MaterialPageRoute(builder: (_) {
          return RegisterPage();
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
      case corporateWellnessWithModalPage:
        return MaterialPageRoute(builder: (_) {
          return const CorporateWellnessWithModalPage();
        });
    }
  }
}
