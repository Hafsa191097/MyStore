import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_store/app/data/repositories/categories_repo.dart';
import '../models/category.dart';

class CategoryController extends GetxController {
  final CategoryRepository _repository = CategoryRepository();
  var isLoading = false.obs;
  var categories = <Category>[].obs;

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
}
