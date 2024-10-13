import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/screens/auth/login_screen.dart'; // Import the package

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                  color: Colors.pink,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4.h), // Adjusted responsive spacing
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 24.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
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
                      style: TextStyle(color: Colors.pink, fontSize: 18.sp),
                    ),
                    SizedBox(
                        height: 1.h), // Spacing between label and TextField
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.5.h), // Field padding
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 2.h), // Spacing between input fields
                    Text(
                      'Last Name',
                      style: TextStyle(color: Colors.pink, fontSize: 18.sp),
                    ),
                    SizedBox(height: 1.h),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.5.h),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Your Email Address*',
                      style: TextStyle(color: Colors.pink, fontSize: 18.sp),
                    ),
                    SizedBox(height: 1.h),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.5.h),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Your Password*',
                      style: TextStyle(color: Colors.pink, fontSize: 18.sp),
                    ),
                    SizedBox(height: 1.h),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.5.h),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 4.h), // Increased spacing before button
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential =
                        await _auth.createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text);
                  } catch (e) {
                    //handle error.
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(
                    vertical: 2.5.h,
                  ), // Button padding
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                ),
              ),
              SizedBox(height: 4.h),
              TextButton(
                onPressed: () {
                  // Handle navigation to login screen
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Already have an Account',
                    style: TextStyle(color: Colors.pink, fontSize: 16.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
