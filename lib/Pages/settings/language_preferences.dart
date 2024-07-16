import 'package:flutter/material.dart';

class LanguagePreferences extends StatelessWidget {
  const LanguagePreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Language Preferences',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ),
    );
  }
}