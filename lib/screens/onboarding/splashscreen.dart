// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';
import 'package:tubulert/screens/main/bottom_nav_bar.dart';
import 'package:tubulert/screens/onboarding/onboarding_screen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showWelcomeScreen = true;

  @override
  void initState() {
    super.initState();
    // Show the welcome screen for 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showWelcomeScreen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cuspink,
      body: Center(
        child: _showWelcomeScreen
            ? Text(
                'Tubulert',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            : StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show a loading spinner while waiting for the auth state
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    // If the user is logged in, navigate to the home screen
                    Future.delayed(Duration.zero, () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const BottomNavBar(), // Replace with your home screen
                        ),
                      );
                    });
                  } else {
                    // If the user is not logged in, navigate to the onboarding screen
                    Future.delayed(Duration.zero, () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Onboardingscreen1(),
                        ),
                      );
                    });
                  }

                  // Default return (while determining navigation)
                  return Text(
                    'Tubulert',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
