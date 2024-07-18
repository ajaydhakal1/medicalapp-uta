import 'package:flutter/material.dart';

class AccountManagement extends StatelessWidget {
  const AccountManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Account Management',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            ListTile(
              title: const Text("Account information"),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
                Navigator.pushNamed(context, '/account_info');
              },
            ),
            ListTile(
              title: const Text("Medical information"),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
                Navigator.pushNamed(context, '/medical_info');
              },
            ),
            ListTile(
              title: const Text("Privacy and security"),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
                Navigator.pushNamed(context, '/privacy_security_mgmt');
              },
            ),
            ListTile(
              title: const Text("Device Management"),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
                Navigator.pushNamed(context, '/device_mgmt');
              },
            ),
          ],
        ),
      ),
    );
  }
}
