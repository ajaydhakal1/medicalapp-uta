import 'package:flutter/material.dart';

class SupportAndHelp extends StatelessWidget {
  const SupportAndHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Support and Help',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          ListTile(
            title: const Text("Report a problem"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/report_problem');
            },
          ),
          ListTile(
            title: const Text("Help Center"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/helpcenter');
            },
          ),
          ListTile(
            title: const Text("Feedback"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/feedback');
            },
          ),
        ],
      ),
    );
  }
}