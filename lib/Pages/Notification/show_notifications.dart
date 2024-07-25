import 'package:flutter/material.dart';

class Notification {
  final String title;
  final String description;
  final String time;

  Notification({required this.title, required this.description, required this.time});
}

class ShowNotifications extends StatefulWidget {
  const ShowNotifications({super.key});

  @override
  _ShowNotificationsState createState() => _ShowNotificationsState();
}

class _ShowNotificationsState extends State<ShowNotifications> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Notification> allNotifications = [
    Notification(
      title: 'Morning Medication Reminder',
      description:
          'Dear Kaylan, it’s time to take your medication now. Your prescribed medication is Lisinopril, with a dosage of 10 mg. Please take it with a full glass of water.',
      time: '26 June, 12:45 pm',
    ),
    Notification(
      title: 'Afternoon Medication Reminder',
      description:
          'Dear Kaylan, it’s time to take your medication now. Your prescribed medication is Lisinopril, with a dosage of 10 mg. Please take it with or without food.',
      time: '26 June, 12:45 pm',
    ),
    Notification(
      title: 'Missed Medication Alert',
      description:
          'Dear Kaylan, you missed a dose of your medication. Please take Lisinopril, with a dosage of 10 mg, as soon as possible unless it is almost time for your next dose.',
      time: '26 June, 12:45 pm',
    ),
  ];

  final List<Notification> generalNotifications = [
    Notification(
      title: 'General Notification 1',
      description: 'This is a general notification.',
      time: '26 June, 12:45 pm',
    ),
    Notification(
      title: 'General Notification 2',
      description: 'This is another general notification.',
      time: '26 June, 1:00 pm',
    ),
  ];

  final List<Notification> customNotifications = [
    Notification(
      title: 'Custom Notification 1',
      description: 'This is a custom notification.',
      time: '26 June, 2:00 pm',
    ),
  ];

  final List<Notification> missedNotifications = [
    Notification(
      title: 'Missed Medication Alert',
      description:
          'Dear Kaylan, you missed a dose of your medication. Please take Lisinopril, with a dosage of 10 mg, as soon as possible unless it is almost time for your next dose.',
      time: '26 June, 12:45 pm',
    ),
  ];

  final List<Notification> weeklySummaryNotifications = [
    Notification(
      title: 'Weekly Summary',
      description: 'This is your weekly summary.',
      time: '26 June, 3:00 pm',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
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
        title: const Text('Notification'),
         leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 14.0, left: 23.0),
            child: TabBar(
              labelPadding: EdgeInsets.only(left: 40.0, right: 40.0),
              controller: _tabController,
              isScrollable: true,
              labelColor: Colors.white,
              tabAlignment: TabAlignment.start,
              indicatorPadding: EdgeInsets.only(left: -30.0, right: -30.0, top: 3.0, bottom: 3.0),
              indicator: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'General'),
                Tab(text: 'Custom'),
                Tab(text: 'Missed'),
                Tab(text: 'Weekly Summary'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNotificationList(allNotifications),
          _buildNotificationList(generalNotifications),
          _buildNotificationList(customNotifications),
          _buildNotificationList(missedNotifications),
          _buildNotificationList(weeklySummaryNotifications),
        ],
      ),
    );
  }

  Widget _buildNotificationList(List<Notification> notifications) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _buildNotificationCard(
          title: notification.title,
          description: notification.description,
          time: notification.time,
        );
      },
    );
  }

  Widget _buildNotificationCard({required String title, required String description, required String time}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              time,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
