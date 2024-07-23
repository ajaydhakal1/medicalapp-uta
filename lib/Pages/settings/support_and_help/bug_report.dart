import 'package:flutter/material.dart';

class BugReport extends StatelessWidget {
  const BugReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bug Report"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/report_problem');
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 400,
              color: Colors.deepPurple,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 234, 245, 251),
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 140, right: 140),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  " 📸Add Attachment",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
