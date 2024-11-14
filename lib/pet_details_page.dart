import 'package:flutter/material.dart';
import 'package:rehome/models/pet_model.dart';

class PetDetailsPage extends StatelessWidget {
  final PetModel pet;

  const PetDetailsPage({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(),
          backButton(context),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    petHeader(),
                    const SizedBox(width: 5),
                    locationTitle(),
                    const SizedBox(height: 10),
                    petDetails(),
                    const SizedBox(height: 15),
                    ownerDetails(),
                    const SizedBox(height: 15),
                    petDescription(),
                    const SizedBox(height: 35),
                    adoptButton()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text petDescription() {
    return Text(
                    pet.description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  );
  }

  Align adoptButton() {
    return Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 138, vertical: 20),
                      ),
                      child: const Text(
                        "Adopt Me",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
  }

  Row ownerDetails() {
    return Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(pet.ownerIconPath),
                        radius: 25,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pet.ownerName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${pet.petName}\'s Owner',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.message_outlined),
                        ),
                      ),
                    ],
                  );
  }

  Row petDetails() {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFADC7),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(pet.sex,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              'Sex',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                            color: const Color(0xFFDEF3FD),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(pet.age,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              'Age',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                            color: const Color(0xFFBEFFF6),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(pet.weight,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              'Weight',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
  }

  Row locationTitle() {
    return Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.blue,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        pet.location,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
  }

  Row petHeader() {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pet.petName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border_outlined,
                            ),
                            iconSize: 20,
                            padding: EdgeInsets.zero,
                          ),
                      ),
                    ],
                  );
  }

  Positioned backButton(BuildContext context) {
    return Positioned(
          top: 40,
          left: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black.withOpacity(0.8),
                size: 30,
              ),
            ),
          ),
        );
  }

  Positioned backgroundImage() {
    return Positioned.fill(
          child: Image.asset(
            pet.petIconPath,
            fit: BoxFit.cover,
          ),
        );
  }
}
