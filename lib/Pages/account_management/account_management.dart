import 'package:flutter/material.dart';

class AccountManagement extends StatelessWidget {
  const AccountManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Account Management',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            ListTile(
              title: const Text("Account information"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
                Navigator.pushNamed(context, '/account_info');
              },
            ),
            ListTile(
              title: const Text("Medical information"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
                Navigator.pushNamed(context, '/medical_info');
              },
            ),
            ListTile(
              title: const Text("Privacy and security"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
                Navigator.pushNamed(context, '/privacy_security_mgmt');
              },
            ),
            ListTile(
              title: const Text("Device Management"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
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
