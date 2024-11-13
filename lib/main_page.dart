import 'package:flutter/material.dart';
import 'package:rehome/models/category_model.dart';
import 'package:rehome/models/pet_model.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<CategoryModel> categories = [];
  List<PetModel> pets = [];
  List<bool> likedPets = [];

  // Initialize categories and pets
  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getPets() {
    pets = PetModel.getPets();
    // Initialize likedPets based on the number of pets
    likedPets = List.generate(pets.length, (index) => false);
  }

  @override
  void initState() {
    super.initState();
    // Call the functions only once during initialization
    _getCategories();
    _getPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Horizontal list of categories
            Container(
              height: 60,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) => const SizedBox(width: 35),
                itemBuilder: (context, index) {
                  return Container(
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
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                shrinkWrap: true, // Ensures the grid doesn't take up extra space
                physics: const NeverScrollableScrollPhysics(), // Prevents scrolling of the grid (parent ScrollView handles scrolling)
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 15, // Space between columns
                  mainAxisSpacing: 15, // Space between rows
                  childAspectRatio: 1, // Square containers
                ),
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(pets[index].petIconPath),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        // Positioned like/love icon at the top-right
                        Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                // Toggle the liked state
                                likedPets[index] = !likedPets[index];
                              });
                            },
                            child: Icon(
                              likedPets[index] ? Icons.favorite : Icons.favorite_border,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                        // First text at the bottom-left
                        Positioned(
                          bottom: 30,
                          left: 10,
                          child: Text(
                            pets[index].petName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        // Row with icon and second text, positioned below the first one
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined, 
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                pets[index].location,
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
