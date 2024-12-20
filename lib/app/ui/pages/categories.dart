import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/app/data/providers/category_controller.dart';
import 'package:my_store/app/ui/pages/category_wise_products.dart';
import 'package:my_store/app/ui/widgets/heading.dart';
import 'package:my_store/app/ui/widgets/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/core/themes/colors.dart';
import 'package:my_store/core/utils/spaces.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    void onSearch(String query) {
      log('Search Query: $query');
      categoryController.updateSearchQuery(query);
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.08,
          left: 21,
          right: 21,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopHeadings(
              heading: 'Categories',
            ),
            CustomSearchBar(
              controller: searchController,
              onSearch: onSearch,
            ),
            Obx(() {
              final resultCount = categoryController.filteredCategories.length;
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
            verticalSpace(height: 10,),
            Expanded(
              child: Obx(() {
                if (categoryController.isLoading.value) {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.black));
                }
                final displayedProducts =
                    categoryController.filteredCategories.isEmpty
                        ? categoryController.categories
                        : categoryController.filteredCategories;
                return GridView.builder(
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 28,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: displayedProducts.length,
                  itemBuilder: (context, index) {
                    final category = displayedProducts[index];
                    const imageUrl =
                        'https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-image_large.png?v=1530129081';

                    return GestureDetector(
                      onTap: () {
                        Get.to(() => CategoryProductsPage(
                              categorySlug: category.slug,
                              categoryName: category.name,
                            ));
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              children: [
                                Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color(0x3F0C0C0C),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: SizedBox(
                              width: 125,
                              child: Text(
                                category.name,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    const Shadow(
                                      color: Colors.black,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
