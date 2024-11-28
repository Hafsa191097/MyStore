import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_store/app/data/models/product.dart';
import 'package:my_store/app/data/repositories/category_wise_products.dart';

class CategoryProductsController extends GetxController {
  final CategoryProductsRepository _repository = CategoryProductsRepository();
  var isLoading = true.obs;
  var products = <Product>[].obs;
  var filteredProducts = <Product>[].obs;

  void fetchProducts(String categorySlug) async {
    try {
      isLoading(true);
      final response = await _repository.fetchProductsByCategory(categorySlug);
      products.assignAll(response.products);
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  void updateSearchQuery(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(products);  
    } else {
      filteredProducts.assignAll(products.where((product) {
        return (product.title ?? '').toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }
}
