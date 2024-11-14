import 'package:flutter/material.dart';
import 'main_screen.dart'; // Import the MainScreen class

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {  // Check if the widget is still in the widget tree
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Stack(
          children: [
            // Logo
            Center(
              child: Image.asset(
                'assets/logo.png',
                height: 253.0,
                width: 253.0,
              ),
            ),

            // App Name
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'ReHOME',
                  style: TextStyle(
                    fontSize: 44.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );   
  }
}
