import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';

class CategoryRepository {
  final String _baseUrl = 'https://dummyjson.com/products/categories';

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
