// ignore_for_file: library_private_types_in_public_api

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

  void _showResetPasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please choose how you want to reset your password',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 133, 133, 133),
                    ),
                  ),
                ],
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 20.0, right: 40.0, left: 40.0),
                    side: const BorderSide(color: Colors.blue),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Implement your reset via email logic here
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Via Email',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 20.0, right: 40.0, left: 40.0),
                    side: const BorderSide(color: Colors.blue),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Implement your reset via phone logic here
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Via Phone',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 104, 104, 104),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
            onPressed: _showResetPasswordDialog,
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
            minimumSize: const Size(double.infinity, 50),
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
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your password has been updated!',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
