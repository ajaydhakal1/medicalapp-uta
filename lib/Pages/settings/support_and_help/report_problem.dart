import 'package:flutter/material.dart';

class ReportProblem extends StatelessWidget {
  const ReportProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report a problem"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/support_and_help');
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          ListTile(
            title: const Text("Report a bug"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/bug_report');
            },
          ),
          ListTile(
            title: const Text("Make a suggestion"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/make_suggestion');
            },
          ),
        ],
      ),
    );
  }
}