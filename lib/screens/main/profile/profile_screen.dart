// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final gender = TextEditingController();
  final dob = TextEditingController();
  final age = TextEditingController();
  final weight = TextEditingController();
  final height = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initializing values once
    getData();
  }

  getData() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        final userData = snapshot.data() as Map<String, dynamic>;
        firstName.text = userData['first_name'] ?? '';
        lastName.text = userData['last_name'] ?? '';
        gender.text = userData['gender'] ?? '';
        dob.text = userData['dob'] ?? '';
        age.text = userData['age'] ?? '';
        weight.text = userData['weight'] ?? '';
        height.text = userData['height'] ?? '';
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    gender.dispose();
    dob.dispose();
    age.dispose();
    weight.dispose();
    height.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: cuspink,
                      borderRadius: BorderRadius.circular(15.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    margin: EdgeInsets.only(
                        left: 3.w, right: 3.w, top: 8.h, bottom: 3.h),
                    child: Column(
                      children: [
                        SizedBox(height: 6.h),
                        Text(
                          firstName.text,
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          FirebaseAuth.instance.currentUser!.email!,
                          style: TextStyle(fontSize: 17.sp, color: white),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    width: 90.w,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 27.w,
                        height: 27.w,
                        decoration: BoxDecoration(
                          color: cuspink,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 10.w,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, size: 20.w, color: cuspink),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 1.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'First Name',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    TextFormField(
                      controller: firstName,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 4.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 1.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last Name',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    TextFormField(
                      controller: lastName,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 4.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 1.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    TextFormField(
                      controller: gender,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 4.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 1.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Age',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    TextFormField(
                      controller: age,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 4.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 1.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Weight',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    TextFormField(
                      controller: weight,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 4.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 1.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    TextFormField(
                      controller: height,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 4.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Reference to Firestore
                  final firestore = FirebaseFirestore.instance;

                  // Assuming the user's document ID is known and stored in a variable
                  final userId = FirebaseAuth.instance.currentUser!.uid;

                  try {
                    FocusManager.instance.primaryFocus?.unfocus();
                    await firestore.collection('users').doc(userId).update({
                      'first_name': firstName.text.trim(),
                      'last_name': lastName.text.trim(),
                      'gender': gender.text.trim(),
                      'age': age.text.trim(),
                      'weight': weight.text.trim(),
                      'height': height.text.trim(),
                    });
                    // Show a success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('User information updated successfully!')),
                    );
                    getData();
                  } catch (e) {
                    // Handle errors, for example, by showing an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Failed to update user information: $e')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.sp)),
                  backgroundColor: cuspink,
                ),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        )
      ]),
    );
  }
}
