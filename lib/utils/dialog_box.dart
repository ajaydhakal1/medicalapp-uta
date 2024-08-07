import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: AlertDialog(
          alignment: Alignment.bottomCenter,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: Colors.white,
          title: const Center(child: Text('Add', style: TextStyle(fontSize: 20.0))),
          content: SizedBox(
            height: 220,
            child: PageView(
              children: [
                buildGridPage(),
                buildGridPage(),
                buildGridPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGridPage() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                const Color.fromARGB(235, 248, 252, 255),
              ),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              )),
              elevation: WidgetStateProperty.all(0), // No shadow
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock, // Replace with the appropriate icon
                  color: Color.fromARGB(255, 51, 180, 255),
                ),
                SizedBox(height: 8),
                Text(
                  'Option', // Replace with the appropriate label
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
