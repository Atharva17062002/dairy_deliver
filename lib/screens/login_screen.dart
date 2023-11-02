import 'package:dairy_deliver/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserRole selectedValue = UserRole.customer; // Set the initial selected value

  List<DropdownMenuItem> dropdownItems = [
    DropdownMenuItem(
      child: Text('Customer'),
      value: UserRole.customer,
    ),
    DropdownMenuItem(
      child: Text('Vendor'),
      value: UserRole.seller,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3966A4),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Center(
              child: Lottie.asset(
                'assets/lottie/milk.json', // Replace with your animation file path
                width: 200, // Set the width and height as needed
                height: 200,
                repeat: true, // Set animation repeat behavior
                reverse: false, // Set animation reverse behavior
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              height: 450,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome back,',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextfield(
                      obscureText: false,
                      width: 340,
                      textController: emailController,
                      hintText: "Email"),
                  const SizedBox(height: 20),
                  CustomTextfield(
                      obscureText: true,
                      width: 340,
                      textController: passwordController,
                      hintText: "Password"),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: DropdownButtonFormField(
                      items: dropdownItems,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  FloatingActionButton(
                      backgroundColor: const Color(0xff3966A4),
                      onPressed: () {
                        // print()
                        loginWithEmailAndPassword(emailController.text,
                            passwordController.text, selectedValue, context);
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: const Text(
                          "Sign up",
                          style:
                              TextStyle(color: Color(0xff3966A4), fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
