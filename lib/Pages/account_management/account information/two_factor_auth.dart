import 'package:flutter/material.dart';

class TwoFactorAuth extends StatelessWidget {
  const TwoFactorAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Two Factor Authentication',
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
                "Keep in mind that if you lose access to your wat to generate a login code, you could get locked out of your account.",
                style: TextStyle(color: Color.fromARGB(213, 0, 0, 0)),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Center(
                    child: Text(
                      "Do you want to enable Two Factor Authentication?",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(120.0),
                    child: ElevatedButton(onPressed: (){}, child: Text("Continue")),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
