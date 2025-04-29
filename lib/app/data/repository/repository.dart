import "../models/product_model.dart";
import "../services/api_service.dart";

class Repository {
  final ApiService apiService;
  Repository({required this.apiService});

  Future<List<ProductModel>> getProducts() {
    return apiService.fetchProducts();
  }
}
