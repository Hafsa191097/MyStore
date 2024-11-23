import 'package:get/get.dart';
import 'package:my_store/app/ui/pages/bottom_sheet.dart';
import 'package:my_store/app/ui/pages/favs.dart';
import 'package:my_store/app/ui/pages/product_details.dart';
import 'package:my_store/app/ui/pages/products.dart';
import 'package:my_store/app/ui/pages/splash_screen.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.BottomSheet,
      page: () => const MainPage(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => ProductsPage(),
    ),
    GetPage(
      name: AppRoutes.PRODUCT_DETAILS,
      page: () => ProductDetailsPage(productId: Get.arguments),
    ),
    GetPage(
      name: AppRoutes.FAVORITES,
      page: () =>  FavouritesPage(),
    ),
  ];
}
