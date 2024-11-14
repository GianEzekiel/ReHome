import 'package:flutter/material.dart';
import 'package:rehome/home_page.dart';

class MainScreen extends StatelessWidget {

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/illustration.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Ready to rehome or adopt a new friend?',
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'ReHome connects you with responsible pet owners to rehome or adopt pets in need of a loving home.',
                  style: TextStyle(fontSize: 16.0, color: Color(0xFF535763)),
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),

          // Get Started Button
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 260,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(260, 60),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
