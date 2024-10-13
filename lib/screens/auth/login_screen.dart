import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/screens/auth/forgot_password_screen.dart';
import 'package:tubulert/screens/auth/register_screen.dart';
import 'package:tubulert/screens/homeScreen.dart'; // Import responsive_sizer

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w), // Responsive padding
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
                  color: Colors.pink,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4.h), // Spacing before "Log In" text
              Text(
                'Log In',
                style: TextStyle(
                  fontSize: 24.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 3.h), // Adjusted spacing
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w), // Field padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username',
                      style: TextStyle(color: Colors.pink, fontSize: 18.sp),
                    ),
                    SizedBox(height: 1.h),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.5.h), // Input padding
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Password',
                      style: TextStyle(color: Colors.pink, fontSize: 18.sp),
                    ),
                    SizedBox(height: 1.h),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.5.h), // Input padding
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
                            builder: (context) => ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.pink, fontSize: 16.sp),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential =
                        await _auth.signInWithEmailAndPassword(
                            email: _usernameController.text,
                            password: _passwordController.text);
                  } catch (e) {
                    //handle error.
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding:
                      EdgeInsets.symmetric(vertical: 2.5.h), // Button padding
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Homescreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                ),
              ),
              SizedBox(height: 10.h), // Spacing before bottom text
              TextButton(
                onPressed: () {
                  // Navigate to sign-up screen
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Create an Account',
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
