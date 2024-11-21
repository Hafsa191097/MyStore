import 'package:get/get.dart';
import 'package:my_store/app/ui/pages/products.dart';
import 'package:my_store/app/ui/pages/splash_screen.dart';
import '../bindings/home_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => ProductsPage(),
      binding: HomeBinding(),
    ),
  ];
}