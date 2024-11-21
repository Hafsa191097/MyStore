import 'package:get/get.dart';

class ProductsController extends GetxController {
  var searchQuery = ''.obs;
  var currentIndex = 0.obs;

  void onSearch(String query) {
    searchQuery.value = query;
  }

  void onNavTap(int index) {
    currentIndex.value = index;
  }
}
