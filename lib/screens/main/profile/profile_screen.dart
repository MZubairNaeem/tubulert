// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: cuspink,
                      borderRadius: BorderRadius.circular(15.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color
                          spreadRadius: 1, // How much the shadow should spread
                          blurRadius: 10, // How blurry the shadow should appear
                          offset: const Offset(
                              0, 2), // Horizontal and vertical shadow offset
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 2.h,
                    ),
                    margin: EdgeInsets.only(
                      left: 3.w,
                      right: 3.w,
                      top: 8.h,
                      bottom: 3.h,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 6.h),
                        Text(
                          "Mohammad Asad",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          "masadejaz@gmail.com",
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: white,
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          "03316918811",
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Positioned(
                      top: 0,
                      child: Container(
                        width: 27.w, // Adjust size as needed
                        height: 27.w,
                        decoration: BoxDecoration(
                          color: cuspink, // Pink border color
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              spreadRadius:
                                  1, // How much the shadow should spread
                              blurRadius:
                                  10, // How blurry the shadow should appear
                              offset: const Offset(0,
                                  2), // Horizontal and vertical shadow offset
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 10.w,
                          backgroundColor: Colors.white, // White circle inside
                          child: Icon(Icons.person, size: 20.w, color: cuspink),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              buildInfoField("Username", "mohammadasad"),
              SizedBox(height: 1.5.h),
              buildInfoField("Gender", "Male"),
              SizedBox(height: 1.5.h),
              buildInfoField("Date of Birth", "24/08/2001"),
              SizedBox(height: 1.5.h),
              buildInfoField("Age", "22"),
              SizedBox(height: 1.5.h),
              buildInfoField("Weight", "52 Kg"),
              SizedBox(height: 1.5.h),
              buildInfoField("Height", "5.9''"),
              SizedBox(height: 5.h),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  backgroundColor: cuspink,
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
              fontSize: 16.sp,
              color: cuspink,
            )),
        SizedBox(height: 0.5.h),
        TextFormField(
          initialValue: value,
          readOnly: true,
          style: TextStyle(
            fontSize: 17.sp,
            color: cuspink,
          ),
          decoration: InputDecoration(
            focusColor: cuspink,
            contentPadding:
                EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                12.sp,
              ),
              borderSide: BorderSide(color: cuspink.withOpacity(0.7)),
            ),
          ),
        ),
      ],
    );
  }
}
