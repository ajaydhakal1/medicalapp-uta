// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:profile_page/utils/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void addMedicine() {
    showDialog(
      context: context,
      builder: (context) {
        return const DialogBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Top Greeting Section
          const Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Column(
              children: [
                Text(
                  'Hi',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Kylan Gentry',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Medication List Section
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                const MedicationCard(
                    time: '07:00 AM', name: 'Paracetamol', dose: '200mg'),
                const MedicationCard(
                    time: '07:00 AM', name: 'Paracetamol', dose: '200mg'),
                const MedicationCard(
                    time: '07:00 AM',
                    name: 'Paracetamol',
                    dose: '200mg',
                    taken: true),
                const MedicationCard(
                    time: '07:00 AM', name: 'Paracetamol', dose: '200mg'),
                const MedicationCard(
                    time: '07:00 AM', name: 'Paracetamol', dose: '200mg'),
                const MedicationCard(
                    time: '07:00 AM',
                    name: 'Paracetamol',
                    dose: '200mg',
                    taken: true),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addMedicine,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            const SizedBox(width: 40), // The dummy child
            IconButton(
              icon: const Icon(Icons.medication),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MedicationCard extends StatelessWidget {
  final String time;
  final String name;
  final String dose;
  final bool taken;

  const MedicationCard({
    super.key,
    required this.time,
    required this.name,
    required this.dose,
    this.taken = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        title: Text(name, style: const TextStyle(fontSize: 16)),
        subtitle: Text(dose),
        trailing: Icon(
          Icons.lock,
          color: taken ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
