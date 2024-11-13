import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color color;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.color,
  });

  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Cats',
        iconPath: 'assets/icons/cats.png',
        color: Colors.grey
      )
    );

    categories.add(
      CategoryModel(
        name: 'Dogs',
        iconPath: 'assets/icons/dogs.png',
        color: Colors.grey
      )
    );

    categories.add(
      CategoryModel(
        name: 'Birds',
        iconPath: 'assets/icons/birds.png',
        color: Colors.grey
      )
    );

    categories.add(
      CategoryModel(
        name: 'Fishes',
        iconPath: 'assets/icons/fishes.png',
        color: Colors.grey
      )
    );

    return categories;
  }
}



