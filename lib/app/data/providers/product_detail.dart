import 'package:get/get.dart';
import 'package:my_store/app/data/models/product.dart';
import 'package:my_store/app/data/repositories/product_details.dart';

class ProductDetailsController extends GetxController {
  var isLoading = true.obs;
  var product = Product(
    id: null,
    title: null,
    description: null,
    category: null,
    price: null,
    discountPercentage: null,
    rating: null,
    stock: null,
    tags: null,
    brand: null,
    sku: null,
    weight: null,
    dimensions: null,
    warrantyInformation: null,
    shippingInformation: null,
    availabilityStatus: null,
    reviews: null,
    returnPolicy: null,
    minimumOrderQuantity: null,
    meta: null,
    images: null,
    thumbnail: null,
  ).obs;

  final ProductRepository repository;

  ProductDetailsController({required this.repository});

  void fetchProductDetails(int productId) async {
    try {
      isLoading(true);
      product.value = await repository.fetchProductDetails(productId);
    } finally {
      isLoading(false);
    }
  }
}
