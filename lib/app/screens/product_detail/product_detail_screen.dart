import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../common/widgets/texts/section_heading.dart';
import '../../data/models/product_model.dart';
import '../../utilis/constants/app_sizes.dart';
import 'widgets/bottom_add_to_cart.dart';
import 'widgets/product_detail_image.dart';
import 'widgets/product_meta_data.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(
        product: product,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImage(imageUrl: product.image),
            Padding(
              padding: const EdgeInsets.only(
                right: AppSizes.defaultSpace,
                left: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  ProductMetaData(
                    product: product,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  const SectionHeading(
                    text: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show more",
                    trimExpandedText: " Less",
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
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
