import 'package:get/get.dart';
import 'package:my_store/app/data/models/product.dart';
import 'package:my_store/app/data/repositories/product_details_rep.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      ProductService service = ProductService();
      final productData = await service.fetchProducts();
      products.assignAll(productData);
    } finally {
      isLoading(false);
    }
  }
}
