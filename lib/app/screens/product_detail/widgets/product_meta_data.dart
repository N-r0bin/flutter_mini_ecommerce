import 'package:flutter/material.dart';

import '../../../common/widgets/products/product_cards/product_price_text.dart';
import '../../../common/widgets/texts/product_title_text.dart';
import '../../../data/models/product_model.dart';

import '../../../utilis/constants/app_sizes.dart';

class ProductMetaData extends StatelessWidget {
  final ProductModel product;
  const ProductMetaData({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ProductPriceText(
              price: '\$${product.price.toStringAsFixed(2)}',
              isLarge: false,
            ),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),
        ProductTitleText(
          title: product.title,
          smallSize: true,
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 1.5),
      ],
    );
  }
}
