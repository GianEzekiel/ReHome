import 'package:flutter/material.dart';
import 'package:rehome/home_page.dart';
import 'package:rehome/widgets/categories_heading.dart';
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
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CategoriesList(),
              PetGrid(),
            ],
          ),
        ),
      ),
    );
  }
}