import "package:flutter/material.dart";
import "package:get/get.dart";

import "../bindings/home_binding.dart";
import "../data/repository/repository.dart";
import "../screens/home/home_screen.dart";

class AppController extends GetxController {
  final Repository repository;
  AppController({required this.repository});

  Route generateRouteControlFunction(RouteSettings route) {
    return GetPageRoute(
      settings: route,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    );
  }
}
