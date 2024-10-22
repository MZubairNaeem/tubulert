// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReportScreen extends StatelessWidget {
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
                'Report',
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
        padding: EdgeInsets.all(5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 4.h),
              Image.asset(
                'lib/assets/xray.png', // Add image path
                width: 40.w,
                height: 20.h,
              ),
              SizedBox(height: 2.h),
              Text(
                'TB Result',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
              SizedBox(height: 1.h),
              Text(
                'Negative',
                style: TextStyle(fontSize: 18.sp, color: Colors.pink.shade700),
              ),
              SizedBox(height: 2.h),
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
        Text(label, style: TextStyle(fontSize: 16.sp, color: Colors.pink)),
        SizedBox(height: 0.5.h),
        TextFormField(
          initialValue: value,
          readOnly: true,
          style: TextStyle(fontSize: 17.sp, color: Colors.pink),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.sp),
              borderSide: BorderSide(color: Colors.pink.shade700),
            ),
          ),
        ),
      ],
    );
  }
}