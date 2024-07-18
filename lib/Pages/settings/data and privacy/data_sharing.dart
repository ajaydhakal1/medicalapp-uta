import 'package:flutter/material.dart';

class DataSharing extends StatelessWidget {
  const DataSharing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Data Sharing',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/data_privacy_settings');
          },
        ),
      ),
    );
  }
}