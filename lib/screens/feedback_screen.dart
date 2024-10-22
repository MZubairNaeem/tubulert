import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FeedbackScreen extends StatelessWidget {
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
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            color: Colors.pink,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Text(
                'Send us your feedback and help us provide a better experience for you.',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.pink,
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
                (index) => Icon(Icons.star_border, size: 20.sp),
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
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  hintText: 'Please share your feedback and help us improve...',
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
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                  ),
                  onPressed: () {},
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
    );
  }
}
