import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/appbar/app_appbar.dart';
import '../../../common/widgets/products/cart_counter_icon.dart';
import '../../../controllers/cart_controller.dart';
import '../../cart/cart_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return AppAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .apply(color: Colors.white),
          ),
          Text(
            'What are you looking for ?',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Colors.grey.shade400),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () => Get.to(() => const CartScreen()),
          iconColor: Colors.white,
          countWidget: Obx(() {
            return Text(
              '${cartController.cartCount}',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: Colors.white, fontSizeFactor: 0.8),
            );
          }),
        ),
      ],
    );
  }
}
