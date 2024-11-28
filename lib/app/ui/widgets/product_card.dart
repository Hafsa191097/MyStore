import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_store/core/themes/colors.dart';
import 'package:my_store/core/utils/spaces.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  final double productRating;
  final String productCategory;
  final String productBrand;

  const ProductCard({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productRating,
    required this.productCategory,
    required this.productBrand,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 290,
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            border: Border.fromBorderSide(BorderSide(width: 1, color: shaddow)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 165,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          productImage,
                        ),
                      ),
                      color: color,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpace(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.58,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        productName,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      "\$$productPrice",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                verticalSpace(height: 5),
                Row(
                  children: [
                    Text(
                      productRating.toString(),
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    verticalSpace(height: 5),
                    Row(
                      children: List.generate(5, (index) {
                        if (index < productRating) {
                          return const Icon(Icons.star,
                              color: Colors.amber, size: 15);
                        } else if (index < productRating) {
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
                verticalSpace(height: 5),
                Text(
                  "By $productBrand",
                  style: const TextStyle(
                    color: color2,
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                verticalSpace(height: 5),
                Text(
                  "In $productCategory ",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF0C0C0C),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpace(height: 10),
      ],
    );
  }
}
