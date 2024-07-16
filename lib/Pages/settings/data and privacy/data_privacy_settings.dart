import 'package:flutter/material.dart';

class DataPrivacySettings extends StatelessWidget {
  const DataPrivacySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Data and Privacy Settings',
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
              title: const Text("Data sharing"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
                Navigator.pushNamed(context, '/data_sharing');
              },
            ),
            ListTile(
              title: const Text("Privacy settings"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
                Navigator.pushNamed(context, '/privacy_settings');
              },
            ),
            ListTile(
              title: const Text("Export data"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
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