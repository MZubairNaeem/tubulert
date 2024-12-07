// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';
import 'package:tubulert/screens/auth/forgot_password_screen.dart';
import 'package:tubulert/screens/auth/register_screen.dart';
import 'package:tubulert/screens/main/bottom_nav_bar.dart';
import 'package:tubulert/screens/main/home/home_screen.dart'; // Import responsive_sizer

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final FirebaseAuth _auth = FirebaseAuth.instance;

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
            padding:
                EdgeInsets.symmetric(horizontal: 5.w), // Responsive padding
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 8.h), // Responsive spacing at the top
                  Text(
                    'Tubulert',
                    style: TextStyle(
                      fontSize: 28.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: cuspink,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4.h), // Spacing before "Log In" text
                  Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 24.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: cuspink,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 3.h), // Adjusted spacing
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w), // Field padding
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
                                vertical: 1.5.h), // Input padding
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Password',
                          style: TextStyle(color: cuspink, fontSize: 18.sp),
                        ),
                        SizedBox(height: 1.h),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 1.5.h), // Input padding
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 2.h),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Navigate to forget password screen
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgetPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(color: cuspink, fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        setState(() {
                          isLoading = true;
                        });

                        await _auth.signInWithEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Login Successfully!',
                            ),
                          ),
                        );
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                          (route) => false,
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
                            'Login',
                            style: TextStyle(color: white, fontSize: 18.sp),
                          ),
                  ),
                  SizedBox(height: 10.h), // Spacing before bottom text
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Create an Account',
                      style: TextStyle(
                        color: cuspink,
                        fontSize: 16.sp,
                      ),
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
