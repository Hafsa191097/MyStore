import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_store/app/data/models/product.dart';
import 'package:my_store/app/data/providers/product_controller.dart';

class SearchControllerr extends GetxController {
  var searchQuery = ''.obs;
  var filteredProducts = <Product>[].obs;

  final ProductController productController = Get.find<ProductController>();

  @override
  void onInit() {
    super.onInit();
    searchQuery.listen((query) {
      filterProducts(query);
    });
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(productController.products);
    } else {
      filteredProducts.assignAll(productController.products
          .where((product) =>
              product.title!.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }
    log("Filtered Products: ${filteredProducts.length}"); 
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}
