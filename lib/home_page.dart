import 'package:flutter/material.dart';
import 'package:rehome/custom_drawer.dart';
import 'package:rehome/featured_pets.dart';
import 'package:rehome/models/category_model.dart';
import 'package:rehome/models/pet_model.dart';
import 'package:rehome/pet_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<CategoryModel> categories = [];
  List<PetModel> pets = [];
  List<bool> likedPets = [];

  // Initialize categories and pets
  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getPets() {
    pets = PetModel.getPets();
    likedPets = List.generate(pets.length, (index) => false);
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
    _getPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: Container(
        color: const Color(0xFFF4F4F4),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Open the drawer when the avatar is tapped
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/avatars/wony.jpg'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Search Friend",
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 373.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D8D8),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 40.0,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Featured Pets",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const FeaturedPets(),
                const SizedBox(height: 20),
                categoriesHeading(),
                const SizedBox(height: 5),
                categoriesList(),
                petGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding categoriesHeading() {
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

  Padding petGrid() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        shrinkWrap: true, // Ensures the grid doesn't take up extra space
        physics:
            const NeverScrollableScrollPhysics(), // Prevents scrolling of the grid (parent ScrollView handles scrolling)
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 15, // Space between columns
          mainAxisSpacing: 15, // Space between rows
          childAspectRatio: 1, // Square containers
        ),
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the pet's details page, passing PetModel
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PetDetailsPage(pet: pets[index]),
                ),
              );
            },
            child: Container(
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
                        likedPets[index]
                            ? Icons.favorite
                            : Icons.favorite_border,
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
                        const Icon(
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
            ),
          );
        },
      ),
    );
  }

  SizedBox categoriesList() {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 10, right: 20),
        separatorBuilder: (context, index) => const SizedBox(width: 20),
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
    );
  }
}
