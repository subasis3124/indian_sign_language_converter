import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISL Converter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple, // Default background color for Scaffold
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple, // Background color for SplashScreen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/sanchaar.png',
              height: 250, // Adjust height if needed
            ),
            const SizedBox(height: 20),
            const Text(
              'Translating Sign\nConnecting Mind',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text color
              ),
            ),
            const SizedBox(height: 50), // Space before the button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 50.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: Colors.white, // Button background color
              ),
              child: const Text(
                'Start now',
                style: TextStyle(fontSize: 20, color: Colors.purpleAccent), // Button text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ISL Converter'),
        centerTitle: true,
        backgroundColor: Colors.purple, // Ensure AppBar matches the theme
      ),
      body: const Center(
        child: Text(
          'Welcome to ISL Converter!',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white, // White text color for contrast on purple background
          ),
        ),
      ),
    );
  }
}
