// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Display Name',
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
                "Choose a memorable name to personalize your experience.",
                style: TextStyle(color: Color.fromARGB(177, 122, 122, 122)),
              ),
              const TextField(
                
              ),
        
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: TextButton(onPressed: (){}, child: const Text("Remove name", style: TextStyle(
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
