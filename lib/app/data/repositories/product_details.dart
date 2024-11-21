import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_store/app/data/models/product.dart';

class ProductRepository {
  Future<Product> fetchProductDetails(int productId) async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products/$productId'));
    
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
