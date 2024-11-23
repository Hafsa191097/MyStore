import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_store/app/ui/pages/categories.dart';
import 'package:my_store/app/ui/pages/favs.dart';
import 'package:my_store/app/ui/pages/products.dart';
import 'package:my_store/app/ui/pages/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ProductsPage(),
    CategoriesPage(),
     FavouritesPage(),
    const MittKontoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _currentIndex == 0
                      ? Colors.black.withOpacity(0.8)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  'assets/icons/home.svg',
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
              ),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _currentIndex == 1
                      ? Colors.black.withOpacity(0.8)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  'assets/icons/category.svg',
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _currentIndex == 2
                      ? Colors.black.withOpacity(0.8)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  'assets/icons/heart.svg',
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
              ),
              label: 'Favourites',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _currentIndex == 3
                      ? Colors.black.withOpacity(0.8)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
              ),
              label: 'Mitt Konto',
            ),
          ],
        ),
      ),
    );
  }
}
