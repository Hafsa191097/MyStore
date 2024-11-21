import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/app/data/providers/product_controller.dart';
import 'package:my_store/app/ui/widgets/heading.dart';
import 'package:my_store/app/ui/widgets/search_bar.dart';
import '../widgets/product_card.dart';

class ProductsPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final TextEditingController searchController = TextEditingController();

  ProductsPage({Key? key}) : super(key: key);

  void onSearch(String query) {
    log('Search Query: $query');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.08,
          left: 21,
          right: 21,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopHeadings(heading: 'Products'),
            CustomSearchBar(
              controller: searchController,
              onSearch: onSearch,
            ),
            Obx(() {
              final resultCount = productController.products.length;
              return Text(
                '$resultCount results found',
                style: const TextStyle(
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              );
            }),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (productController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                if (productController.products.isEmpty) {
                  return const Center(
                    child: Text(
                      'No products found.',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: productController.products.length,
                  itemBuilder: (context, index) {
                    final product = productController.products[index];
                    return ProductCard(
                      productName: product.title ?? '',
                      productPrice: product.price?.toStringAsFixed(0) ?? '0',
                      productImage: product.thumbnail ?? '',
                      productRating: product.rating!,
                      productCategory: product.category ?? '',
                      productBrand: product.brand ?? '',
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
