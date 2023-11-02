import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController addressController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              controller: contactNumberController,
              decoration: const InputDecoration(labelText: 'Contact Number'),
            ),
            ElevatedButton(
              onPressed: () {
                // Get the updated address and contact number from the controllers
                String updatedAddress = addressController.text;
                String updatedContactNumber = contactNumberController.text;

                // Perform the update in your data source (e.g., Firebase Firestore)
                // Update the user's address and contact number here
                Navigator.pop(context, {
                  'address': updatedAddress,
                  'contactNumber': updatedContactNumber,
                });

                // Navigate back to the user profile screen
                Navigator.pop(context);
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
