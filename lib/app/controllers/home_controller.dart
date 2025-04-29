import 'package:get/get.dart';
import '../data/models/product_model.dart';
import '../data/repository/repository.dart';

class HomeController extends GetxController {
  final Repository repository;
  HomeController({required this.repository});

  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;
      final result = await repository.getProducts();
      productList.value = result;
    } finally {
      isLoading.value = false;
    }
  }
}
