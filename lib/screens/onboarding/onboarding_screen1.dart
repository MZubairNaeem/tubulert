import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';
import 'package:tubulert/screens/onboarding/onboarding_screen2.dart';

class Onboardingscreen1 extends StatelessWidget {
  const Onboardingscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cuspink,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Image.asset(
              'lib/assets/onboardingPic.png',
              height: 20.h,
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            'Catch it Early\nTreat it Swiftly',
            style: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 3.h,
                width: 3.w,
                decoration: const BoxDecoration(
                  color: white,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              Container(
                height: 3.h,
                width: 3.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(
                38.w,
                5.h,
              ),
              side: const BorderSide(
                color: white,
              ),
            ),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const Onboardingscreen2(),
              ),
            ),
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: white,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
