import 'package:flutter/material.dart';
import 'package:rehome/home_page.dart';
import 'package:rehome/widgets/categories_heading.dart';
import 'package:rehome/custom_app_bar.dart';
import 'package:rehome/widgets/categories_list.dart';
import 'package:rehome/widgets/pet_grid.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: CustomAppBar(
        title: "Favorites",
        onBackPress: () {
          Navigator.pop(context);
        },
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              CategoriesList(),
              SizedBox(height: 20),
              PetGrid(),
            ],
          ),
        ),
      ),
    );
  }
}