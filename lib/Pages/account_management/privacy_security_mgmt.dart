import 'package:flutter/material.dart';

class PrivacySecurityMgmt extends StatelessWidget {
  const PrivacySecurityMgmt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Privacy and Security',
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