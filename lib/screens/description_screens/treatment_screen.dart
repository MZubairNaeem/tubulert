// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class TreatmentScreen extends StatelessWidget {
  const TreatmentScreen({Key? key}) : super(key: key);

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
                  'Treatement',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              _buildBodyText(
                'The standard treatment for drug-sensitive pulmonary TB involves a combination of antibiotics over a period of 6-9 months, divided into an intensive phase and a continuation phase.',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('Standard Treatment Regimen'),
              _buildSectionTitle('Intensive Phase'),
              _buildSectionTitle('Duration'),
              _buildBodyText(
                '2 months',
              ),
              _buildSectionTitle('Medications'),
              _buildBodyText(
                '   Isoniazid (INH)\n Rifampin (RIF)\n Pyrazinamide (PZA)\n Ethambutol (EMB)',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('Continuation Phase:'),
              _buildSectionTitle('Duration'),
              _buildBodyText(
                '4 months',
              ),
              _buildSectionTitle('Medications'),
              _buildBodyText(
                'Isoniazid (INH)\n Rifampin (RIF)',
              ),
              SizedBox(height: 2.h),
              _buildBodyText(
                'Intensive Phase (First 2 Months):',
              ),
              _buildSectionTitle('Daily'),
              _buildBodyText(
                '  Isoniazid (INH)\n Rifampin (RIF)\n Pyrazinamide (PZA)\n Ethambutol (EMB)',
              ),
              SizedBox(height: 2.h),
              _buildBodyText(
                'Continuation Phase (Next 4 Months):',
              ),
              _buildSectionTitle('Daily'),
              _buildBodyText(
                ' Isoniazid (INH)\n Rifampin (RIF)',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('Monitoring and Follow-up'),
              _buildBodyText(
                ' Ensures patients take medications as prescribed. Side Effects Monitoring: Regular check-ups and tests for liver function, renal function, and blood counts. Sputum Tests: At baseline, two months, and end of treatment to monitor response. Patient Education: Importance of adherence and reporting side effects. Nutritional Support: Adequate nutrition to support health during treatment....',
              ),
              SizedBox(height: 2.h),
              _buildBodyText(
                'The standard treatment for drug-sensitive pulmonary TB involves a 2-month intensive phase with four antibiotics, followed by a 4-month continuation phase with two antibiotics. Ensuring adherence, monitoring side effects, and conducting regular sputum tests are crucial for successful treatment.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 17.sp, fontWeight: FontWeight.bold, color: Colors.pink),
    );
  }

  Widget _buildBodyText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 15.sp, height: 1.5),
    );
  }
}
