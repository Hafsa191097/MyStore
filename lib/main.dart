import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/app/data/providers/favourite.dart';
import 'package:my_store/app/routes/app_pages.dart';
import 'package:my_store/app/routes/app_routes.dart';
import 'package:my_store/app/ui/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FavoritesController());

    return GetMaterialApp(
        title: 'My Store',
        initialRoute: AppRoutes.SPLASH,
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
        home: const SplashPage());
  }
}
