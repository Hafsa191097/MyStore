import 'package:get/get.dart';

class FavoritesController extends GetxController {

  var favorites = <Map<String, dynamic>>[].obs;

  void addFavorite(Map<String, dynamic> product) {
    if (!favorites.any((item) => item['id'] == product['id'])) {
      favorites.add(product);
    }
  }

  void removeFavorite(int productId) {
    favorites.removeWhere((item) => item['id'] == productId);
  }
}
