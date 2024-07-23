import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text("Data and privacy settings"),
              onTap: (){
                //handle navigation
                Navigator.pushNamed(context, '/data_privacy_settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text("Language Preference"),
              onTap: (){
                //handle navigation
                Navigator.pushNamed(context, '/language_pref');
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text("Account Management"),
              onTap: (){
                //handle navigation
                Navigator.pushNamed(context, '/account_mgmt');
              },
            ),
            ListTile(
              leading: const Icon(LineAwesomeIcons.hackerrank),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text("Notification"),
              onTap: (){
                //handle navigation
                Navigator.pushNamed(context, '/notification');
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text("Support and help"),
              onTap: (){
                //handle navigation
                Navigator.pushNamed(context, '/support_and_help');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
              title: const Text("Log out"),
              onTap: (){
                //handle logout
                
              },
            ),
          ],
        ),
      ),
    );
  }
}