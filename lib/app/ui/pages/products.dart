import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_store/app/ui/widgets/heading.dart';
import 'package:my_store/app/ui/widgets/search_bar.dart';
import 'package:my_store/core/themes/colors.dart';
import 'package:my_store/core/utils/spaces.dart';
import '../widgets/product_card.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    void onSearch(String query) {
      log('Search Query: $query');
    }

    int _currentIndex = 0;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.08,
            left: 21,
            right: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopHeadings(
              heading: 'Products',
            ),
            CustomSearchBar(
              controller: searchController,
              onSearch: onSearch,
            ),
            const Text(
              '234 results found',
              style: TextStyle(
                color: colorText,
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.685,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ProductCard(
                    productName: 'Iphone 14',
                    productPrice: '\$60',
                    productImage: 'assets/images/iphone.jpeg',
                    productRating: '4.9',
                    productCategory: 'In smartphones',
                    productBrand: 'By Apple',
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              log('Current Index: $_currentIndex');
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.store),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Mitt konto',
            ),
          ],
        ),
      ),
    );
  }
}
