import 'package:get/get.dart';

class FavoritesController extends GetxController {
  var favorites = <Map<String, dynamic>>[].obs;
  var filteredFavorites = <Map<String, dynamic>>[].obs;
  void addFavorite(Map<String, dynamic> product) {
    if (!favorites.any((item) => item['id'] == product['id'])) {
      favorites.add(product);
    }
  }

  void removeFavorite(int productId) {
    favorites.removeWhere((item) => item['id'] == productId);
  }

  void updateSearchQuery(String query) {
    if (query.isEmpty) {
      filteredFavorites
          .assignAll(favorites); // Show all if search query is empty
    } else {
      filteredFavorites.assignAll(favorites.where((product) {
        return (product['name'] as String)
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList());
    }
  }

  bool isFavorite(int productId) {
    return favorites.any((item) => item['id'] == productId);
  }
}
