import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController =
      TextEditingController(text: 'Tanaka Mitsuri');
  final TextEditingController ageController = TextEditingController(text: '30');
  final TextEditingController dobController =
      TextEditingController(text: '1992-02-22');
  final TextEditingController genderController =
      TextEditingController(text: 'Male');
  final TextEditingController emailController =
      TextEditingController(text: 'tanaka@gmail.com');
  final TextEditingController phoneController =
      TextEditingController(text: '9780808080');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                  'assets/images/avatar.png'), // Add your avatar image
            ),
            const SizedBox(height: 8),
            DottedBorder(
                  dashPattern: const [8,4],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8.0),
                  color: const Color.fromARGB(204, 169, 169, 169),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.transparent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        ),
                    ),
                    onPressed: () {
                      // Handle Edit Profile
                      
                    },
                    child: const Text('✏️_ Edit Profile', style: TextStyle(
                      color: Colors.blue,
                    ),),
                  ),
                ),
            const SizedBox(height: 16),
            buildProfileDetailRow('Name', nameController),
            buildProfileDetailRow('Age', ageController),
            buildProfileDetailRow('Date of birth', dobController),
            buildProfileDetailRow('Gender', genderController),
            buildProfileDetailRow('Email', emailController),
            buildProfileDetailRow('Phone no', phoneController),
          ],
        ),
      ),
    );
  }

  Widget buildProfileDetailRow(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                isDense: true, // Added to make the text field smaller
              ),
            ),
          ),
        ],
      ),
    );
  }
}
