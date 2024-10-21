// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, duplicate_import

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

// import 'package:tubulert/screens/doctorsdetailsscreen.dart';

import '../../../colors/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        // backgroundColor: cuspink,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your personal',
                style: TextStyle(
                  color: white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                'AI TB detector',
                style: TextStyle(
                  color: white,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 4.h),
            // Circular Image or Illustration
            Center(
              child: Image.asset(
                'lib/assets/Rectangle 7.png', // Replace with your asset path
                height: 20.h,
              ),
            ),
            SizedBox(height: 4.h),
            // Diagnose through X-ray Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: Size(90.h, 6.h),
                backgroundColor: cuspink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                ),
              ),
              onPressed: () {
                // Define action on button press
              },
              child: Text(
                'Diagnose through X-Ray',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            // Specialist Doctors Section
            buildCard(
              context,
              'Specialist Doctors',
              'lib/assets/Group 24 (1).png',
              () {},
            ),
            SizedBox(height: 4.h),
            // Medication Tracking Section
            buildCard(
              context,
              'Medication Tracking',
              'lib/assets/Group 23.png',
              () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => MedicationTrackingScreen()), // Navigate to medication tracking
                //   );
                //
              },
            ),
            SizedBox(height: 2.h),
            // Medical History Section
            buildCard(
              context,
              'Medical History',
              'lib/assets/Group 21.png',
              () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MedicalHistoryScreen()), // Navigate to medical history
                // );
              },
            ),

            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  // Card Builder for Specialist Doctors, Medication Tracking, Medical History
  Widget buildCard(
    BuildContext context,
    String title,
    String assetPath,
    VoidCallback onTap, // New parameter
  ) {
    return GestureDetector(
      onTap: () {}, // Call onTap when the card is tapped
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        decoration: BoxDecoration(
          color: Colors.white, // Ensure the background color is set here
          borderRadius: BorderRadius.circular(15.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // How much the shadow should spread
              blurRadius: 10, // How blurry the shadow should appear
              offset: Offset(0, 2), // Horizontal and vertical shadow offset
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              assetPath,
              height: 8.h,
            ),
            SizedBox(
              width: 35.w,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: cuspink,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
