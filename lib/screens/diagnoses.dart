// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DiagnosesScreen extends StatefulWidget {
  const DiagnosesScreen({super.key});

  @override
  State<DiagnosesScreen> createState() => _DiagnosesScreenState();
}

class _DiagnosesScreenState extends State<DiagnosesScreen> {
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
                  'Diagnoses',
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
                    'Diagnosing tuberculosis (TB) involves several steps and a combination of different tests. The process includes assessing the patient’s medical history, conducting physical examinations, and performing specific diagnostic tests to confirm the presence of Mycobacterium tuberculosis and determine the diseases extent and severity.'),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      'Medical History',
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
                    'The healthcare provider will ask about symptoms, duration of illness, exposure to TB, previous TB infections or treatments, travel history to areas with high TB prevalence, and any underlying health conditions that may affect the immune system.'),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      'Physical Examination',
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
                    'The doctor will check for signs of TB, such as swollen lymph nodes, abnormal breath sounds, and other physical indicators of illness.'),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      'Chest X-ray',
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
                    'Another way of diagnosing TB is by examining the patients X-Ray.'),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      'Procedure',
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
                    'A radiographic image of the chest is taken to look for abnormalities in the lungs.'),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      'Interpretation',
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
                    'Abnormalities such as infiltrates, cavities, or nodules may indicate TB. Useful for detecting pulmonary TB and assessing lung damage.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
