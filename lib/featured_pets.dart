import 'package:flutter/material.dart';

class FeaturedPets extends StatelessWidget {
  const FeaturedPets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 220,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            buildImageCard(
              imagePath: 'assets/featured_pets/cat_1.jpg',
              name: 'Mae',
              location: 'Batangas City',
            ),
            const SizedBox(width: 20),
            buildImageCard(
              imagePath: 'assets/featured_pets/cat_2.jpg',
              name: 'Grace',
              location: 'San Juan',
            ),
            const SizedBox(width: 20),
            buildImageCard(
              imagePath: 'assets/featured_pets/dog.jpg',
              name: 'George',
              location: 'Lucena City',
            ),
            const SizedBox(width: 20),
            buildImageCard(
              imagePath: 'assets/featured_pets/bird.jpg',
              name: 'Wally',
              location: 'Laguna',
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildImageCard({
  required String imagePath,
  required String name,
  required String location,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Stack(
      children: [
        Container(
          width: 200,
          height: 220,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Gradient Overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        // Text and Icons Overlay
        Positioned(
          bottom: 20,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    location,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Heart Icon (Favorite Button)
        const Positioned(
          top: 10,
          right: 10,
          child: FavoriteIconButton(),
        ),
      ],
    ),
  );
}

class FavoriteIconButton extends StatefulWidget {
  const FavoriteIconButton({super.key});

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.white,
        size: 28,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite; // Toggle the state
        });
      },
    );
  }
}
