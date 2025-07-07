import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // General
  static const Color primaryBlue = Color(0xFF0288D1);
  static const Color darkBlue = Color(0xFF01579B);
  static const Color lightBlue100 = Color(0xFFB3E5FC);
  static const Color lightBlue200 = Color(0xFF81D4FA);
  static const Color lightBlueAccent = Color(0xFF4FC3F7);
  static const Color white = Colors.white;
  static const Color black87 = Colors.black87;

  // Opacity variations
  static Color semiTransparentWhite = Colors.white.withOpacity(0.2);
  static Color blueGreyText = Colors.blueGrey.shade500;
}
