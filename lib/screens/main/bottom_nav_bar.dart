import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';
import 'package:tubulert/screens/main/diagnoses/upload_xray_screen.dart';
import 'package:tubulert/screens/main/home/home_screen.dart';
import 'package:tubulert/screens/main/profile/profile_screen.dart';
import 'package:tubulert/screens/main/schedule/medication_tracking_with_event.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(() {});
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      key: _scaffoldKey,
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeScreen(),
          ProfileScreen(),
          const UploadXrayScreen(),
          MedicationTrackingWithEvent(),
          HomeScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 8.h,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 10.w,
                  child: IconButton(
                    onPressed: () async {
                      _tabController.animateTo(0);
                    },
                    icon: const Icon(Icons.home, color: cuspink),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _tabController.index == 0 ? 5.w : 0.w,
                  child: Container(
                    width: 5.w,
                    height: 1.w,
                    decoration: BoxDecoration(
                      color: cuspink,
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 10.w,
                  child: IconButton(
                    onPressed: () async {
                      _tabController.animateTo(1);
                    },
                    icon: const Icon(Icons.person, color: cuspink),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _tabController.index == 1 ? 5.w : 0.w,
                  child: Container(
                    width: 5.w,
                    height: 1.w,
                    decoration: BoxDecoration(
                      color: cuspink,
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 10.w,
                  child: IconButton(
                    onPressed: () async {
                      _tabController.animateTo(2);
                    },
                    icon: const Icon(Icons.camera_alt, color: cuspink),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _tabController.index == 2 ? 5.w : 0.w,
                  child: Container(
                    width: 5.w,
                    height: 1.w,
                    decoration: BoxDecoration(
                      color: cuspink,
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 10.w,
                  child: IconButton(
                    onPressed: () async {
                      _tabController.animateTo(3);
                    },
                    icon: const Icon(Icons.calendar_today, color: cuspink),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _tabController.index == 3 ? 5.w : 0.w,
                  child: Container(
                    width: 5.w,
                    height: 1.w,
                    decoration: BoxDecoration(
                      color: cuspink,
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 10.w,
                  child: IconButton(
                    onPressed: () async {
                      _tabController.animateTo(4);
                    },
                    icon: const Icon(Icons.menu, color: cuspink),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _tabController.index == 4 ? 5.w : 0.w,
                  child: Container(
                    width: 5.w,
                    height: 1.w,
                    decoration: BoxDecoration(
                      color: cuspink,
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
