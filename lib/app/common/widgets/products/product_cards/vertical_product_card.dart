import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../controllers/cart_controller.dart';
import '../../../../data/models/product_model.dart';
import '../../../../screens/product_detail/product_detail_screen.dart';
import '../../../../utilis/constants/app_colors.dart';
import '../../../../utilis/constants/app_sizes.dart';
import '../../../styles/shadow_styles.dart';
import '../../icon/circular_icon.dart';
import '../../images/rounded_image.dart';
import '../../shapes/containers/circular_container.dart';
import '../../texts/product_title_text.dart';
import 'product_price_text.dart';

class ProductCardVertical extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String brand;
  final double price;
  final bool isFavorite;
  final ProductModel product;

  const ProductCardVertical({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.brand,
    required this.price,
    this.isFavorite = false,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    
    final cartController = Get.find<CartController>();
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 170,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularContainer(
              height: 160,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundColor: Colors.white,
              showBorder: false,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: RoundedImage(
                      imageUrl: imageUrl,
                      applyImageRadius: true,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      icon: isFavorite ? Iconsax.heart5 : Iconsax.heart,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: title,
                    smallSize: true,
                    maxLines: 2,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          brand,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      const SizedBox(width: AppSizes.xs),
                      const Icon(
                        Iconsax.verify,
                        color: AppColors.primary,
                        size: AppSizes.iconXs,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ProductPriceText(
                          price: price.toStringAsFixed(2),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          cartController.addToCart(product);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppSizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(AppSizes.productImageRadius),
                            ),
                          ),
                          child: const SizedBox(
                            width: AppSizes.iconLg * 1.2,
                            height: AppSizes.iconLg * 1.2,
                            child: Center(
                              child: Icon(Iconsax.add, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
