import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/app/data/providers/product_controller.dart';
import 'package:my_store/app/data/providers/search_controller.dart';
import 'package:my_store/app/routes/app_routes.dart';
import 'package:my_store/app/ui/widgets/heading.dart';
import 'package:my_store/app/ui/widgets/search_bar.dart';
import 'package:my_store/core/utils/spaces.dart';
import '../widgets/product_card.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductController productController = Get.put(ProductController());
  final SearchControllerr searchController = Get.put(SearchControllerr());
  final TextEditingController searchControllerText = TextEditingController();

  @override
  void initState() {
    super.initState();
    productController.fetchProducts(); 
    searchController.updateSearchQuery(''); 
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
              controller: searchControllerText,
              onSearch: (query) {
                searchController
                    .updateSearchQuery(query); 
              },
            ),
            Obx(() {
              final resultCount = searchController.filteredProducts.isEmpty
                  ? productController.products.length
                  : searchController.filteredProducts.length;
              return Text(
                '$resultCount results found',
                style: const TextStyle(
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              );
            }),
            verticalSpace(height: 10),
            Expanded(
              child: Obx(() {
                if (productController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                final displayedProducts =
                    searchController.filteredProducts.isEmpty
                        ? productController.products
                        : searchController.filteredProducts;

                if (displayedProducts.isEmpty) {
                  return const Center(
                    child: Text(
                      'No products found.',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
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
                        productPrice: product.price?.toStringAsFixed(0) ?? '0',
                        productImage: product.thumbnail ?? '',
                        productRating: product.rating!,
                        productCategory: product.category ?? '',
                        productBrand: product.brand ?? '',
                      ),
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
