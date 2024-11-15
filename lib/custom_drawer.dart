import 'package:flutter/material.dart';
import 'package:rehome/adoption_guide.dart';
import 'package:rehome/favorites_screen.dart';
import 'package:rehome/messages.dart';
import 'package:rehome/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 0, 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30, // Adjust the size to match the image
                        backgroundImage: AssetImage('assets/avatars/wony.jpg'),
                      ),
                      SizedBox(
                          width:
                              16), // Add more space between the avatar and text
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text to the left
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center text vertically
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 20, // Adjust font size for the name
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
            
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(),
                ),
                CustomListTile(
                  icon: SizedBox(width: 30, height: 30, child: Image.asset('assets/icons/heart.png')),
                  text: 'Favorites',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FavoritesScreen()),
                    );
                  },
                ),
                CustomListTile(
                  icon: SizedBox(width: 30, height: 30, child: Image.asset('assets/icons/messages.png')),
                  text: 'Messages',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MessageScreen()),
                    );
                  },
                ),
                CustomListTile(
                  icon: SizedBox(width: 30, height: 30, child: Image.asset('assets/icons/book.png')),
                  text: 'Adoption Guide',
                  onTap: () {
                    // Handle navigation or action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdoptionGuideScreen()),
                    );
                  },
                ),
                CustomListTile(
                  icon: SizedBox(width: 30, height: 30, child: Image.asset('assets/icons/profile-circle.png')),
                  text: 'Profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                      );
                  },
                ),
                CustomListTile(
                  icon: SizedBox(width: 30, height: 30, child: Image.asset('assets/icons/message-question.png')),
                  text: 'About Us',
                  onTap: () {
                    // Handle navigation or action
                  },
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            child: CustomListTile(
              icon: SizedBox(width: 30, height: 30, child: Image.asset('assets/icons/logout.png')),
              text: 'Log Out',
              onTap: () {
                // Handle navigation or action
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Custom List Tile
class CustomListTile extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon, 
      title: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}
