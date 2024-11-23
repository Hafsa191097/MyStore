import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_store/app/data/providers/favourite.dart';
import 'package:my_store/app/data/providers/product_detail.dart';
import 'package:my_store/app/data/repositories/product_details.dart';
import 'package:my_store/app/ui/widgets/heading.dart';

class ProductDetailsPage extends StatelessWidget {
  final int productId;

  ProductDetailsPage({Key? key, required this.productId}) : super(key: key);

  final ProductDetailsController controller = Get.put(
    ProductDetailsController(repository: ProductRepository()),
  );
  final FavoritesController favoritesController =
      Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    controller.fetchProductDetails(productId);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset('assets/icons/Vector.svg')),
                  TopHeadings(
                    heading: 'Product Details',
                  ),
                  const SizedBox(
                    width: 1,
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              width: double.infinity,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  ));
                }

                final product = controller.product.value;

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                          product.thumbnail ?? '',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Product Details:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              favoritesController.addFavorite({
                                'id': product.id,
                                'name': product.title,
                                'price': product.price,
                                'rating': product.rating,
                                'image': product.thumbnail,
                              });
                              Get.snackbar(
                                'Added to Favorites',
                                '${product.title} has been added to favorites!',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/icons/filled_heart.svg',
                              color: Colors.black,
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ],
                      ),
                      rowWidget(
                        desc: 'Name',
                        name: product.title!,
                      ),

                      const SizedBox(height: 10),
                      rowWidget(
                        desc: 'Price',
                        name: product.price!.toString(),
                      ),

                      const SizedBox(height: 10),
                      rowWidget(
                        desc: 'Category',
                        name: product.category!,
                      ),

                      const SizedBox(height: 10),
                      rowWidget(
                        desc: 'Brand',
                        name: product.brand ?? '',
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          rowWidget(
                            desc: 'Rating',
                            name: product.rating!.toString(),
                          ),
                          const SizedBox(width: 5),
                          Row(
                            children: List.generate(5, (index) {
                              if (index < product.rating!.toInt()) {
                                return const Icon(Icons.star,
                                    color: Colors.amber, size: 15);
                              } else if (index < product.rating!.toInt()) {
                                return const Icon(Icons.star_half,
                                    color: Colors.amber, size: 15);
                              } else {
                                return const Icon(Icons.star_border,
                                    color: Colors.amber, size: 15);
                              }
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      rowWidget(
                        desc: 'Stock',
                        name: product.stock!.toString(),
                      ),
                      const SizedBox(height: 20),
                      // Description
                      const rowWidget(
                        desc: 'Description',
                        name: '',
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.description ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Product Gallery
                      const rowWidget(
                        desc: 'Product Gallery',
                        name: '',
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: product.images?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Image.network(
                              product.images![index],
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class rowWidget extends StatelessWidget {
  const rowWidget({
    super.key,
    required this.desc,
    required this.name,
  });

  final String desc, name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$desc: ',
          style: const TextStyle(
            color: Color(0xFF0C0C0C),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
