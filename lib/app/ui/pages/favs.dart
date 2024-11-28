// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_store/app/data/providers/favourite.dart';
import 'package:my_store/app/ui/widgets/heading.dart';
import 'package:my_store/app/ui/widgets/search_bar.dart';
import 'package:my_store/core/utils/spaces.dart';

class FavouritesPage extends StatelessWidget {
  FavouritesPage({super.key});
  final FavoritesController favoritesController =
      Get.put(FavoritesController());
  final TextEditingController searchController = TextEditingController();

  void onSearch(String query) {
    favoritesController.updateSearchQuery(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.08,
              left: 21,
              right: 21,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopHeadings(heading: 'Favourites'),
                CustomSearchBar(
                  controller: searchController,
                  onSearch: onSearch,
                ),
                Obx(() {
                  final resultCount =
                      favoritesController.filteredFavorites.length;
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
                Obx(() {
                  final favourites = favoritesController.favorites;
                  final displayedProducts =
                      favoritesController.filteredFavorites.isEmpty
                          ? favoritesController.favorites
                          : favoritesController.filteredFavorites;
                  if (favourites.isEmpty) {
                    return SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: const Center(
                        child: Text(
                          'No favourites yet!',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      itemCount: displayedProducts.length,
                      itemBuilder: (context, index) {
                        final product = displayedProducts[index];
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                                border: Border.all(
                                  width: 1,
                                  color: const Color(0x0C0C0C0C),
                                ),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(5),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    product['image'] ??
                                        'https://via.placeholder.com/150',
                                  ),
                                  radius: 30,
                                ),
                                title: Text(
                                  product['name'] ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFF0C0C0C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$${product['price'] ?? '0'}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${(product['rating']) ?? '0'}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Row(
                                          children: List.generate(5, (index) {
                                            if (index <
                                                product['rating'].toInt()) {
                                              return const Icon(Icons.star,
                                                  color: Colors.amber,
                                                  size: 15);
                                            } else if (index <
                                                product['rating'].toInt()) {
                                              return const Icon(Icons.star_half,
                                                  color: Colors.amber,
                                                  size: 15);
                                            } else {
                                              return const Icon(
                                                  Icons.star_border,
                                                  color: Colors.amber,
                                                  size: 15);
                                            }
                                          }),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    favoritesController
                                        .removeFavorite(product['id']);
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/filled.svg',
                                    color: Colors.red,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ),
                             verticalSpace(height: 10),
                          ],
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
