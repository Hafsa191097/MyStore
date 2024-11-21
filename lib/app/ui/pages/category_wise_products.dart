import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_store/app/data/providers/category_wise_products_controller.dart';
import 'package:my_store/app/ui/widgets/heading.dart';
import 'package:my_store/app/ui/widgets/search_bar.dart';
import 'package:my_store/core/themes/colors.dart';
import '../widgets/product_card.dart';

class CategoryProductsPage extends StatelessWidget {
  final String categorySlug;
  final String categoryName;

  CategoryProductsPage(
      {required this.categorySlug, required this.categoryName});

  final CategoryProductsController controller =
      Get.put(CategoryProductsController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    void onSearch(String query) {
      log('Search Query: $query');
    }

    controller.fetchProducts(categorySlug);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
            const Text(
              '234 results found',
              style: TextStyle(
                color: colorText,
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                if (controller.products.isEmpty) {
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
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return ProductCard(
                        productName: product.title ?? '',
                        productPrice: product.price?.toStringAsFixed(0) ?? '',
                        productImage: product.thumbnail ?? '',
                        productRating: product.rating!,
                        productCategory: product.category ?? '',
                        productBrand: product.brand ?? '',
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
