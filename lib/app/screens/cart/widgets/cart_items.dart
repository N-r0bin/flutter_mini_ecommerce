import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widgets/products/cart/product_quantity_button.dart';
import '../../../common/widgets/products/product_cards/product_price_text.dart';
import '../../../controllers/cart_controller.dart';
import '../../../utilis/constants/app_sizes.dart';
import 'cart_item.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find<CartController>();
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (_, __) =>
            const SizedBox(height: AppSizes.spaceBtwSections),
        itemCount: controller.cartItems.length,
        itemBuilder: (_, index) {
          final cartItem = controller.cartItems[index];
          return Column(
            children: [
              CartItem(cartItem: cartItem),
              if (showAddRemoveButtons)
                const SizedBox(height: AppSizes.spaceBtwItems),
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 70),
                        ProductQuantityButton(cartItem),
                      ],
                    ),
                    ProductPriceText(price: '${cartItem.product.price}'),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
