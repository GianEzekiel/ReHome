import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rehome/custom_drawer.dart';
import 'package:rehome/featured_pets.dart';
import 'package:rehome/widgets/categories_list.dart';

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
        color: const Color(0xFFF5F5F5),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Items
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Color(0xFF808080),
                          width: 0.1,
                        ),
                      ),
                      child: GestureDetector(
                          onTap: () {
                            // Open the drawer when the avatar is tapped
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: const Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/avatars/wony.jpg'),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'wonyoung',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Color(0xFF808080),
                          width: 0.1,
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Iconsax.notification,
                          color: Colors.black,
                          size: 28,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Search
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Search Friend",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.search_normal_1,
                          color: Color(0xFF808080),
                          size: 30.0,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "Search...",
                          style: TextStyle(
                              fontSize: 20.0, color: Color(0xFF808080)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Featured Pets
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Featured Pets",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              const FeaturedPets(),
              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              const CategoriesList(),
            ],
          ),
        ),
      ),
    );
  }
}
