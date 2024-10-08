import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 32.0, // For large headings (e.g., "Getting Started")
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle subHeading = TextStyle(
    fontSize: 20.0, // For song titles, subheadings
    fontWeight: FontWeight.w500,
    color: Colors.white70,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16.0, // For smaller text (e.g., song artist, descriptions)
    fontWeight: FontWeight.normal,
    color: Colors.white60,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18.0, // For button labels (e.g., "Let's Go")
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle searchField = TextStyle(
    fontSize: 18.0,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
}
