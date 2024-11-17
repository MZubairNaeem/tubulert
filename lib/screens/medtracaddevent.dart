import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';
import 'package:tubulert/screens/addeventscreen.dart';

class MedicationTrackingScreen1 extends StatefulWidget {
  @override
  _MedicationTrackingScreen1State createState() =>
      _MedicationTrackingScreen1State();
}

class _MedicationTrackingScreen1State extends State<MedicationTrackingScreen1> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  List<String> _events = [];

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _loadEvents();
  }

  // Load events from Firestore
  void _loadEvents() async {
    if (_user != null) {
      final userEvents = await _firestore
          .collection('events')
          .where('userId', isEqualTo: _user!.uid)
          .get();

      setState(() {
        _events = userEvents.docs.map((doc) => doc['name'] as String).toList();
      });
    }
  }

  // Add event to Firestore
  void _addEvent(String eventName) async {
    if (_user != null) {
      await _firestore.collection('events').add({
        'name': eventName,
        'date': DateTime.now(),
        'userId': _user!.uid,
      });

      _loadEvents(); // Reload events after adding
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
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
              bottomLeft: Radius.circular(20.sp),
              bottomRight: Radius.circular(20.sp),
            ),
            color: cuspink,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/image 2.png',
                      height: 20.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 2.h),
                    _events.isEmpty
                        ? Text(
                            "You don't have\n any events",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          )
                        : Column(
                            children: _events
                                .map((event) => Text(
                                      event,
                                      style: TextStyle(
                                          fontSize: 16.sp, color: Colors.black),
                                    ))
                                .toList(),
                          ),
                    SizedBox(height: 3.h),
                    ElevatedButton(
                      onPressed: () {
                        _addEvent("New Medication Event");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cuspink,
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 10.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddEventScreen()),
                          );
                        },
                        child: Text(
                          'Add Event',
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
