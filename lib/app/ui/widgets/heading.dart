import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TopHeadings extends StatelessWidget {
  TopHeadings({
    super.key,
    required this.heading,
  });
  String heading;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        heading,
        style: GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
