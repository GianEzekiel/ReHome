import 'package:flutter/material.dart';

class PetModel {
  String petName;
  String petIconPath;
  String location;
  String sex;
  String age;
  String weight;
  String ownerName;
  String ownerIconPath;
  String description;
  Color color;

  PetModel({
    required this.petName,
    required this.petIconPath,
    required this.location,
    required this.sex,
    required this.age,
    required this.weight,
    required this.ownerName,
    required this.ownerIconPath,
    required this.description,
    required this.color,
  });

  static List<PetModel> getPets(){
    List<PetModel> pets = [];

    pets.add(
      PetModel(
        petName: 'Whiskers',
        petIconPath: 'assets/images/whiskers.jpg',
        location: 'Calamba',
        sex: 'Female',
        age: '3 years',
        weight: '8 lbs',
        ownerName: 'Sarah Johnson',
        ownerIconPath: 'assets/images/sarah.jpg',
        description: 'Whiskers is a playful and curious tabby cat who loves to chase feathers and sunbathe by the window.',
        color: const Color(0xFFFFADC7)
      )
    );

    pets.add(
      PetModel(
        petName: 'Max',
        petIconPath: 'assets/images/max.jpg',
        location: 'Alangilan',
        sex: 'Male',
        age: '5 years',
        weight: '25 lbs',
        ownerName: 'Tom Rivera',
        ownerIconPath: 'assets/images/tom.jpg',
        description: 'Max is an energetic dog with a keen nose for scents and an endless love for outdoor adventures.',
        color: const Color(0xFFc7dbf5)
      )
    );

    pets.add(
        PetModel(
          petName: 'Bubbles',
          petIconPath: 'assets/images/bubbles.jpg',
          location: 'Alitagtag',
          sex: 'Female',
          age: '1 year',
          weight: '0.2 lbs',
          ownerName: 'Lily Chen',
          ownerIconPath: 'assets/images/lily.jpg',
          description: 'Bubbles is a bright orange betta fish who loves swimming around her tank and hiding in decorative plants.',
          color: const Color(0xFFFFADC7)
        )
    );
      
    pets.add(
        PetModel(
          petName: 'Coco',
          petIconPath: 'assets/images/coco.jpg',
          location: 'Manila',
          sex: 'Male',
          age: '2 years',
          weight: '0.5 lbs',
          ownerName: 'Ahmed Malik',
          ownerIconPath: 'assets/images/ahmed.jpg',
          description: 'Coco is a talkative parrot who enjoys mimicking sounds and chirping along with his favorite tunes.',
          color: const Color(0xFFc7dbf5)
        )
    );

    pets.add(
        PetModel(
          petName: 'Luna',
          petIconPath: 'assets/images/luna.jpg',
          location: 'Sto. Tomas',
          sex: 'Female',
          age: '4 years',
          weight: '9 lbs',
          ownerName: 'Emily Gomez',
          ownerIconPath: 'assets/images/emily.jpg',
          description: 'Luna is a quiet, graceful cat who loves napping in cozy spots and observing the world from afar.',
          color: const Color(0xFFFFADC7)
        )
    );

    pets.add(
        PetModel(
          petName: 'Rocky',
          petIconPath: 'assets/images/rocky.jpg',
          location: 'Pablo Borbon',
          sex: 'Male',
          age: '7 years',
          weight: '30 lbs',
          ownerName: 'Kevin Walker',
          ownerIconPath: 'assets/images/kevin.jpg',
          description: 'Rocky is a loyal energetic dog who enjoys playing fetch and is always ready for a cuddle with his family.',
          color: const Color(0xFFc7dbf5)
        )
    );
    
    return pets;
  }
}



