import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import the first screen shown on app launch

/// main() is the entry point of every Flutter application.
/// It calls runApp() to inflate the root widget and attach it to the screen.
void main() {
  runApp(const CookpediaApp());
}

/// CookpediaApp is the root widget of the application.
/// It uses StatelessWidget because the app-level configuration never changes.
class CookpediaApp extends StatelessWidget {
  const CookpediaApp({super.key});

  /// build returns the MaterialApp which sets up the overall app theme,
  /// title, and the first screen to display (SplashScreen).
  @override
  Widget build(BuildContext context) {
    // MaterialApp provides the navigation, theme, and Material Design baseline.
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner in the top-right corner
      title: "Cookpedia",               // App title used by the OS (e.g. in the task switcher)
      home: const SplashScreen(),       // SplashScreen is the first screen shown on launch
    );
  }
}