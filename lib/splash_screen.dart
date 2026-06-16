import 'dart:async'; // Provides the Timer class used for the 3-second delay

import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Import the next screen we navigate to

/// SplashScreen is a StatefulWidget because it needs to manage state (isLoading)
/// and trigger side effects (the navigation timer) during its lifecycle.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  /// Creates the mutable state object for this widget.
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

/// The private State class holds all mutable data and lifecycle logic
/// for the SplashScreen widget.
class _SplashScreenState extends State<SplashScreen> {
  /// Tracks whether the app is still on the loading/splash phase.
  bool isLoading = true;

  /// initState runs once when this widget is first inserted into the widget tree.
  /// We use it to start the 3-second timer that triggers navigation.
  @override
  void initState() {
    super.initState();

    // Timer waits 3 seconds then executes the callback once.
    Timer(const Duration(seconds: 3), () {
      // setState notifies Flutter that the state has changed so it rebuilds the widget.
      // Here we set isLoading to false to signal the splash phase is complete.
      setState(() {
        isLoading = false;
      });

      // Navigator.pushReplacement replaces the splash screen with the profile screen
      // so the user cannot navigate back to the splash screen with the back button.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        ),
      );
    });
  }

  /// build describes the UI of the splash screen.
  /// It is called every time setState is called.
  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic screen structure (background color, body, etc.)
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Light grey background for the splash

      // Center positions its child in the middle of the screen both horizontally and vertically.
      body: Center(
        // Column arranges its children vertically one after another.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers children along the vertical axis
          children: [

            // Image.asset loads an image from the local assets folder.
            // Displays the app logo at the top of the splash screen.
            Image.asset(
              "assets/logo.png",
              width: 120, // Constrains the logo width to 120 logical pixels
            ),

            // SizedBox adds empty vertical space between widgets.
            const SizedBox(height: 20),

            // Text displays the app name in a large bold style.
            const Text(
              "Cook with Taofikat",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Extra spacing to push the loading indicator toward the bottom.
            const SizedBox(height: 80),

            // CircularProgressIndicator shows an animated spinner
            // to indicate that the app is loading.
            const CircularProgressIndicator(
              color: Colors.redAccent, // Uses red to match the app's accent color
            ),
          ],
        ),
      ),
    );
  }
}