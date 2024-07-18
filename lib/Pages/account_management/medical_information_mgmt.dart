import 'package:flutter/material.dart';

class MedicalInformationMgmt extends StatelessWidget {
  const MedicalInformationMgmt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Medical Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/account_mgmt');
          },
        ),
      ),
    );
  }
}