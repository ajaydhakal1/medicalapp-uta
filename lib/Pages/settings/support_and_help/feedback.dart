import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserFeedback extends StatelessWidget {
  const UserFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Give Feedback"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/support_and_help');
          },
        ),
      ),
      body: Column(
        children: [
          const Center(
              child: Text("Please share your experience about our app")),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text("Rating"),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: RatingBar.builder(
                      allowHalfRating: true,
                      itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                      onRatingUpdate: (rating) {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text("Comment (Optional)"),
                  ),
                ),
                TextField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 120.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(104, 216, 215, 215),
                    border: InputBorder.none,
                    hintText: "Enter your message...",
                    hintStyle: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
