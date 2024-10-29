// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class PreventionScreen extends StatelessWidget {
  const PreventionScreen({Key? key}) : super(key: key);

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
                  'Prevention',
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
                'Preventing tuberculosis (TB) involves a combination of strategies to reduce the risk of infection, protect vulnerable populations, and control the spread of the disease. Here are the key measures to prevent TB:',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('Vaccination'),
              _buildBodyText(
                'The Bacillus Calmette-Guérin (BCG) vaccine offers protection against severe forms of TB, particularly in children. It is often administered in countries with a high burden of TB.',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('Infection Control Measures'),
              _buildBodyText(
                'Cover your mouth and nose with a tissue or your elbow when coughing or sneezing to prevent the spread of TB bacteria through droplets\nEnsure good ventilation in indoor spaces to reduce the concentration of TB bacteria in the air.\nIsolate individuals with active TB disease until they are no longer infectious to prevent transmission to others.\nIsolate individuals with active TB disease until they are no longer infectious to prevent transmission to others.',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('Screening and Treatment'),
              _buildBodyText(
                'TB Screening: Screen high-risk populations, such as close contacts of TB patients, healthcare workers, and individuals with conditions that weaken the immune system, for latent TB infection (LTBI) and active TB disease.\nEarly Diagnosis: Diagnose and treat TB cases promptly to prevent the progression of latent infection to active disease and to reduce transmission in the community.\nTreatment Completion: Ensure that individuals diagnosed with TB complete the full course of treatment to prevent relapse, drug resistance, and further transmission.',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('Health Education and Promotion'),
              _buildBodyText(
                'Awareness Campaigns: Educate the public about TB transmission, symptoms, and prevention measures through community outreach, media campaigns, and educational materials.\nStigma Reduction: Address social stigma associated with TB to encourage early diagnosis, treatment adherence, and support for affected individuals.\nPromote Healthy Lifestyles: Encourage behaviors that support immune system health, such as regular exercise, nutritious diet, adequate sleep, and avoidance of smoking and excessive alcohol consumption.',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('TB Control Programs'),
              _buildBodyText(
                'National TB Programs: Support and strengthen national TB control programs to implement evidence-based strategies, monitor TB trends, and coordinate efforts across sectors to control the disease.\nInternational Collaboration: Foster collaboration between countries and international organizations to share best practices, resources, and technical expertise in TB prevention and control.',
              ),
              _buildBodyText(
                'Preventing TB requires a comprehensive and multifaceted approach that addresses individual and community-level factors. By implementing vaccination, infection control measures, screening, treatment, health education, and social support, it is possible to reduce the burden of TB and move closer to the goal of eliminating this infectious disease. Collaboration between governments, healthcare providers, communities, and international partners is essential to achieve effective TB prevention and control strategies.',
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
