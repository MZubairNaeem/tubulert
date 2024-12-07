// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  // Track the selected rating (0 to 5)
  int _rating = 0;

  // Function to handle star tap
  void _updateRating(int index) {
    setState(() {
      _rating = index + 1; // Update the rating based on the tapped star index
    });
  }

  final feedback = TextEditingController();

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
                  'Feedback',
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
        children: [
          Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    color: cuspink.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  child: Text(
                    'Send us your feedback and help us provide a better experience for you.',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: cuspink,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Text('* How would you rate your experience?',
                    style: TextStyle(fontSize: 17.sp)),
                SizedBox(height: 1.h),
                Row(
                  children: List.generate(
                    5,
                    (index) => IconButton(
                      icon: Icon(
                        index < _rating
                            ? Icons.star
                            : Icons
                                .star_border, // Filled star if rating is higher than index
                        size: 20.sp,
                        color: index < _rating
                            ? Colors.orange
                            : Colors.grey, // Change color based on rating
                      ),
                      onPressed: () => _updateRating(
                          index), // Update the rating when a star is tapped
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '* Detailed description',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    Text(
                      '0/300',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                TextField(
                  maxLines: 6,
                  controller: feedback,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      hintText:
                          'Please share your feedback and help us improve...',
                      hintStyle: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey,
                      )),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: SizedBox(
                    height: 7.h,
                    width: 40.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(2.h),
                        backgroundColor: cuspink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      onPressed: () {
                        if (feedback.text.isEmpty || _rating == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Give rating and write something')),
                          );
                        } else {
                          feedback.clear();
                          _rating = 0;
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Feedback submitted successfully')),
                          );
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
