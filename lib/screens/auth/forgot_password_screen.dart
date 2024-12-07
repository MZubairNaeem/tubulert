// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';
import 'package:tubulert/screens/auth/login_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 5.w), // Responsive horizontal padding
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10.h, // Responsive top spacing
                  ),
                  Text(
                    'Tubulert',
                    style: TextStyle(
                      fontSize: 28.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: cuspink,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6.h), // Responsive spacing
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 24.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: cuspink,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 1.5.h),
                  Text(
                    'Enter your email address to receive code',
                    style: TextStyle(
                      fontSize: 16.sp, // Responsive font size
                      fontWeight: FontWeight.normal,
                      color: cuspink,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 7.h), // Adjusted spacing before email field
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 2.w), // Padding for text and field
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(color: cuspink, fontSize: 18.sp),
                        ),
                        SizedBox(height: 1.h),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 1.5.h), // Field padding
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h), // Spacing before button
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        setState(() {
                          isLoading = true;
                        });

                        await _auth.sendPasswordResetEmail(
                          email: _emailController.text.trim(),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Password reset email has been sent!',
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
                          vertical: 2.5.h), // Button padding
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
                            'Send',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                          ),
                  ),
                  SizedBox(height: 10.h), // Spacing after button
                  TextButton(
                    onPressed: () {
                      // Handle navigation to login screen
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Remember Password?',
                          style: TextStyle(color: cuspink, fontSize: 16.sp),
                        ),
                        SizedBox(width: 1.w),
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
                            'Login',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 16.sp),
                          ),
                        ),
                      ],
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
