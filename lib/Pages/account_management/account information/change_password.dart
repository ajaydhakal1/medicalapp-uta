import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool showSetPasswordPage = false;
  bool showUpdatedMessage = false;
  bool isPasswordVisible1 = false;
  bool isPasswordVisible2 = false;

  void _onContinue() {
    setState(() {
      if (showSetPasswordPage) {
        showUpdatedMessage = true;
      } else {
        showSetPasswordPage = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Password',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: showUpdatedMessage
            ? _buildUpdatedMessagePage()
            : showSetPasswordPage
                ? _buildSetPasswordPage()
                : _buildChangePasswordPage(),
      ),
    );
  }

  Widget _buildChangePasswordPage() {
    return Column(
      children: [
        const Text(
          "To set a new password, please enter your current password first.",
          style: TextStyle(color: Color.fromARGB(177, 122, 122, 122)),
        ),
        const SizedBox(height: 20),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Current Password",
            hintStyle: TextStyle(color: Colors.black38),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Forgot your password?",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 100,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: _onContinue,
            child: const Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSetPasswordPage() {
    return Column(
      children: [
        const Text(
          'Set a good password by using a combination of lowercase and uppercase letters, numbers and symbols.',
          style: TextStyle(color: Color.fromARGB(177, 122, 122, 122)),
        ),
        const SizedBox(height: 40),
        TextField(
          obscureText: !isPasswordVisible1,
          decoration: InputDecoration(
            hintText: 'New Password',
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible1 ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible1 = !isPasswordVisible1;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          obscureText: !isPasswordVisible2,
          decoration: InputDecoration(
            hintText: 'Confirm Password',
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible2 ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible2 = !isPasswordVisible2;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: _onContinue,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Continue',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildUpdatedMessagePage() {
    return Center(
      child: Column(
        children: const [
          Text(
            'Your password has been updated!',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
