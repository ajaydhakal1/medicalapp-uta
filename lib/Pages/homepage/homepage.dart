import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:profile_page/Pages/profile/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _selectedTab = 0; // 0: Time, 1: Medication, 2: All

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSubTabSelected(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void addMedicine() {
    showDialog(
      context: context,
      builder: (context) {
        return const DialogBox();
      },
    );
  }

  Widget _buildSelectedPage() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomePage();
      case 1:
        return const Center(child: Text('Search Page'));
      case 2:
        return const Center(child: Text('Medication Page'));
      case 3:
        return ProfilePage();
      default:
        return _buildHomePage();
    }
  }

  Widget _buildHomePage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Text(
                    'Hi\nKylan Gentry',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              5,
              (index) {
                return Column(
                  children: [
                    Text(
                      '${10 + index}',
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black54),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSubTabItem('Time', 0),
              _buildSubTabItem('Medication', 1),
              _buildSubTabItem('All', 2),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: _buildSubTabContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubTabItem(String label, int index) {
    return GestureDetector(
      onTap: () => _onSubTabSelected(index),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: _selectedTab == index
              ? Theme.of(context).colorScheme.primary
              : Colors.black54,
        ),
      ),
    );
  }

  List<Widget> _buildSubTabContent() {
    switch (_selectedTab) {
      case 0:
        return [
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
        ];
      case 1:
        return [
          _buildMedicationCard('Ibuprofen', '400mg', true),
          _buildMedicationCard('Ibuprofen', '400mg', false),
        ];
      case 2:
        return [
          _buildMedicationCard('Paracetamol', '200mg', true),
          _buildMedicationCard('Ibuprofen', '400mg', true),
          _buildMedicationCard('Aspirin', '100mg', false),
        ];
      default:
        return [];
    }
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildSelectedPage(),
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          backgroundColor: Colors.blue,
          onPressed: addMedicine,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(55, 213, 213, 213),
          height: 100,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildBottomNavigationBarItem(Icons.home, "Home", 0),
              _buildBottomNavigationBarItem(
                  LineAwesomeIcons.search_solid, "Search", 1),
              _buildBottomNavigationBarItem(
                  LineAwesomeIcons.clinic_medical_solid, "Medication", 2),
              _buildBottomNavigationBarItem(
                  LineAwesomeIcons.user_circle_solid, "Profile", 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBarItem(IconData icon, String label, int index) {
    return Column(
      children: [
        IconButton(
          onPressed: () => _onTabSelected(index),
          icon: Icon(icon,
              color: _selectedIndex == index ? Colors.blue : Colors.black54),
        ),
        Text(
          label,
          style: TextStyle(
              color: _selectedIndex == index ? Colors.blue : Colors.black54),
        ),
      ],
    );
  }
}

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100.0),
      child: ConstrainedBox(
        constraints:
            const BoxConstraints(maxWidth: 300), // Give it a maximum width
        child: AlertDialog(
          alignment: Alignment.bottomCenter,
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 200,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(4.0), // Added margin for spacing
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(235, 248, 252, 255),
                      ),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      )),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Icon(
                        Icons.home,
                        color: Color.fromARGB(255, 51, 180, 255),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
