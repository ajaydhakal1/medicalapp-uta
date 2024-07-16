import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Change Password',
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
                "To set a new password, please enter your current password first.",
                style: TextStyle(color: Color.fromARGB(177, 122, 122, 122)),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Current Password",
                  hintStyle: TextStyle(color: Colors.white38),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: ElevatedButton(onPressed: () {}, child: Text("Continue")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
