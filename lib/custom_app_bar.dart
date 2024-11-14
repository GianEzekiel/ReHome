import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackPress;

  const CustomAppBar({
    super.key, // Converted to a super parameter
    required this.title,
    required this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.black), // Set text color if needed
      ),
      backgroundColor: const Color(0xFFF4F4F4),
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: onBackPress,
        ),
      ),
      leadingWidth: 30, // Adjust this value as needed
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
