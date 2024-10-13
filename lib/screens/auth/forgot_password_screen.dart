import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/screens/auth/login_screen.dart'; // Import the package

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                  color: Colors.pink,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6.h), // Responsive spacing
              Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 24.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 1.5.h),
              Text(
                'Enter your email address to receive code',
                style: TextStyle(
                  fontSize: 16.sp, // Responsive font size
                  fontWeight: FontWeight.normal,
                  color: Colors.pink,
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
                      style: TextStyle(color: Colors.pink, fontSize: 18.sp),
                    ),
                    SizedBox(height: 1.h),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.5.h), // Field padding
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h), // Spacing before button
              ElevatedButton(
                onPressed: () async {
                  try {
                    await _auth.sendPasswordResetEmail(
                        email: _emailController.text);
                  } catch (e) {
                    //handle error.
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding:
                      EdgeInsets.symmetric(vertical: 2.5.h), // Button padding
                ),
                child: Text(
                  'Send',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
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
                      style: TextStyle(color: Colors.pink, fontSize: 16.sp),
                    ),
                    SizedBox(width: 1.w),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.blue, fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
