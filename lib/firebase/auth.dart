import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_deliver/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/seller_dashboard.dart';
import '../screens/vendors_screen.dart';

enum UserRole { customer, seller }

Future<void> signUpWithEmailAndPassword(
  String firstName,
  String lastName,
  String email,
  String password,
  UserRole role, // Add a role parameter
  BuildContext context,
) async {
  try {
    final authResult = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    final user = authResult.user;

    // Store user data with their role in Firestore
    if (user != null) {
      String collectionPath =
          (role == UserRole.seller) ? 'sellers' : 'customers';
      await FirebaseFirestore.instance
          .collection(collectionPath)
          .doc(user.uid)
          .set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'role': role.toString(), // Store the role
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => VendorsScreen(),
        ),
      );
    }

    // Handle success and navigation to the next screen
    // ...
  } catch (e) {
    // Handle errors during signup
    print('Error signing up: $e');
    // Show an error message to the user
    // ...
  }
}

Future<void> loginWithEmailAndPassword(
  String email,
  String password,
  UserRole role, // Add a role parameter
  BuildContext context,
) async {
  try {
    final authResult = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    final user = authResult.user;

    if (user != null) {
      String collectionPath =
          (role == UserRole.seller) ? 'sellers' : 'customers';
      // Check the user's role in Firestore
      final userData = await FirebaseFirestore.instance
          .collection(collectionPath)
          .doc(user.uid)
          .get();

      if (userData.exists) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                (role == UserRole.seller) ? SellerDashboard() : VendorsScreen(),
          ),
        );
      } else {
        // Show an error message to the user
        // ...
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Cannot create seller and customer account using single email')));
      }
    }

    // Handle success and navigation to the appropriate screen
    // ...
  } catch (e) {
    // Handle errors during login
    print('Error logging in: $e');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Cannot create seller and customer account using single email')));
    // Show an error message to the user
    // ...
  }
}

Future<Map<String, dynamic>> getUserData(
    BuildContext context, String uid, UserRole role) async {
  String collectionPath = (role == UserRole.seller) ? 'sellers' : 'customers';
  final userData = await FirebaseFirestore.instance
      .collection(collectionPath)
      .doc(uid)
      .get();

  if (userData.exists) {
    return userData.data() as Map<String, dynamic>;
  } else {
    // Show an error message to the user
    // ...
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Cannot retrieve data')));
    return {};
  }
}

Future<void> logout(
  BuildContext context,
) async {
  try {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
  } catch (e) {
    // Handle errors during logout
    print('Error logging out: $e');
    // Show an error message to the user
    // ...
  }
}
