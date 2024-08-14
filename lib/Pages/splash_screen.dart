import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality( // Wrap with Directionality
      textDirection: TextDirection.ltr, // Set the text direction (left-to-right or right-to-left)
      child: Scaffold(
        backgroundColor: Colors.white, // You can set this to match your logo background
        body: Center(
          child: Image.asset('assets/images/logo.png', width: 100, height: 100), // Replace with your logo asset
        ),
      ),
    );
  }
}