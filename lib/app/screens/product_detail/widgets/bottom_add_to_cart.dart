import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/icon/circular_icon.dart';
import '../../../controllers/cart_controller.dart';
import '../../../data/models/product_model.dart';
import '../../../utilis/constants/app_colors.dart';
import '../../../utilis/constants/app_sizes.dart';

class BottomAddToCart extends StatelessWidget {
  final ProductModel product;
  BottomAddToCart({super.key, required this.product});

  final RxInt quantity = 1.obs; 

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find<CartController>();

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularIcon(
                onPressed: () {
                  if (quantity > 1) quantity.value--;
                },
                icon: Iconsax.minus,
                backgroundColor: AppColors.darkerGrey,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Obx(() => Text(
                    '${quantity.value}',
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
              const SizedBox(width: AppSizes.spaceBtwItems),
              CircularIcon(
                onPressed: () => quantity.value++,
                icon: Iconsax.add,
                backgroundColor: Colors.grey,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              for (int i = 0; i < quantity.value; i++) {
                controller.addToCart(product);
              }
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
        ],
      ),
    );
  }
}
