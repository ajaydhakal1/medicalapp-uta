// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:profile_page/theme/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

final ThemeManager _themeManager = ThemeManager();
final ThemeMode _themeMode = ThemeMode.light;
bool isDarkMode = false;

  void handleLogOut() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          ElevatedButton(
            onPressed: () {
              // handle logout
              Navigator.of(context).pop();
            },
            child: Text("Yes"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("No"),
          ),
        ],
        title: Text("Log Out"),
        content: Text("Are you sure you want to log out?"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/images/avatar.png'), // Add your avatar image
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ajay Dhakal',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('Shibuya, Japan'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Handle Edit Profile
                    Navigator.pushNamed(context, '/editprofile');
                  },
                  child: Text('✏️ Edit Profile'),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Handle Parental Guide
                  },
                  child: Text(
                    '✏️ Parental Guide',
                    style: TextStyle(
                      color: Color.fromARGB(204, 123, 123, 123),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.medical_services),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text('Medical details'),
              onTap: () {
                // Handle Medical details
                Navigator.pushNamed(context, '/medical_details');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text('Medical Information'),
              onTap: () {
                // Handle Medical Information
                Navigator.pushNamed(context, '/medical_information');
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment_turned_in),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text('Adherence'),
              onTap: () {
                // Handle Adherence
                Navigator.pushNamed(context, '/adherence');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
              title: Text('Settings'),
              onTap: () {
                // Handle Settings
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Light/dark mode'),
              trailing: Switch(
               value: _themeManager.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  setState(() {
                    _themeManager.toggleTheme(value);
                  });
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ListTile(
                  leading: Icon(Icons.logout),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                  title: Text('Log Out'),
                  onTap: handleLogOut,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
