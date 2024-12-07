// ignore_for_file: use_super_parameters, library_private_types_in_public_api, prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int selectedTab = 0;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ? _buildAppointmentsList('Pending')
                  : selectedTab == 1
                      ? _buildAppointmentsList('Approved')
                      : _buildAppointmentsList('Rejected'),
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

  // Fetch appointments from Firestore
  Widget _buildAppointmentsList(String status) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('appoinments')
          .where('status', isEqualTo: status)
          .where('pid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No appointments available.'));
        }

        var appointments = snapshot.data!.docs;
        log(snapshot.data!.docs.length.toString());

        return ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            var appointment = appointments[index];
            return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(appointment['did'])
                    .snapshots(),
                builder: (context, snapshot) {
                  // Check if the snapshot is loading
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  // Check if there's an error
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  // If no data is found
                  if (!snapshot.hasData) {
                    return Center(child: Text('No data found.'));
                  }

                  final data = snapshot.data;

                  DateTime dateTime = appointments[index]['time'].toDate();
                  // Format Date and Time
                  String formattedDate =
                      "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
                  String formattedTime =
                      "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}";

                  return _buildScheduleCard(
                    data!['fullName'] ?? '',
                    data['designation'] ?? '',
                    formattedDate,
                    formattedTime,
                    appointment['status'],
                  );
                });
          },
        );
      },
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
                backgroundImage: AssetImage('lib/assets/doc5.png'),
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
                  Text(date, style: TextStyle(fontSize: 16.sp)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.access_time_outlined,
                      size: 16.sp, color: Colors.grey),
                  SizedBox(width: 2.w),
                  Text(time, style: TextStyle(fontSize: 16.sp)),
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
                  child: Text('Cancel',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
