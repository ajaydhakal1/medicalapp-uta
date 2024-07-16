import 'package:flutter/material.dart';

class DeviceManagement extends StatelessWidget {
  const DeviceManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Device Management',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/account_mgmt');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            ListTile(
              title: const Text("Connected Devices"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
              },
            ),
            ListTile(
              title: const Text("Login History"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
              },
            ),
          ],
        ),
      ),
    );
  }
}
