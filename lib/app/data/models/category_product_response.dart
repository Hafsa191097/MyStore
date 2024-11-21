import 'package:my_store/app/data/models/product.dart';

class CategoryProductsResponse {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  CategoryProductsResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory CategoryProductsResponse.fromJson(Map<String, dynamic> json) {
    return CategoryProductsResponse(
      products: (json['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}
