import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';
import 'package:tubulert/screens/Schedule/complete_schedule_screen.dart';
import 'package:tubulert/screens/auth/login_screen.dart';
import 'package:tubulert/screens/doctors_screen.dart';
import 'package:tubulert/screens/feedback_screen.dart';
import 'package:tubulert/screens/help.dart';
import 'package:tubulert/screens/main/diagnoses/upload_xray_screen.dart';
import 'package:tubulert/screens/main/guide/guide_screen.dart';
import 'package:tubulert/screens/medtracaddevent.dart';
import 'package:tubulert/screens/patienthistory_screen.dart';
import 'package:tubulert/screens/main/profile/profile_screen.dart';
import 'package:tubulert/screens/main/schedule/medication_tracking_with_event.dart';
//import 'package:tubulert/screens/schedule_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, vsync: this); // Updated length to 5
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProfileScreen(),
                    ));
              },
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius:
                      BorderRadius.circular(12), // Adjust the radius as needed
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(
                  Icons.person,
                ),
              ))
        ],
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your personal',
                style: TextStyle(
                  color: white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                'AI TB detector',
                style: TextStyle(
                  color: white,
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
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: cuspink,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.sp),
                  bottomRight: Radius.circular(20.sp),
                ),
              ),
              accountName:
                  Text('Mohammad Asad', style: TextStyle(color: Colors.white)),
              accountEmail: Text('masadejaz@gmail.com',
                  style: TextStyle(color: Colors.white)),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: cuspink),
              ),
            ),
            ListTile(
              leading: Icon(Icons.history, color: cuspink),
              title: Text('Patient History'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientHistoryScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books, color: cuspink),
              title: Text('Guide & Tips'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GuideScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.star, color: cuspink),
              title: Text('Feedback'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.help, color: cuspink),
              title: Text('Help'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpScreen()),
                );
              },
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.settings, color: cuspink),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: cuspink),
              title: Text('Log Out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildMainContent(context),
          const UploadXrayScreen(),
          const ScheduleScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabController.index,
        onTap: (index) {
          setState(() {
            _tabController.index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: cuspink),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt, color: cuspink),
            label: 'Diagnose',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: cuspink),
            label: 'Schedule',
          ),
        ],
      ),
    );
  }

  Widget buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 4.h),
          Center(
            child: Image.asset(
              'lib/assets/Rectangle 7.png',
              height: 20.h,
            ),
          ),
          SizedBox(height: 4.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              maximumSize: Size(90.h, 6.h),
              backgroundColor: cuspink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.sp),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UploadXrayScreen()),
              );
            },
            child: Text(
              'Diagnose through X-Ray',
              style: TextStyle(
                fontSize: 18.sp,
                color: white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          buildCard(
            context,
            'Specialist Doctors',
            'lib/assets/Group 24 (1).png',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorsScreen()),
              );
            },
          ),
          SizedBox(height: 4.h),
          buildCard(
            context,
            'Medication Tracking',
            'lib/assets/Group 23.png',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MedicationTrackingWithEvent()),
              );
            },
          ),
          SizedBox(height: 4.h),
          buildCard(
            context,
            'Medical History',
            'lib/assets/Group 21.png',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PatientHistoryScreen()),
              );
            },
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, String assetPath,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              assetPath,
              height: 8.h,
            ),
            SizedBox(
              width: 35.w,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: cuspink,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
