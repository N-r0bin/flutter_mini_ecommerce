import 'package:flutter/material.dart';
import '../../../common/widgets/images/rounded_image.dart';
import '../../../common/widgets/texts/brand_title_text_verfied.dart';
import '../../../common/widgets/texts/product_title_text.dart';
import '../../../controllers/cart_controller.dart';

import '../../../utilis/constants/app_sizes.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItem;
  const CartItem({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    final product = cartItem.product;
    return Row(
      children: [
        RoundedImage(
          imageUrl: product.image,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(AppSizes.sm),
          backgroundColor: Colors.white,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleTextVerfied(title: product.category),
              ProductTitleText(
                maxLines: 1,
                title: product.title,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
