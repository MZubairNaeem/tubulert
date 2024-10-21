// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class AddEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        // backgroundColor: cuspink,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Medication Tracking',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.sp),
              bottomRight: Radius.circular(20.sp),
            ),
            color: cuspink,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3.h),
            Center(
              child: Text(
                'Add Event',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: cuspink),
              ),
            ),
            SizedBox(height: 3.h),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconButton('lib/assets/image 4.png', 'Pills'),
                  _buildIconButton('lib/assets/image 3.png', 'Syrup'),
                  _buildIconButton('lib/assets/Pills.png', 'Capsules'),
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            // Text fields with labels (Medicine Name, Dose, Set Time)
            _buildLabel('Medicine Name'),
            _buildTextField(),
            SizedBox(height: 2.h),
            _buildLabel('Dose'),
            _buildTextField(),
            SizedBox(height: 2.h),
            _buildLabel('Set Time'),
            _buildTextField(),
            SizedBox(height: 4.h),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add event action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: cuspink,
                  padding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 20.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Icon Buttons
  Widget _buildIconButton(String assetPath, String label) {
    return Column(
      children: [
        Container(
          height: 10.h,
          width: 10.h,
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Image.asset(assetPath, fit: BoxFit.contain),
        ),
        SizedBox(height: 1.h),
        Text(label, style: TextStyle(fontSize: 15.sp, color: cuspink)),
      ],
    );
  }

  // Helper widget for Label
  Widget _buildLabel(String labelText) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Text(
        labelText,
        style: TextStyle(
          fontSize: 17.sp,
          color: cuspink,
        ),
      ),
    );
  }

  // Helper widget for TextField (simple text input)
  Widget _buildTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: cuspink,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: cuspink,
            ),
          ),
        ),
      ),
    );
  }
}
