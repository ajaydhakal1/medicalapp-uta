import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text("Data and privacy settings"),
              onTap: (){
                //handle navigation
                Navigator.pushNamed(context, '/data_privacy_settings');
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text("Language Preference"),
              onTap: (){
                //handle navigation
                Navigator.pushNamed(context, '/language_pref');
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text("Account Management"),
              onTap: (){
                //handle navigation
                Navigator.pushNamed(context, '/account_mgmt');
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text("Notification"),
              onTap: (){
                //handle navigation
                Navigator.pushNamed(context, '/notification');
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text("Support and help"),
              onTap: (){
                //handle navigation
                Navigator.pushNamed(context, '/support_and_help');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text("Log out"),
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