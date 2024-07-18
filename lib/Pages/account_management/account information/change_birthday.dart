import 'package:flutter/material.dart';

class ChangeBirthday extends StatelessWidget {
  const ChangeBirthday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Your Birthday',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
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
                "Enter your birthday to receive timely reminders and personalized insights.",
                style: TextStyle(color: Color.fromARGB(177, 122, 122, 122)),
              ),
              const TextField(
                
              ),
        
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: TextButton(onPressed: (){}, child: const Text("Change birthday", style: TextStyle(
                  color: Colors.blue,
                ),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
