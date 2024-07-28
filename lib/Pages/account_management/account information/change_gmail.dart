// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ChangeGmail extends StatelessWidget {
  const ChangeGmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Change Email',
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
                "Choose your most used gmail.",
                style: TextStyle(color: Color.fromARGB(177, 122, 122, 122)),
              ),
              const TextField(
                
              ),
        
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: TextButton(onPressed: (){}, child: const Text("Change Gmail", style: TextStyle(
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
