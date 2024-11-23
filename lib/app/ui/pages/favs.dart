import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/app/data/providers/favourite.dart';

class FavouritesPage extends StatelessWidget {
  FavouritesPage({super.key});
  final FavoritesController favoritesController =
      Get.put(FavoritesController());
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
            const Text(
              'Favourites',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Obx(() {
              final favourites = favoritesController.favorites;

              if (favourites.isEmpty) {
                return const Center(
                  child: Text(
                    'No favourites yet!',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: favourites.length,
                  itemBuilder: (context, index) {
                    final product = favourites[index];
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
                                product['thumbnail'] ??
                                    'https://via.placeholder.com/150',
                              ),
                              radius: 30,
                            ),
                            title: Text(
                              product['title'] ?? 'nh',
                              style: const TextStyle(
                                color: Color(0xFF0C0C0C),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              '\$${product['price'] ?? '0'}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                favoritesController
                                    .removeFavorite(product['id']);
                              },
                              child:
                                  const Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
