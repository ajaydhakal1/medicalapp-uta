import 'package:flutter/material.dart';
import 'dart:math'; // Import for the 'max' function

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 300,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Add Medicine',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                  _buildPageContent(context, [
                    {
                      'label': 'Medicine',
                      'onPressed': () => _handleTap(context, 'Capsules')
                    },
                    {
                      'label': 'Measure',
                      'onPressed': () => _handleTap(context, 'Tablet')
                    },
                    {
                      'label': 'Medicine',
                      'onPressed': () => _handleTap(context, 'Inhalers')
                    },
                    {
                      'label': 'Dairy',
                      'onPressed': () => _handleTap(context, 'Liquid')
                    },
                    {
                      'label': 'Custom',
                      'onPressed': () => _handleTap(context, 'Custom')
                    },
                  ]),
                  _buildPageContent(context, [
                    {
                      'label': 'Capsules',
                      'onPressed': () => _handleTap(context, 'Capsules')
                    },
                    {
                      'label': 'Tablet',
                      'onPressed': () => _handleTap(context, 'Tablet')
                    },
                    {
                      'label': 'Inhalers',
                      'onPressed': () => _handleTap(context, 'Inhalers')
                    },
                    {
                      'label': 'Liquid',
                      'onPressed': () => _handleTap(context, 'Liquid')
                    },
                    {
                      'label': 'Drops',
                      'onPressed': () => _handleTap(context, 'Drops')
                    },
                    {
                      'label': 'Custom',
                      'onPressed': () => _handleTap(context, 'Custom')
                    },
                  ]),
                  // Updated third slide with the color selection interface
                  _buildColorSelectionPage(context, [
                    Colors.blueGrey.shade400,
                    Colors.blue.shade400,
                    Colors.teal.shade200,
                    Colors.orange.shade200,
                    Colors.lightBlue.shade100,
                  ]),
                ],
              ),
            ),
            const SizedBox(height: 10),
            DotsIndicator(
              controller: _controller,
              dotsCount: 3, // Update to match the number of slides
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap(BuildContext context, String label) {
    // Handle the icon tap here
    print('Tapped on $label');
    Navigator.of(context).pop(); // Close the dialog box
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MedicineNamePage()),
    );
  }

  Widget _buildPageContent(
      BuildContext context, List<Map<String, dynamic>> items) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: items.map((item) {
        return GestureDetector(
          onTap: item['onPressed'],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue.shade100,
                child: const Icon(
                  Icons.home, // Replace with the appropriate icon
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item['label'],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildColorSelectionPage(BuildContext context, List<Color> colors) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: colors.map((color) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MedicineNamePage(),
            ));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: color,
              ),
              const SizedBox(height: 10),
              // No text label as per the design
            ],
          ),
        );
      }).toList(),
    );
  }
}

class DotsIndicator extends AnimatedWidget {
  final PageController controller;
  final int dotsCount;

  DotsIndicator({
    required this.controller,
    required this.dotsCount,
  }) : super(listenable: controller);

  Widget _buildDot(int index) {
    double? page = controller.page;
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? controller.initialPage.toDouble()) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return Container(
      width: 8.0 * zoom,
      child: Center(
        child: Material(
          color: Colors.blue,
          type: MaterialType.circle,
          child: Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == (page?.round() ?? controller.initialPage)
                  ? Colors.blue
                  : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(dotsCount, _buildDot),
    );
  }
}

class MedicineNamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Medicine name',
                prefixIcon: Icon(Icons.medical_services),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nickname',
                prefixIcon: Icon(Icons.medical_services),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StrengthPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StrengthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Strength'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Other content from the previous page
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ConditionsPage(),
                    ),
                  );
                },
                child: Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConditionsPage extends StatefulWidget {
  @override
  _ConditionsPageState createState() => _ConditionsPageState();
}

class _ConditionsPageState extends State<ConditionsPage> {
  String? selectedCondition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You can select one or more conditions.'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile<String>(
              title: Text('Cardiovascular'),
              value: 'Cardiovascular1',
              groupValue: selectedCondition,
              onChanged: (value) {
                setState(() {
                  selectedCondition = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Cardiovascular'),
              value: 'Cardiovascular2',
              groupValue: selectedCondition,
              onChanged: (value) {
                setState(() {
                  selectedCondition = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Cardiovascular'),
              value: 'Cardiovascular3',
              groupValue: selectedCondition,
              onChanged: (value) {
                setState(() {
                  selectedCondition = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Cardiovascular'),
              value: 'Cardiovascular4',
              groupValue: selectedCondition,
              onChanged: (value) {
                setState(() {
                  selectedCondition = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Other'),
              value: 'Other',
              groupValue: selectedCondition,
              onChanged: (value) {
                setState(() {
                  selectedCondition = value;
                });
              },
            ),
            if (selectedCondition == 'Other') ...[
              Divider(),
              RadioListTile<String>(
                title: Text('Prefer not to say'),
                value: 'Prefer not to say',
                groupValue: selectedCondition,
                onChanged: (value) {
                  setState(() {
                    selectedCondition = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('Don’t know'),
                value: 'Don’t know',
                groupValue: selectedCondition,
                onChanged: (value) {
                  setState(() {
                    selectedCondition = value;
                  });
                },
              ),
            ],
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ScheduledMedicinePage(),
                    ),
                  );
                },
                child: Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ScheduledMedicinePage extends StatefulWidget {
  @override
  _ScheduledMedicinePageState createState() => _ScheduledMedicinePageState();
}

class _ScheduledMedicinePageState extends State<ScheduledMedicinePage> {
  String _selectedFrequency = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduled medicine'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRadioButton('Daily'),
                _buildRadioButton('Weekly'),
                _buildRadioButton('Monthly'),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'How many times a day',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text('1st time of the day'),
            Row(
              children: [
                Icon(Icons.alarm),
                SizedBox(width: 8),
                Expanded(
                  child: DropdownButton<String>(
                    value: '06:06 AM - 1 capsule',
                    items: <String>[
                      '06:06 AM - 1 capsule',
                      '08:00 AM - 1 capsule',
                      '12:00 PM - 1 capsule'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {},
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle the "Add" button press
                  Navigator.pushNamed(context, "/home");
                },
                child: Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton(String text) {
    return Row(
      children: [
        Radio<String>(
          value: text,
          groupValue: _selectedFrequency,
          onChanged: (String? value) {
            setState(() {
              _selectedFrequency = value!;
            });
          },
        ),
        Text(text),
      ],
    );
  }
}