import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool pauseNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Notification',
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            ListTile(
              title: const Text(
                'Pause all',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              trailing: Switch(
                value: pauseNotification,
                onChanged: (value) {
                  setState(() {
                    pauseNotification = value;
                  });
                },
              ),
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text(
                'Email Notification',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text(
                'Messages',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
