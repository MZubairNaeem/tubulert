// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, duplicate_import

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

// import 'package:tubulert/screens/doctorsdetailsscreen.dart';

import '../colors/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        // backgroundColor: Colors.pink,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your personal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                'AI TB detector',
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
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            color: Colors.pink,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        child: SingleChildScrollView(
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // Define action on button press
                  },
                  child: Text(
                    'Diagnose through X-Ray',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.h),
              // Specialist Doctors Section
              buildCard(
                context,
                'Specialist\nDoctors',
                'lib/assets/Group 24 (1).png',
                () {},
              ),
              SizedBox(height: 4.h),
              // Medication Tracking Section
              buildCard(
                context,
                'Medication\nTracking',
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
                'Medical\nHistory',
                'lib/assets/Group 21.png',
                () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MedicalHistoryScreen()), // Navigate to medical history
                  // );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 2.h),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.pink),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.pink),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt, color: Colors.pink),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, color: Colors.pink),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu, color: Colors.pink),
              label: '',
            ),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          child: Row(
            children: [
              Image.asset(assetPath,
                  height: 10.h), // Adjust image height based on design
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
