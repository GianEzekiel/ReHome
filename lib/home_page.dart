import 'package:flutter/material.dart';
import 'package:rehome/featured_pets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xFFF4F4F4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('lib/assets/avatar.jpg'),
                    ),
                    SizedBox(width: 8),
                    Text(
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
            const SizedBox(height: 20), // Spacing between header and content
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Search Friend",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ), // Add more widgets here if needed
            ),
            Container(
              height: 50.0,
              width: 373.0,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D8D8),
                borderRadius: BorderRadius.circular(
                    25.0), // Set your desired border radius here
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: const Row(
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
                fontSize: 30.0,
              ),
            ),
            const FeaturedPets(),
          ],
        ),
      ),
    ));
  }
}
