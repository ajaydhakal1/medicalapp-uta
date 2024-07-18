import 'package:flutter/material.dart';

class DataPrivacySettings extends StatelessWidget {
  const DataPrivacySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Data and Privacy Settings',
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
              title: const Text("Data sharing"),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
                Navigator.pushNamed(context, '/data_sharing');
              },
            ),
            ListTile(
              title: const Text("Privacy settings"),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
                Navigator.pushNamed(context, '/privacy_settings');
              },
            ),
            ListTile(
              title: const Text("Export data"),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle export data
                
              },
            ),
          ],
        ),
      ),
    );
  }
}