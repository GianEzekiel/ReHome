import 'package:flutter/material.dart';
import 'package:rehome/models/pet_model.dart';

class PetDetailsPage extends StatelessWidget {
  final PetModel pet;

  const PetDetailsPage({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pet.petName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(pet.petIconPath),
            SizedBox(height: 10),
            Text(
              'Name: ${pet.petName}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Age: ${pet.age}'),
            Text('Sex: ${pet.sex}'),
            Text('Weight: ${pet.weight}'),
            Text('Location: ${pet.location}'),
            SizedBox(height: 20),
            Text(
              'Owner: ${pet.ownerName}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset(pet.ownerIconPath),
            SizedBox(height: 20),
            Text(
              'Description: ${pet.description}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
