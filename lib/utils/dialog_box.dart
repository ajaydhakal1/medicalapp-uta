import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300), // Give it a maximum width
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
