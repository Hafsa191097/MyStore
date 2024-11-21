import 'package:get/get.dart';
import 'package:my_store/app/data/models/product.dart';
import 'package:my_store/app/data/repositories/category_wise_products.dart';

class CategoryProductsController extends GetxController {
  final CategoryProductsRepository _repository = CategoryProductsRepository();
  var isLoading = true.obs;
  var products = <Product>[].obs;

  void fetchProducts(String categorySlug) async {
    try {
      isLoading(true);
      final response = await _repository.fetchProductsByCategory(categorySlug);
      products.assignAll(response.products);
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
