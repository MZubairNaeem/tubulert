// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        // backgroundColor: Colors.pink,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Details',
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
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Container(
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 6.h,
                    backgroundImage: AssetImage(
                        'lib/assets/dr.png'), // Replace with actual image URL
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Dr. James', // Dynamic name
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold)),
                        Text('Pulmonologist',
                            style: TextStyle(
                                color: Colors.white, fontSize: 15.sp)),
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 3.h),
                            SizedBox(width: 1.w),
                            Text('4.5',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp)),
                            SizedBox(width: 1.w),
                            Text('500+ Patients',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp)),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          'Dr. James is an exceptional pulmonogist whose dedication to his patients is unparalleled. With a blend of expertise and empathy, she listens intently to her patients concerns, ensuring they feel heard and understood. Dr. James diagnostic acumen is remarkable, allowing her to accurately identify and treat a wide range of respiratory conditions. ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              'Availability',
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                availabilityButton('Tue 23', false),
                availabilityButton('Wed 24', true),
                availabilityButton('Thur 25', false),
                availabilityButton('Fri 26', false),
                availabilityButton('Sat 27', false),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              'Select Time',
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h),
            timeSelectionWidget(),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Center(
                child: Text(
                  'Make an Appointment',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  // Helper function to create availability buttons
  Widget availabilityButton(String day, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: selected ? Colors.pink : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        day,
        style: TextStyle(
            color: selected ? Colors.white : Colors.black, fontSize: 14.sp),
      ),
    );
  }

  // Widget for time selection
  Widget timeSelectionWidget() {
    return Wrap(
      spacing: 3.w,
      runSpacing: 1.5.h,
      children: [
        timeButton('06:00', false),
        timeButton('07:00', true),
        timeButton('08:00', false),
        timeButton('09:00', false),
        timeButton('10:00', false),
        timeButton('11:00', false),
        timeButton('12:00', false),
      ],
    );
  }

  // Helper function to create time buttons
  Widget timeButton(String time, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
      decoration: BoxDecoration(
        color: selected ? Colors.pink : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        time,
        style: TextStyle(
            color: selected ? Colors.white : Colors.black, fontSize: 14.sp),
      ),
    );
  }
}
