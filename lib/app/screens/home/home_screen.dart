import "package:flutter/material.dart";
import "package:get/get.dart";
import "../../common/widgets/layouts/grid_layout.dart";
import "../../common/widgets/products/product_cards/vertical_product_card.dart";
import "../../common/widgets/shapes/containers/main_header_container.dart";
import "../../common/widgets/shapes/containers/search_container.dart";
import "../../controllers/cart_controller.dart";
import "../../controllers/product_controller.dart";
import "../../utilis/constants/app_sizes.dart";
import "widgets/home_appbar.dart";

class HomeScreen extends GetView<ProductController> {
  HomeScreen({super.key});
  final CartController cartController = Get.find<CartController>();
  final RxString searchQuery = ''.obs;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MainHeaderContainer(
            child: Column(
              children: [
                const HomeAppBar(),
                const SizedBox(height: AppSizes.spaceBtwSections),
                SearchContainer(
                  text: 'Search the Store',
                  onTap: () {
                    searchQuery.value = searchController.text.toLowerCase();
                  },
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.productList.isEmpty) {
                return const Center(child: Text('No Products Found'));
              }

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridLayout(
                    itemCount: controller.productList
                        .where((product) => product.title
                            .toLowerCase()
                            .contains(searchQuery.value))
                        .toList()
                        .length,
                    itemBuilder: (_, index) {
                      final filteredProducts = controller.productList
                          .where((product) => product.title
                              .toLowerCase()
                              .contains(searchQuery.value))
                          .toList();
                      final product = filteredProducts[index];
                      return ProductCardVertical(
                        imageUrl: product.image,
                        title: product.title,
                        brand: product.category,
                        price: product.price,
                        product: product,
                      );
                    },
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
