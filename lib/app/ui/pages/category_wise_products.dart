import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_store/app/data/providers/category_wise_products_controller.dart';
import 'package:my_store/app/routes/app_routes.dart';
import 'package:my_store/app/ui/widgets/heading.dart';
import 'package:my_store/app/ui/widgets/search_bar.dart';
import 'package:my_store/core/themes/colors.dart';
import 'package:my_store/core/utils/spaces.dart';
import '../widgets/product_card.dart';

class CategoryProductsPage extends StatelessWidget {
  final String categorySlug;
  final String categoryName;

  CategoryProductsPage(
      {super.key, required this.categorySlug, required this.categoryName});

  final CategoryProductsController controller =
      Get.put(CategoryProductsController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    // This will be triggered on search
    void onSearch(String query) {
      log('Search Query: $query');
      controller
          .updateSearchQuery(query); // Update the filtered list based on query
    }

    // Fetch products for the category when the page is loaded
    controller.fetchProducts(categorySlug);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset('assets/icons/Vector.svg')),
                TopHeadings(
                  heading: categoryName,
                ),
                const SizedBox(
                  width: 1,
                )
              ],
            ),
            CustomSearchBar(
              controller: searchController,
              onSearch: onSearch,
            ),
            Obx(() {
              final resultCount = controller.filteredProducts.length;
              return Text(
                '$resultCount results found',
                style: const TextStyle(
                  color: colorText,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              );
            }),
             verticalSpace(height: 10),
            Expanded(
              child: Obx(() {
                final displayedProducts = controller.filteredProducts.isEmpty
                    ? controller.products
                    : controller.filteredProducts;
                if (displayedProducts.isEmpty) {
                  return const Center(
                    child: Text("No products found."),
                  );
                }
                return SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: displayedProducts.length,
                    itemBuilder: (context, index) {
                      final product = displayedProducts[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.PRODUCT_DETAILS,
                              arguments: product.id);
                        },
                        child: ProductCard(
                          productName: product.title ?? '',
                          productPrice: product.price?.toStringAsFixed(0) ?? '',
                          productImage: product.thumbnail ?? '',
                          productRating: product.rating ?? 0,
                          productCategory: product.category ?? '',
                          productBrand: product.brand ?? '',
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
