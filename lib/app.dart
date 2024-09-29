import 'package:apryt/screens/homepage.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'apryt',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: const Homepage(),
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        primary: Colors.deepPurple,
        secondary: Colors.amber,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 16.0,
          color: Colors.black54,
        ),
      ),
      useMaterial3: true,
    );
  }
}
