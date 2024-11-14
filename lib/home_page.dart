import 'package:flutter/material.dart';
import 'package:rehome/custom_drawer.dart';
import 'package:rehome/featured_pets.dart';
import 'package:rehome/widgets/categories_heading.dart';
import 'package:rehome/widgets/categories_list.dart';
import 'package:rehome/widgets/pet_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                const CategoriesHeading(),
                const SizedBox(height: 5),
                const CategoriesList(),
                const PetGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}