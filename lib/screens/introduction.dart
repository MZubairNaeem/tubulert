// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
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
                  'Introduction',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Tuberculosis (TB) is an infectious disease caused by the bacterium Mycobacterium tuberculosis. It primarily affects the lungs, although it can spread to other organs and tissues. TB has been a major public health challenge for centuries, and despite advancements in medical science, it remains one of the top ten causes of death worldwide, particularly in low- and middle-income countries.bacterium Mycobacterium tuberculosis. It primarily affects the lungs, although it can spread to other organs and tissues. TB has been a major public health challenge for centuries, and despite advancements in medical science, it remains one of the top ten causes of death worldwide, particularly in low- and middle-income countries.'),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      'Historical Context',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                    'TB has a long history, with evidence of the disease found in ancient Egyptian mummies dating back to 3000-2400 BC. Known as "consumption" in the 19th century due to the severe weight loss and wasting it caused, TB was once thought to be hereditary before its infectious nature was understood. The discovery of Mycobacterium tuberculosis by Robert Koch in 1882 was a significant milestone, leading to better understanding and eventually, treatments for the disease.'),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      'Global Burden',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                    'TB remains a significant global health issue. According to the World Health Organization (WHO), TB is one of the top ten causes of death and the leading cause from a single infectious agent, ranking above HIV/AIDS. In 2019, an estimated 10 million people fell ill with TB, and 1.4 million died from the disease. The burden of TB is disproportionately high in developing countries, where overcrowding, poor nutrition, and limited access to healthcare exacerbate the spread and impact of the disease.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
