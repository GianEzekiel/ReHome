import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 170,
            child: const Align(
              alignment: Alignment.center,
              child: DrawerHeader(
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30, // Adjust the size to match the image
                      backgroundImage: AssetImage('lib/assets/avatar.jpg'),
                    ),
                    const SizedBox(
                        width:
                            16), // Add more space between the avatar and text
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the left
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center text vertically
                      children: [
                        const Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 20, // Adjust font size for the name
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                            height: 4), // Space between the name and email
                        Text(
                          'username@gmail.com',
                          style: TextStyle(
                            fontSize: 14, // Adjust font size for the email
                            color:
                                Colors.grey, // Light gray color for the email
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () {
              // Handle navigation or action
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Messages'),
            onTap: () {
              // Handle navigation or action
            },
          ),
          ListTile(
            leading: const Icon(Icons.pets),
            title: const Text('Adoption Guide'),
            onTap: () {
              // Handle navigation or action
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Community Support'),
            onTap: () {
              // Handle navigation or action
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // Handle navigation or action
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle navigation or action
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            onTap: () {
              // Handle navigation or action
            },
          ),
        ],
      ),
    );
  }
}
