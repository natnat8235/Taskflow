import 'package:flutter/material.dart';
import 'splashscreen.dart'; // Import the SplashScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Task Flow',
      home: SplashScreen(), // Start with the SplashScreen
    );
  }
}
