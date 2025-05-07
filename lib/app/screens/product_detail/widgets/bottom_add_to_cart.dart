import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/cart_controller.dart';
import '../../../data/models/product_model.dart';
import '../../../utilis/constants/app_sizes.dart';

class BottomAddToCart extends StatelessWidget {
  final ProductModel product;
  BottomAddToCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace,
        vertical: AppSizes.defaultSpace / 2,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.cardRadiusLg),
          topRight: Radius.circular(AppSizes.cardRadiusLg),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          Get.find<CartController>().addToCart(product);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item added to cart'),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(AppSizes.md),
          backgroundColor: Colors.black,
          side: const BorderSide(color: Colors.black),
        ),
        child: const Text(
          'Add to Cart',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
