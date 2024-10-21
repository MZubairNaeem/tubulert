// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';
import 'package:tubulert/screens/auth/login_screen.dart'; // Import the package

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Tubulert',
                    style: TextStyle(
                      fontSize: 28.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: cuspink,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4.h), // Adjusted responsive spacing
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 24.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: cuspink,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 3.h), // Adjusted responsive spacing
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 2.w), // Responsive padding for fields
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style: TextStyle(color: cuspink, fontSize: 18.sp),
                        ),
                        SizedBox(
                            height: 1.h), // Spacing between label and TextField
                        TextField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 1.5.h), // Field padding
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 2.h), // Spacing between input fields
                        Text(
                          'Last Name',
                          style: TextStyle(color: cuspink, fontSize: 18.sp),
                        ),
                        SizedBox(height: 1.h),
                        TextField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 1.5.h),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Your Email Address*',
                          style: TextStyle(color: cuspink, fontSize: 18.sp),
                        ),
                        SizedBox(height: 1.h),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 1.5.h),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Your Password*',
                          style: TextStyle(color: cuspink, fontSize: 18.sp),
                        ),
                        SizedBox(height: 1.h),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 1.5.h),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ), // Increased spacing before button
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        setState(() {
                          isLoading = true;
                        });
                        UserCredential userCredential =
                            await _auth.createUserWithEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );

                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(userCredential.user!.uid)
                            .set({
                          'uid': userCredential.user!.uid,
                          'first_name': _firstNameController.text.trim(),
                          'last_name': _lastNameController.text.trim(),
                          'email': _emailController.text.trim(),
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Register Successfully!',
                            ),
                          ),
                        );
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Error $e',
                            ),
                          ),
                        );
                      } finally {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cuspink,
                      padding: EdgeInsets.symmetric(
                        vertical: 2.5.h,
                      ), // Button padding
                    ),
                    child: isLoading
                        ? SizedBox(
                            width: 6.w,
                            height: 6.w,
                            child: const CircularProgressIndicator(
                              color: white,
                            ),
                          )
                        : Text(
                            'Sign Up',
                            style: TextStyle(color: white, fontSize: 18.sp),
                          ),
                  ),
                  SizedBox(height: 4.h),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Already have an Account',
                      style: TextStyle(color: cuspink, fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
