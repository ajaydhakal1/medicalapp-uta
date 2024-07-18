import 'package:flutter/material.dart';

class ChangeUsername extends StatelessWidget {
  const ChangeUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Change Username',
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
                "Choose your unique username.",
                style: TextStyle(color: Color.fromARGB(177, 122, 122, 122)),
              ),
              const TextField(
                
              ),
        
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: TextButton(onPressed: (){}, child: const Text("Change username", style: TextStyle(
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
