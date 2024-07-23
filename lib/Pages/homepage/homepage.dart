import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
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
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 20.0),
              child: Text(
                'Hi\nKylan Gentry',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 20.0),
                child: IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.blue),
                  iconSize: 36.0,
                  style: IconButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: const Color.fromARGB(255, 194, 241, 255),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/show_notifications');
                  },
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    5,
                    (index) {
                      return Column(
                        children: [
                          Text(
                            '${10 + index}',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black54),
                          ),
                          const SizedBox(height: 8),
                          if (index == 2)
                            Container(
                              height: 2,
                              width: 20,
                              color: Colors.blue,
                            ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Time',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text('Medication',
                        style: TextStyle(fontSize: 16, color: Colors.black54)),
                    Text('All',
                        style: TextStyle(fontSize: 16, color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: [
                      _buildTimeSlot('07:00 AM', [
                        _buildMedicationCard('Paracetamol', '200mg', true),
                        _buildMedicationCard('Paracetamol', '200mg', true),
                        _buildMedicationCard('Paracetamol', '200mg', false),
                      ]),
                      _buildTimeSlot('07:00 AM', [
                        _buildMedicationCard('Paracetamol', '200mg', true),
                        _buildMedicationCard('Paracetamol', '200mg', true),
                        _buildMedicationCard('Paracetamol', '200mg', false),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              addMedicine;
            },
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            height: 100,
            shape: const CircularNotchedRectangle(),
            notchMargin: 6.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(LineAwesomeIcons.home_solid),
                    ),
                    const Text("Home"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(LineAwesomeIcons.search_solid),
                    ),
                    const Text("Search"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        DialogBox();
                      },
                      icon: const Icon(LineAwesomeIcons.clinic_medical_solid),
                    ),
                    const Text("Medication"),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      icon: const Icon(LineAwesomeIcons.user_circle_solid),
                    ),
                    const Text("Profile"),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildTimeSlot(String time, List<Widget> medications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(width: 8),
            const Expanded(child: Divider(color: Colors.black54)),
          ],
        ),
        const SizedBox(height: 8),
        ...medications,
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildMedicationCard(String name, String dosage, bool isActive) {
    return Card(
      color: isActive ? Colors.white : Colors.grey[200],
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.black : Colors.grey,
          ),
        ),
        subtitle: Text(
          dosage,
          style: TextStyle(
            fontSize: 14,
            color: isActive ? Colors.black54 : Colors.grey,
          ),
        ),
        trailing: Icon(
          FontAwesomeIcons.solidBell,
          color: isActive ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
