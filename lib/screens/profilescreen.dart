// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 4.h),
              CircleAvatar(
                radius: 10.w,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 20.w, color: Colors.pink),
              ),
              SizedBox(height: 2.h),
              Text(
                "Mohammad Asad",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade700),
              ),
              SizedBox(height: 0.5.h),
              Text(
                "masadejaz@gmail.com",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.pink,
                ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                "03316918811",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.pink,
                ),
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
              SizedBox(height: 5.h),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  backgroundColor: Colors.pink.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Handle navigation here if you want to navigate to other screens
        },
        selectedItemColor: Colors.pink.shade700,
        unselectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.home, size: 24.sp),
                if (_currentIndex == 0)
                  Container(
                    margin: EdgeInsets.only(top: 1.h),
                    height: 0.4.h,
                    width: 5.w,
                    color: Colors.pink.shade700,
                  )
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.person, size: 24.sp),
                if (_currentIndex == 1)
                  Container(
                    margin: EdgeInsets.only(top: 1.h),
                    height: 0.4.h,
                    width: 5.w,
                    color: Colors.pink.shade700,
                  )
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.camera_alt, size: 24.sp),
                if (_currentIndex == 2)
                  Container(
                    margin: EdgeInsets.only(top: 1.h),
                    height: 0.4.h,
                    width: 5.w,
                    color: Colors.pink.shade700,
                  )
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 24.sp,
                  color: Colors.pink,
                ),
                if (_currentIndex == 3)
                  Container(
                    margin: EdgeInsets.only(top: 1.h),
                    height: 0.4.h,
                    width: 5.w,
                    color: Colors.pink.shade700,
                  ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(
                  Icons.more_horiz_outlined,
                  size: 24.sp,
                  color: Colors.pink,
                ),
                if (_currentIndex == 3)
                  Container(
                    margin: EdgeInsets.only(top: 1.h),
                    height: 0.4.h,
                    width: 5.w,
                    color: Colors.pink.shade700,
                  ),
              ],
            ),
            label: '',
          ),
        ],
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
              color: Colors.pink,
            )),
        SizedBox(height: 0.5.h),
        TextFormField(
          initialValue: value,
          readOnly: true,
          style: TextStyle(
            fontSize: 17.sp,
            color: Colors.pink,
          ),
          decoration: InputDecoration(
            focusColor: Colors.pink,
            contentPadding:
                EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                12.sp,
              ),
              borderSide: BorderSide(color: Colors.pink.shade700),
            ),
          ),
        ),
      ],
    );
  }
}
