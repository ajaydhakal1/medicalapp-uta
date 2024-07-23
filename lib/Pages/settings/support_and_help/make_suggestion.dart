import 'package:flutter/material.dart';

class MakeSuggestion extends StatelessWidget {
  const MakeSuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Make a suggestion"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/report_problem');
          },
        ),
      ),
    );
  }
}