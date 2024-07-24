import 'package:flutter/material.dart';


class TwoFactorAuth extends StatefulWidget {
  const TwoFactorAuth({super.key});

  @override
  _TwoFactorAuthState createState() => _TwoFactorAuthState();
}

class _TwoFactorAuthState extends State<TwoFactorAuth> {
  bool showVerificationOptions = false;

  void _onContinue() {
    setState(() {
      showVerificationOptions = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Two factor Authentication',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: showVerificationOptions ? _buildVerificationOptions() : _buildInitialContent(),
      ),
    );
  }

  Widget _buildInitialContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Text(
            'Keep in mind that if you lose access to your way to generate a login Code, you could get locked out of your account',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(top: 70.0, bottom: 52.0),
          child: Text(
            'Do you want to enable Two Factor Authentication?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: _onContinue,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Continue',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationOptions() {
    return Column(
      children: [
        Text(
          'Please choose how you want to receive your verification code.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        SizedBox(height: 40),
        ListTile(
          title: Text(
            'Text Verification',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'A code will be sent to +9779834534567',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        ListTile(
          title: Text(
            'Authentication App',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Generate a code on your device using an app such as Google Authentication',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            // Handle the next step here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Continue',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
