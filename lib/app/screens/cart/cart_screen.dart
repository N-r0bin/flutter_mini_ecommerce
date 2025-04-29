import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_market/app/common/widgets/appbar/app_appbar.dart';
import 'package:mini_market/app/screens/checkout/checkout_screen.dart';
import '../../controllers/cart_controller.dart';
import '../../utilis/constants/app_sizes.dart';
import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: CartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Obx(
          () => ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Text(
                'Checkout (\$${cartController.subtotal.toStringAsFixed(2)})'),
          ),
        ),
      ),
    );
  }
}
