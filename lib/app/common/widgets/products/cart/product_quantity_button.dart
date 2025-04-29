import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../controllers/cart_controller.dart';
import '../../../../utilis/constants/app_colors.dart';
import '../../../../utilis/constants/app_sizes.dart';

import '../../icon/circular_icon.dart';

class ProductQuantityButton extends StatelessWidget {
  final CartItemModel cartItem;
  const ProductQuantityButton(
    this.cartItem, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find<CartController>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          onPressed: () => controller.decreaseQuantity(cartItem.product),
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: AppSizes.md,
          color: Colors.black,
          backgroundColor: Colors.white,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Obx(
          () => Text('${cartItem.quantity.value}',
              style: Theme.of(context).textTheme.titleSmall),
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: AppSizes.md,
          color: Colors.white,
          backgroundColor: AppColors.primary,
          onPressed: () => controller.increaseQuantity(cartItem.product),
        ),
      ],
    );
  }
}
