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
        name: 'all',
        iconPath: 'assets/icons/sliders.png',
        color: const Color.fromARGB(255, 224, 222, 222),
      )
    );

    categories.add(
      CategoryModel(
        name: 'cat',
        iconPath: 'assets/icons/cats.png',
        color: Colors.grey
      )
    );

    categories.add(
      CategoryModel(
        name: 'dog',
        iconPath: 'assets/icons/dogs.png',
        color: Colors.grey
      )
    );

    categories.add(
      CategoryModel(
        name: 'bird',
        iconPath: 'assets/icons/birds.png',
        color: Colors.grey
      )
    );

    categories.add(
      CategoryModel(
        name: 'fish',
        iconPath: 'assets/icons/fishes.png',
        color: Colors.grey
      )
    );

    return categories;
  }
}



