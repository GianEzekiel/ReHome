import 'package:flutter/material.dart';

class CategoriesHeading extends StatelessWidget {
  const CategoriesHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        'Categories',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}