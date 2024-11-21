import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_store/app/data/models/category_product_response.dart';

class CategoryProductsRepository {
  Future<CategoryProductsResponse> fetchProductsByCategory(
      String categorySlug) async {
    final url = 'https://dummyjson.com/products/category/$categorySlug';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return CategoryProductsResponse.fromJson(data);
    } else {
      throw Exception('Failed to load products for category: $categorySlug');
    }
  }
}
