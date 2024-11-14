import 'package:flutter/material.dart';
import 'package:rehome/models/pet_model.dart';
import 'package:rehome/pet_details_page.dart';

class PetGrid extends StatefulWidget {
  const PetGrid({super.key});

  @override
  State<PetGrid> createState() => _PetGridState();
}

class _PetGridState extends State<PetGrid> {
  List<PetModel> pets = [];
  List<bool> likedPets = [];


  void _getPets() {
    pets = PetModel.getPets();
    likedPets = List.generate(pets.length, (index) => false);
  }

   @override
  void initState() {
    super.initState();
    _getPets();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.builder(
        shrinkWrap: true, // Ensures the grid doesn't take up extra space
        physics:
            const NeverScrollableScrollPhysics(), // Prevents scrolling of the grid (parent ScrollView handles scrolling)
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 20, // Space between columns
          mainAxisSpacing: 20, // Space between rows
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
}