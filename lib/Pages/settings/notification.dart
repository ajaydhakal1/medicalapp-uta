import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool pauseAllNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Notification',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: SettingsList(
          sections: [
            SettingsSection(
              tiles: [
                SettingsTile.switchTile(
                  title: const Text('Pause all'),
                  description: const Text('Temporarily pause notification'),
                  activeSwitchColor: Colors.blue,
                  initialValue: pauseAllNotifications,
                  onToggle: (value) {
                    setState(() {
                      pauseAllNotifications = value;
                    });
                  },
                ),
                SettingsTile(
                  title: const Text('Email notification'),
                  leading: Icon(Icons.email),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onPressed: (BuildContext context) {
                    // Navigate to Email notification settings
                  },
                ),
                SettingsTile(
                  title: const Text('Messages'),
                  leading: Icon(Icons.message),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onPressed: (BuildContext context) {
                    // Navigate to Messages settings
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
