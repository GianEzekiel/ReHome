import 'package:flutter/material.dart';
import 'package:rehome/custom_app_bar.dart';
import 'package:rehome/home_page.dart';
import 'package:rehome/models/team_models.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  List<TeamModels> team = [];

  void _getTeam() {
    team = TeamModels.getTeam();
  }

  @override
  void initState() {
    super.initState();
    _getTeam();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'About Us',
        onBackPress: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'About ReHOME',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  'ReHOME is dedicated to connecting loving homes with pets in need, creating happy endings for animals and families alike.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff535763),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: 374,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF808080),
                      width: 0.6,
                    ),
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 30,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Our Mission',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          'To create a world where every pet has a loving home, by facilitating responsible pet adoption and fostering a community of caring pet owners.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 374,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF808080),
                      width: 0.6,
                    ),
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.shield_outlined,
                              size: 30,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Our Values',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("•  "), // Bullet point
                                  Expanded(
                                    child: Text("Compassion for animals"),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("•  "),
                                  Expanded(
                                    child: Text("Responsible pet ownership"),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("•  "),
                                  Expanded(
                                    child: Text("Transparency and trust"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  'Our Team',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  'Meet the passionate individuals behind ReHOME, dedicated to making a difference in the lives of pets and their adoptive families.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff535763),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    shrinkWrap: true, // Ensures the grid doesn't take up extra space
                    physics: const NeverScrollableScrollPhysics(), // Prevents scrolling of the grid (parent ScrollView handles scrolling)
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 columns
                      crossAxisSpacing: 20, // Space between columns
                      mainAxisSpacing: 20, // Space between rows
                      childAspectRatio: 0.8, // Square containers
                    ),
                    itemCount: team.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 500,
                        width: 176,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF808080),
                            width: 0.6,
                          ),
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 55,
                              backgroundImage: AssetImage(team[index].picturePath),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              team[index].teamName,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600, 
                              ),
                            ),
                            Text(
                              team[index].teamRole,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff535763), 
                              ),
                            )          
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
