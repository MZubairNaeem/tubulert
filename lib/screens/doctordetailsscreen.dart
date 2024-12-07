// ignore_for_file: use_super_parameters, avoid_print, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final String did;
  Map<String, dynamic> data;
  final int appointmentCount;
  DoctorDetailsScreen(
      {Key? key,
      required this.data,
      required this.appointmentCount,
      required this.did})
      : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  // Function to pick date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Function to pick time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
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
              bottomLeft: Radius.circular(20.sp),
              bottomRight: Radius.circular(20.sp),
            ),
            color: cuspink,
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
                color: cuspink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 6.h,
                    backgroundImage: AssetImage(
                      'lib/assets/doc1.png',
                    ), // Use actual doctor profile image URL
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.data['fullName'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold)),
                        Text('Pulmonogist',
                            style: TextStyle(
                                color: Colors.white, fontSize: 15.sp)),
                        Row(
                          children: [
                            Icon(
                              Icons.people,
                              size: 16,
                              color: white,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              "${widget.appointmentCount}+ Patients",
                              style: TextStyle(
                                fontSize: 16,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Dr. ${widget.data['fullName']} is an exceptional pulmonogist whose dedication to his patients is unparalleled. With a blend of expertise and empathy, she listens intently to her patients' concerns, ensuring they feel heard and understood. Dr. James diagnostic acumen is remarkable, allowing her to accurately identify and treat a wide range of respiratory conditions. ",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Select Date',
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10.h),
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text(_selectedDate == null
                          ? 'Pick a Date'
                          : '${_selectedDate!.toLocal()}'.split(' ')[0]),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      'Select Time',
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10.h),
                    ElevatedButton(
                      onPressed: () => _selectTime(context),
                      child: Text(_selectedTime == null
                          ? 'Pick a Time'
                          : _selectedTime!.format(context)),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: cuspink,
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (_selectedDate != null && _selectedTime != null) {
                  // Combine the date and time
                  DateTime combinedDateTime = DateTime(
                    _selectedDate!.year,
                    _selectedDate!.month,
                    _selectedDate!.day,
                    _selectedTime!.hour,
                    _selectedTime!.minute,
                  );

                  // Convert to Firestore Timestamp
                  Timestamp timestamp = Timestamp.fromDate(combinedDateTime);

                  // Insert into Firestore
                  FirebaseFirestore.instance.collection('appoinments').add({
                    'time': timestamp,
                    'pid': FirebaseAuth.instance.currentUser!.uid,
                    'did': widget.did,
                    'status': 'Pending',
                  });

                  // Show confirmation
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Appointment scheduled successfully')),
                  );
                  Navigator.pop(context);
                } else {
                  // Handle missing date or time selection
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select both date and time')),
                  );
                }
              }, // Calls bookAppointment function
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
}
