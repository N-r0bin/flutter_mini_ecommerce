import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/controllers/cart_controller.dart';
import 'app/controllers/product_controller.dart';
import 'app/screens/app_screen.dart';

void main() {
  Get.put(ProductController());
  Get.put(CartController());
  runApp(const App());
}
