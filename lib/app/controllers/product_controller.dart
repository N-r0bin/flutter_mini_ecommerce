import 'package:get/get.dart';
import '../data/models/product_model.dart';
import '../data/services/api_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;
  final apiService = ApiService();
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await apiService.fetchProducts();
      productList.assignAll(products);
    } finally {
      isLoading(false);
    }
  }
}
