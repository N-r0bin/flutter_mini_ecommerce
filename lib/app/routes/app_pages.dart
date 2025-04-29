import 'package:get/get.dart';

import '../bindings/home_binding.dart';
import '../bindings/product_detail_binding.dart';

import '../data/models/product_model.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/product_detail/product_detail_screen.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.PRODUCT_DETAIL,
      page: () => ProductDetailScreen(product: Get.arguments as ProductModel),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.CART,
      page: () => const CartScreen(),
    ),
  ];
}
