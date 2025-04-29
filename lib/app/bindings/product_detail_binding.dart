import 'package:get/get.dart';
import '../controllers/product_detail_controller.dart';
import '../data/repository/repository.dart';
import '../data/services/api_service.dart';

class ProductDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(
      () => ProductDetailController(
        repository: Repository(apiService: ApiService()),
      ),
    );
  }
}
