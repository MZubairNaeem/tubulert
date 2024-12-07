// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';
import 'package:tubulert/screens/doctordetailsscreen.dart';

class DoctorsScreen extends StatefulWidget {
  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('users')
            .where('userType', isEqualTo: 'Doctor')
            .get(),
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
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No doctors found.'));
          }

          // If data is available, build the ListView
          final doctorList = snapshot.data!.docs;

          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: doctorList.length, // Number of doctors in the list
            itemBuilder: (context, index) {
              final doctorData = doctorList[index].data();

              // Use the data for each doctor to populate the tiles
              return FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('appoinments')
                      .where('did', isEqualTo: doctorList[index].id)
                      .get(),
                  builder: (context, snapshot) {
                    // Check if the snapshot is loading
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    // Check if there's an error
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (snapshot.hasData) {
                      final appointmentCount = snapshot.data!.docs.length;
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorDetailsScreen(
                                data: doctorData,
                                appointmentCount: appointmentCount,
                                did: doctorList[index].id,
                              ),
                            ),
                          );
                        },
                        child: DoctorTile(
                          patients: appointmentCount, // Example of data usage
                          name: doctorData['fullName'] ??
                              'Dr. Unknown', // Replace with actual data field
                          hospital: doctorData['hospital'] ??
                              'Unknown Hospital', // Replace with actual field
                          imagePath:
                              "lib/assets/doc1.png", // Default image if none
                        ),
                      );
                    } else {
                      return Container();
                    }
                  });
            },
          );
        },
      ),
    );
  }
}

class DoctorTile extends StatelessWidget {
  final String name;
  final String hospital;
  final int patients;
  final String imagePath; // Variable for image path

  DoctorTile({
    required this.name,
    required this.hospital,
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
                    SizedBox(width: 8.0),
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
