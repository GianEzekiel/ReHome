import 'package:flutter/material.dart';
import 'package:rehome/models/category_model.dart';
import 'package:rehome/models/pet_model.dart';
import 'package:rehome/pet_details_page.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<CategoryModel> categories = [];
  List<PetModel> allPets = []; // All available pets
  List<PetModel> filteredPets = []; // Filtered pets based on selected category
  List<bool> likedPets = [];
  String selectedCategory = ''; // Tracks the selected category

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getPets() {
    allPets = PetModel.getPets();
    filteredPets = allPets; // Initially show all pets
    likedPets = List.generate(allPets.length, (index) => false);
  }

  void _filterPets(String categoryName) {
    setState(() {
      selectedCategory = categoryName;
      if (categoryName.toLowerCase() == 'all') {
        filteredPets = allPets; // Show all pets if 'all' is selected
      } else {
        filteredPets = allPets
            .where((pet) => pet.petType.toLowerCase() == categoryName.toLowerCase())
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
    _getPets();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Categories List
        SizedBox(
          height: 60,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _filterPets(categories[index].name); // Use name for filtering
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: categories[index].color.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        categories[index].iconPath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        // Pets Grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1,
            ),
            itemCount: filteredPets.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PetDetailsPage(pet: filteredPets[index]),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(filteredPets[index].petIconPath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      // Like button
                      Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              likedPets[index] = !likedPets[index];
                            });
                          },
                          child: Icon(
                            likedPets[index]
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                      // Pet name
                      Positioned(
                        bottom: 30,
                        left: 10,
                        child: Text(
                          filteredPets[index].petName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      // Location
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              filteredPets[index].location,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
