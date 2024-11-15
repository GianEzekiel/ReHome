import 'package:flutter/material.dart';
import 'package:rehome/models/pet_model.dart';

class PetDetailsPage extends StatefulWidget {
  final PetModel pet;

  const PetDetailsPage({super.key, required this.pet});

  @override
  _PetDetailsPageState createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends State<PetDetailsPage> {
  final GlobalKey _descriptionKey = GlobalKey(); // Key to measure description height
  double _maxChildSize = 0.55; // Default maxChildSize

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_measureDescriptionHeight);
  }

  // Measure the height of the description text after the widget is built
  void _measureDescriptionHeight(Duration time) {
    final RenderBox renderBox = _descriptionKey.currentContext!.findRenderObject() as RenderBox;
    final descriptionHeight = renderBox.size.height;

    // Update maxChildSize dynamically based on the height of the description
    setState(() {
      // Ensure the maxChildSize doesn't exceed the full screen
      _maxChildSize = (descriptionHeight / MediaQuery.of(context).size.height).clamp(0.55, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(),
          backButton(context),

          DraggableScrollableSheet(
            initialChildSize: 0.55, 
            minChildSize: 0.33,
            maxChildSize: _maxChildSize, // Dynamic height
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      petHeader(),
                      const SizedBox(height: 5),
                      locationTitle(),
                      const SizedBox(height: 10),
                      petDetails(),
                      const SizedBox(height: 15),
                      ownerDetails(),
                      const SizedBox(height: 15),
                      petDescription(),
                      const SizedBox(height: 85), 
                    ],
                  ),
                ),
              );
            },
          ),
          adoptButton(),
        ],
      ),
    );
  }

  Text petDescription() {
    return Text(
      widget.pet.description,
      key: _descriptionKey, // Key for measuring length
      style: const TextStyle(
        fontSize: 14,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Positioned adoptButton() {
    return Positioned(
      bottom: 30, // Distance from the bottom of the screen
      left: 16,
      right: 16,
      child: Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 138, vertical: 20),
          ),
          child: const Text(
            "Adopt Me",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Row ownerDetails() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(widget.pet.ownerIconPath),
          radius: 25,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.pet.ownerName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${widget.pet.petName}\'s Owner',
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
            onPressed: () {},
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
              color: widget.pet.color,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.pet.sex,
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
        const SizedBox(width: 15),
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
              color: const Color(0xFFDEF3FD),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.pet.age,
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
        const SizedBox(width: 15),
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
              color: const Color(0xFFBEFFF6),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.pet.weight,
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
          widget.pet.location,
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
          widget.pet.petName,
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
        widget.pet.petIconPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
