import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


class MedicalInformation extends StatefulWidget {
  const MedicalInformation({super.key});

  @override
  _MedicalInformationState createState() => _MedicalInformationState();
}

class _MedicalInformationState extends State<MedicalInformation> {
  bool _showPopup = false;

  @override
  void initState() {
    super.initState();
    // Start showing the popup after a delay
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showPopup = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _showPopup = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medication'),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _showPopup
              ? Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Shake well before use',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ).animate().fadeIn(duration: 500.ms).fadeOut(duration: 10000.ms)
              : Container(),
              const Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: MedicationCard(),
              ),
              const SizedBox(height: 16),
              const MedicationCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class MedicationCard extends StatelessWidget {
  const MedicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Paracetamol (500ml)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('After meal\nLiquid'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('8:00am - 8:00pm'),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
