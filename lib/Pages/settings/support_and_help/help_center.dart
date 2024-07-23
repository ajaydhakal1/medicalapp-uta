import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/support_and_help');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
                "Use the search bar below to find answers to your questions and get help with our app."),
            Padding(
              padding: const EdgeInsets.only(top: 36.0),
              child: TextField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(104, 196, 196, 196),
                  border: InputBorder.none,
                  hintText: "Search for help articles", hintStyle: const TextStyle(
                    fontSize: 19.0,
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search, size: 32,),
                    onPressed: () {},
                    
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
