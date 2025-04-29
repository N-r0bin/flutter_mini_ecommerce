import 'package:get/get.dart';
import '../data/models/product_model.dart';
import '../data/repository/repository.dart';

class ProductDetailController extends GetxController {
  final Repository repository;
  late final ProductModel product;

  ProductDetailController({
    required this.repository,
  });

  @override
  void onInit() {
    super.onInit();

    product = Get.arguments as ProductModel;
  }
}
