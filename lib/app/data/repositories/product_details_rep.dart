import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_store/app/data/models/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    const String url = 'https://dummyjson.com/products?limit=100';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> productsJson = jsonData['products'];

      return productsJson.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
