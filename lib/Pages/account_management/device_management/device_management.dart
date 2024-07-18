import 'package:flutter/material.dart';

class DeviceManagement extends StatelessWidget {
  const DeviceManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Device Management',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/account_mgmt');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            ListTile(
              title: const Text("Connected Devices"),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              onTap: () {
                //handle navigation
              },
            ),
            ListTile(
              title: const Text("Login History"),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
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
