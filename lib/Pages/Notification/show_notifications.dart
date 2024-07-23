import 'package:flutter/material.dart';

class ShowNotifications extends StatefulWidget {
  const ShowNotifications({super.key});

  @override
  _ShowNotificationsState createState() => _ShowNotificationsState();
}

class _ShowNotificationsState extends State<ShowNotifications> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicatorPadding: const EdgeInsets.only(left: -25.0, right: -25.0, top: 4.0, bottom: 4.0),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
              shape: BoxShape.rectangle,
            ),
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'General'),
              Tab(text: 'Custom'),
              Tab(text: 'Other'),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildNotificationList(),
                const Center(child: Text('General Notifications')),
                const Center(child: Text('Custom Notifications')),
                const Center(child: Text('Other Notifications')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationList() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildNotificationCard(
          'Morning Medication reminder',
          'Dear Kaylan,\nIt\'s time to take your medication now. Your prescribed medication is Lisinopril, with a dosage of 10 mg. Please take it with a full glass of water.',
          '26 june, 12:45 pm',
        ),
        _buildNotificationCard(
          'Afternoon Medication Reminder',
          'Dear Kaylan,\nIt\'s time to take your medication now. Your prescribed medication is Lisinopril, with a dosage of 10 mg. Please take it with or without food.',
          '26 june, 12:45 pm',
        ),
        _buildNotificationCard(
          'Missed Medication Alert',
          'Dear Kaylan,\nYou missed a dose of your medication. Please take Lisinopril, with a dosage of 10 mg, as soon as possible unless it is almost time for your next dose.',
          '26 june, 12:45 pm',
        ),
      ],
    );
  }

  Widget _buildNotificationCard(String title, String content, String time) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.notifications, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}