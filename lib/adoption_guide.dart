import 'package:flutter/material.dart';
import 'package:rehome/custom_app_bar.dart';
import 'package:rehome/home_page.dart';

class AdoptionGuideScreen extends StatelessWidget {
  const AdoptionGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: CustomAppBar(
        title: "Adoption Guide",
        onBackPress: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        // color: const Color(0xFFF4F4F4),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Follow these steps to give a loving pet a new home through ReHOME.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16.0),
              GuideStep(
                stepNumber: 'Step 1',
                title: 'Browse',
                description:
                    'Search our database of pets needing homes. Use filters to find pets that match your lifestyle.',
                icon: Icons.check_circle_outline,
              ),
              GuideStep(
                stepNumber: 'Step 2',
                title: 'Connect',
                description:
                    'Reach out to pet owners through our secure messaging system to ask questions and arrange meetings.',
                icon: Icons.people_outline,
              ),
              GuideStep(
                stepNumber: 'Step 3',
                title: 'Meet',
                description:
                    'Schedule a meet-and-greet with the pet and its current owner to ensure it\'s a good match.',
                icon: Icons.info_outline,
              ),
              GuideStep(
                stepNumber: 'Step 4',
                title: 'Adopt',
                description:
                    'Complete the adoption process, including any necessary paperwork and fees.',
                icon: Icons.file_copy_outlined,
              ),
              const SizedBox(height: 24.0),
              const Center(
                child: Text(
                  'Adoption Tips',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const TipSection(
                title: 'Prepare Your Home',
                tips: [
                  'Pet-proof your living space',
                  'Purchase necessary supplies (food, bed, toys, etc.)',
                  'Set up a designated area for your new pet',
                  'Research pet care specific to the breed',
                ],
              ),
              const TipSection(
                title: 'Consider Your Lifestyle',
                tips: [
                  'Assess your daily schedule and time commitment',
                  'Consider your living space and any restrictions',
                  'Think about your long-term plans',
                  'Evaluate your budget for pet care expenses',
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Ready to Adopt?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Start your journey to find your perfect pet companion today',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Add your navigation or functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'Browse Available Pets',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GuideStep extends StatelessWidget {
  final String stepNumber;
  final String title;
  final String description;
  final IconData icon;

  GuideStep({
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set background color to white
        border: Border.all(color: Color(0xFF808080), width: 0.3),
        borderRadius: BorderRadius.circular(4.0), // optional rounded corners
      ),
      margin:
          const EdgeInsets.symmetric(vertical: 8.0), // Margin around each card
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 30.0, color: Colors.black),
                const SizedBox(width: 8.0), // Space between icon and title
                Text(
                  '$stepNumber: $title',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0), // Space between title row and subtitle
            Text(
              description,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TipSection extends StatelessWidget {
  final String title;
  final List<String> tips;

  const TipSection({
    required this.title,
    required this.tips,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF808080), width: 0.3),
        borderRadius: BorderRadius.circular(4.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 12.0),
          ...tips.map((tip) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Center align items in the Row
                  children: [
                    const Icon(
                      Icons.fiber_manual_record,
                      color: Colors.black,
                      size: 8.0,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        tip,
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
