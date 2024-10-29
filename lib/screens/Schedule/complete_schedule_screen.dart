// ignore_for_file: prefer_const_constructors, use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int selectedTab = 0; // 0 for Upcoming, 1 for Completed, 2 for Cancelled

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
        // backgroundColor: cuspink,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                  vertical: 4.h,
                ),
                child: Text(
                  'Schedule',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
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
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabButton('Upcoming', 0),
                _buildTabButton('Completed', 1),
                _buildTabButton('Cancelled', 2),
              ],
            ),
            SizedBox(height: 2.h),

            // Tab content
            Expanded(
              child: selectedTab == 0
                  ? _buildUpcomingList()
                  : selectedTab == 1
                      ? _buildCompletedList()
                      : _buildCancelledList(),
            ),
          ],
        ),
      ),
    );
  }

  // Tab button widget
  Widget _buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        decoration: BoxDecoration(
          color: selectedTab == index ? cuspink : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selectedTab == index ? Colors.white : Colors.black,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  // Upcoming List
  Widget _buildUpcomingList() {
    return ListView(
      children: [
        _buildScheduleCard('Dr. James', 'Pulmonologist', '05/05/2024',
            '01:00 PM', 'Confirmed'),
        _buildScheduleCard('Dr. Arham', 'Pulmonologist', '15/07/2024',
            '05:00 PM', 'Confirmed'),
        _buildScheduleCard('Dr. Tabish', 'Pulmonologist', '25/08/2024',
            '02:30 PM', 'Confirmed'),
      ],
    );
  }

  // Completed List
  Widget _buildCompletedList() {
    return ListView(
      children: [
        _buildScheduleCard(
            'Dr. Asad', 'Pulmonologist', '05/05/2024', '01:30 PM', 'Completed'),
      ],
    );
  }

  // Cancelled List
  Widget _buildCancelledList() {
    return ListView(
      children: [
        _buildScheduleCard('Dr. Haris', 'Pulmonologist', '05/06/2024',
            '01:00 PM', 'Cancelled'),
      ],
    );
  }

  // Schedule card widget
  Widget _buildScheduleCard(String doctorName, String specialty, String date,
      String time, String status) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                    'lib/assets/doc5.png'), // Doctor's image placeholder
                radius: 20.sp,
              ),
              SizedBox(width: 4.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    specialty,
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined,
                      size: 16.sp, color: Colors.grey),
                  SizedBox(width: 2.w),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time_outlined,
                      size: 16.sp, color: Colors.grey),
                  SizedBox(width: 2.w),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    status == 'Confirmed'
                        ? Icons.check_circle
                        : status == 'Completed'
                            ? Icons.done
                            : Icons.cancel,
                    size: 16.sp,
                    color: status == 'Confirmed'
                        ? Colors.green
                        : status == 'Completed'
                            ? Colors.blue
                            : Colors.red,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: status == 'Confirmed'
                          ? Colors.green
                          : status == 'Completed'
                              ? Colors.blue
                              : Colors.red,
                    ),
                  ),
                ],
              ),
              if (status == 'Confirmed')
                ElevatedButton(
                  onPressed: () {
                    // Cancel functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cuspink,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
