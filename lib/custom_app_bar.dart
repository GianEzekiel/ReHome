import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24), 
      ),
      backgroundColor: const Color(0xFFF4F4F4),
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: IconButton(
          icon: const Icon(Iconsax.arrow_left_2, color: Colors.black, size: 28),
          onPressed: onBackPress,
        ),
      ),
      leadingWidth: 40, 
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
