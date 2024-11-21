import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class verticalSpace extends StatelessWidget {
  verticalSpace({
    required this.height,
    super.key,
  });
  double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
