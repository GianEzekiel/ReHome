import 'package:flutter/material.dart';
import 'package:rehome/custom_app_bar.dart';
import 'package:rehome/home_page.dart';
import 'package:rehome/widgets/categories_list.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Favorites',
        onBackPress: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              CategoriesList(),
            ],
          ),
        ),
      ),
    );
  }
}