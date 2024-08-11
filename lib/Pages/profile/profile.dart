// profile_page.dart

// ignore_for_file: prefer_const_constructors

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:profile_page/Pages/profile/profile_update.dart';
import 'package:profile_page/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkMode = false;

  Future<void> _displayBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      shape: BeveledRectangleBorder(),
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 150,
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 5.0, left: 10.0, right: 10.0, bottom: 2.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11.0, bottom: 20.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Are you sure you want to log out?",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 70.0, right: 70.0),
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.blue,
                          width: 1.0,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 70.0, right: 70.0),
                      ),
                      child: Text("No"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: SingleChildScrollView(
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                  DottedBorder(
                    dashPattern: const [8, 4],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(8.0),
                    color: Color.fromARGB(204, 169, 169, 169),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.transparent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        // Handle Edit Profile
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfilePage(),
                          ),
                        );
                      },
                      child: Text(
                        '✏️_ Edit Profile',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  DottedBorder(
                    dashPattern: const [8, 4],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(8.0),
                    color: Colors.blue,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.transparent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        // Handle Parental Guide
                      },
                      child: Text(
                        '✏️_ Parental Guide',
                        style: TextStyle(
                          color: Color.fromARGB(238, 186, 185, 184),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(height: 16),
              ),
              ListTile(
                leading: Icon(LineAwesomeIcons.home_solid),
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
                  value: Provider.of<ThemeProvider>(context).isDarkMode,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
                title: Text('Log Out'),
                onTap: () => _displayBottomSheet(context),
              ),
              ListTile(
                  leading: ElevatedButton(
                onPressed: () async {
                  AwesomeNotifications().createNotification(
                    content: NotificationContent(
                        id: 1,
                        groupKey: "Reminders",
                        category: NotificationCategory.Reminder,
                        displayOnForeground: true,
                        displayOnBackground: true,
                        wakeUpScreen: true,
                        channelKey: "med_reminder",
                        title: "Hello World!",
                        body: "Hey, this is notification test"),
                  );
                },
                child: Text("Get Notification"),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
