// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class MedicationTrackingScreen2 extends StatelessWidget {
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
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            color: Colors.pink,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCalendar(),
            SizedBox(height: 3.h),
            _buildEventCard(
                'Isoniazid', '1 pill', '4:30 am', 'lib/assets/image 4.png'),
            SizedBox(height: 2.h),
            _buildEventCard(
                'Rifampicin', '2 pills', '4:30 am', 'lib/assets/Pills.png'),
            SizedBox(height: 2.h),
            _buildEventCard('Pyrazinamide', '1 teaspoon', '4:30 am',
                'lib/assets/image 3.png'),
            SizedBox(height: 2.h),
            _buildEventCard(
                'Ethambutol', '2 pills', '4:30 am', 'lib/assets/Pills.png'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.pink,
        onPressed: () {
          // Add new event
        },
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.add,
          size: 28.sp,
          color: Colors.white,
        ),
      ),
    );
  }

  // Calendar row at the top
  Widget _buildCalendar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCalendarDay('Mon', '1'),
        _buildCalendarDay('Tue', '2'),
        _buildCalendarDay('Wed', '3'),
        _buildCalendarDay('Thu', '4'),
        _buildCalendarDay('Fri', '5', isSelected: true),
        _buildCalendarDay('Sat', '6'),
        _buildCalendarDay('Sun', '7'),
      ],
    );
  }

  // Helper widget for Calendar Day
  Widget _buildCalendarDay(String day, String date, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.pink : Colors.pink,
          ),
        ),
        SizedBox(height: 1.h),
        Container(
          padding: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            color: isSelected ? Colors.pink : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Text(
            date,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? white : Colors.pink,
            ),
          ),
        ),
      ],
    );
  }

  // Helper widget for Event Card
  Widget _buildEventCard(
      String medicine, String dose, String time, String assetPath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(assetPath, height: 8.h, fit: BoxFit.contain),
        title: Text(medicine,
            style: TextStyle(fontSize: 16.sp, color: Colors.pink)),
        subtitle: Text('$dose - $time',
            style: TextStyle(fontSize: 14.sp, color: Colors.pink)),
        trailing: Icon(
          Icons.more_vert,
          color: Colors.pink,
        ),
      ),
    );
  }
}
