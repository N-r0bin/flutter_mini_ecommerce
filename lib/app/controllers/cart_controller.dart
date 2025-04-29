import 'package:get/get.dart';
import '../data/models/product_model.dart';

class CartItemModel {
  final ProductModel product;
  RxInt quantity;

  CartItemModel({required this.product, int quantity = 1})
      : quantity = quantity.obs;
}

class CartController extends GetxController {
  var cartItems = <CartItemModel>[].obs;

  double shippingFee = 5.0;
  double taxFee = 5.0;

  void addToCart(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(CartItemModel(product: product));
    }

    Get.snackbar('Added to Cart', '${product.title} added successfully');
  }

  void removeFromCart(ProductModel product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
  }

  void increaseQuantity(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      cartItems[index].quantity++;
    }
  }

  void decreaseQuantity(ProductModel product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
        Get.snackbar("Removed", "${product.title} removed from cart");
      }
    }
  }

  int get cartCount =>
      cartItems.fold(0, (sum, item) => sum + item.quantity.value);

  double get subtotal => cartItems.fold(
      0, (sum, item) => sum + item.product.price * item.quantity.value);

  double get total => subtotal + shippingFee + taxFee;
}
