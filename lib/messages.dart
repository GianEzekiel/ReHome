import 'package:flutter/material.dart';
import 'package:rehome/custom_app_bar.dart';
import 'package:rehome/home_page.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  Widget buildUserRow(
      String avatarPath, String username, String email, String extraInfo) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(avatarPath),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      email,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      extraInfo,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: CustomAppBar(
        title: "Messages",
        onBackPress: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
      ),
      body: Container(
        color: const Color(0xFFF4F4F4),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50.0,
                  width: 363.0,
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

                // Replace this section with individual calls to `buildUserRow`
                buildUserRow('assets/avatars/chaewon.jpg', 'Kim Chaewon',
                    'hm po', '2:30 pm'),
                buildUserRow(
                    'assets/avatars/julie.jpg', 'Julie', 'meet up?', '1:54 pm'),
                buildUserRow('assets/avatars/jungkook.jpg', 'Jungkook', 'hm po',
                    '1:30 pm'),
                buildUserRow(
                    'assets/avatars/ken.jpg', 'Ken', 'hm po', '12:47 pm'),
                buildUserRow(
                    'assets/avatars/stell.jpg', 'Stell', 'hm po', '12:37 pm'),
                // Repeat as needed for other users
              ],
            ),
          ),
        ),
      ),
    );
  }
}
