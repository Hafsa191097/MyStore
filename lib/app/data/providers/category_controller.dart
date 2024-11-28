import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_store/app/data/repositories/categories_repo.dart';
import '../models/category.dart';

class CategoryController extends GetxController {
  final CategoryRepository _repository = CategoryRepository();
  var isLoading = false.obs;
  var categories = <Category>[].obs;
  var filteredCategories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    isLoading.value = true;
    try {
      final fetchedCategories = await _repository.fetchCategories();
      categories.assignAll(fetchedCategories);
    } catch (e) {
      log('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void updateSearchQuery(String query) {
    if (query.isEmpty) {
      filteredCategories.assignAll(categories);
    } else {
      filteredCategories.assignAll(categories.where((category) {
        return category.name.toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }
}
