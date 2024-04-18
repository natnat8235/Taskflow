import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginPage

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Add any initialization logic here, such as loading assets or data
    // For demonstration, we'll just add a delay of 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // After the delay, navigate to the LoginPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });

    // Return a placeholder widget or a loading indicator while initializing
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Display a loading indicator
      ),
    );
  }
}
