// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';
import 'package:tubulert/screens/doctordetailsscreen.dart';
import 'package:tubulert/screens/doctordetailsscreen2.dart';
import 'package:tubulert/screens/doctordetailsscreen3.dart';
import 'package:tubulert/screens/doctordetailsscreen4.dart';
import 'package:tubulert/screens/doctordetailsscreen5.dart';

class DoctorsScreen extends StatelessWidget {
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
                  'Doctors',
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
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Doctor tiles with different images
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorDetailsScreen5()),
              );
            },
            child: DoctorTile(
              name: "Dr. Haris",
              hospital: "PIMS Hospital",
              rating: 2.5,
              patients: 100,
              imagePath: "lib/assets/doc1.png",
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorDetailsScreen4()),
              );
            },
            child: DoctorTile(
              name: "Dr. Arham",
              hospital: "Shafi Hospital",
              rating: 4.0,
              patients: 800,
              imagePath: "lib/assets/doc2.png", // Path to the image
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorDetailsScreen2()),
              );
            },
            child: DoctorTile(
              name: "Dr. Asad",
              hospital: "Al-Shifa Hospital",
              rating: 4.5,
              patients: 900,
              imagePath: "lib/assets/doc3.png", // Path to the image
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorDetailsScreen3()),
              );
            },
            child: DoctorTile(
              name: "Dr. Tabish",
              hospital: "Chinar Hospital",
              rating: 3.0,
              patients: 300,
              imagePath: "lib/assets/doc4.png", // Path to the image
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorDetailsScreen()),
              );
            },
            child: DoctorTile(
              name: "Dr. James",
              hospital: "Pulmonogist at Hospital",
              rating: 3.5,
              patients: 400,
              imagePath: "lib/assets/doc5.png", // Path to the image
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorTile extends StatelessWidget {
  final String name;
  final String hospital;
  final double rating;
  final int patients;
  final String imagePath; // Variable for image path

  DoctorTile({
    required this.name,
    required this.hospital,
    required this.rating,
    required this.patients,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Doctor details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: cuspink,
                    )),
                Text("Pulmonologist at $hospital",
                    style: TextStyle(
                      fontSize: 15,
                      color: cuspink,
                    )),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18),
                    SizedBox(width: 8.0),
                    Text("$rating", style: TextStyle(fontSize: 16)),
                    SizedBox(width: 20.0),
                    Icon(Icons.people, size: 16),
                    SizedBox(width: 4.0),
                    Text("$patients+ Patients", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            // Doctor image on the right
            CircleAvatar(
              radius: 30.0,
              backgroundImage:
                  AssetImage(imagePath), // Load different image for each tile
            ),
          ],
        ),
      ),
    );
  }
}
