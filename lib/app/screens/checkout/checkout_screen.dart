import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_market/app/common/widgets/appbar/app_appbar.dart';
import 'package:mini_market/app/common/widgets/shapes/containers/circular_container.dart';
import 'package:mini_market/app/screens/cart/widgets/cart_items.dart';
import 'package:mini_market/app/screens/home/home_screen.dart';
import 'package:mini_market/app/utilis/constants/app_sizes.dart';
import '../../common/widgets/success_screen/success_screen.dart';
import '../../controllers/cart_controller.dart';
import '../../utilis/constants/image_strings.dart';
import 'widgets/billing_amount_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              CartItems(
                showAddRemoveButtons: false,
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              CircularContainer(
                showBorder: true,
                padding: EdgeInsets.all(AppSizes.md),
                backgroundColor: Colors.white,
                child: Column(
                  children: [
                    BillingAmount(),
                    SizedBox(height: AppSizes.spaceBtwItems)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: AppImages.payment_completed,
              title: 'Payment Success!',
              subTitle: 'Your package will be shipped soon!',
              onPressed: () => Get.offAll(() => HomeScreen()),
            ),
          ),
          child: Obx(() {
            final cartController = Get.find<CartController>();
            return Text(
                'Checkout \$${cartController.total.toStringAsFixed(2)}');
          }),
        ),
      ),
    );
  }
}
