import 'package:flutter/material.dart';

class ChangeNumber extends StatelessWidget {
  const ChangeNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Change Mobile Number',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/account_info');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              const Text(
                "Provide your phone number for account security and important notifications.",
                style: TextStyle(color: Color.fromARGB(177, 122, 122, 122)),
              ),
              const TextField(),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Change number",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
