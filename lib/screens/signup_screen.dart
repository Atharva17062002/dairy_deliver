import 'package:dairy_deliver/firebase/auth.dart';
import 'package:dairy_deliver/widgets/custom_textfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
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
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
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
                height: 600,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Welcome,',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextfield(
                          obscureText: false,
                            width: 150,
                            textController: firstNameController,
                            hintText: "First Name"),
                        CustomTextfield(
                          obscureText: false,
                            width: 150,
                            textController: lastNameController,
                            hintText: "Last Name"),
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
                    SizedBox(
                      width: 340,
                      child: DropdownButtonFormField(
                        items: dropdownItems,
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextfield(
                      obscureText: true,
                        width: 340,
                        textController: confirmPasswordController,
                        hintText: "Confirm Password"),
                    const SizedBox(height: 20),
                    FloatingActionButton(
                        backgroundColor: const Color(0xff3966A4),
                        onPressed: () {
                          if (passwordController.text ==
                              confirmPasswordController.text) {
                            print(selectedValue);
                            signUpWithEmailAndPassword(
                                firstNameController.text,
                                lastNameController.text,
                                emailController.text,
                                passwordController.text,
                                selectedValue,
                                context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Passwords do not match',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const SizedBox(width: 20),
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Color(0xff3966A4), fontSize: 16),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
