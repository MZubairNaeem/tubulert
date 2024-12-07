// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class LivingWithTBScreen extends StatelessWidget {
  const LivingWithTBScreen({Key? key}) : super(key: key);

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
                  'Living with TB',
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
              Text(
                'Living with tuberculosis (TB) involves managing the disease through medical treatment, lifestyle adjustments, and preventive measures to avoid spreading the infection to others. Here are key aspects of living with TB:',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('1. Adhering to Treatment'),
              _buildBodyText(
                'Follow the prescribed medication regimen strictly. TB treatment usually lasts 6-9 months for drug-sensitive TB. Take all medications as directed, even if symptoms improve before completing the course.',
              ),
              _buildSectionTitle('Directly Observed Therapy (DOT):'),
              _buildBodyText(
                'Participate in DOT if recommended. A healthcare provider supervises medication intake to ensure adherence and monitor side effects.',
              ),
              _buildSectionTitle('Monitoring and Follow-Up:'),
              _buildBodyText(
                'Attend regular follow-up appointments for sputum tests, blood tests, and monitoring of side effects. Report any side effects or new symptoms to your healthcare provider promptly.',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('2. Preventing Transmission'),
              _buildBodyText(
                'In the initial phase of treatment, isolate yourself to prevent spreading TB bacteria to others. This is especially important until your healthcare provider confirms you are no longer infectious. Avoid close contact with others, especially in crowded or poorly ventilated spaces.',
              ),
              _buildSectionTitle('Respiratory Hygiene:'),
              _buildBodyText(
                'Cover your mouth and nose with a tissue or your elbow when coughing or sneezing. Dispose of used tissues in a sealed plastic bag.',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('Ventilation:'),
              _buildBodyText(
                'Ensure good ventilation in living spaces. Open windows and use fans to circulate air.',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('Personal Items:'),
              _buildBodyText(
                'Do not share personal items like utensils, towels, or bedding with others until you are no longer infectious.',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('3. Supporting Your Health'),
              _buildBodyText(
                'Maintain a balanced and nutritious diet to support your immune system and overall health Stay hydrated and avoid alcohol and tobacco, which can impair your immune response.',
              ),
              _buildSectionTitle('Rest and Exercise:'),
              _buildBodyText(
                'Get plenty of rest to help your body recover. Engage in light physical activity as tolerated, but avoid overexertion.',
              ),
              _buildSectionTitle('Mental Health:'),
              _buildBodyText(
                'Living with TB can be stressful. Seek support from friends, family, or support groups. Consider speaking with a mental health professional if you experience anxiety, depression, or other emotional challenges.',
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('4. Lifestyle Adjustments'),
              _buildBodyText(
                'Establish a daily routine that includes taking medications, eating well, resting, and engaging in enjoyable activities.Practice self-care activities such as meditation, reading, or hobbies to reduce stress.',
              ),
              _buildSectionTitle('Education and Awareness:'),
              _buildBodyText(
                  'Educate yourself about TB to better understand the disease and its management. Share accurate information with family and friends to reduce stigma and promote understanding.'),
              SizedBox(height: 2.h),
              _buildSectionTitle('5. Social and Work Life'),
              _buildBodyText(
                'Communicate with your employer about your diagnosis and treatment plan. Some accommodations may be necessary during the infectious phase and treatment period. Inform close contacts and encourage them to get tested for TB if they have been exposed.',
              ),
              _buildSectionTitle('Work and School:'),
              _buildBodyText(
                  'Depending on your condition and the advice of your healthcare provider, you may need to take a temporary leave from work or school. Once you are no longer infectious, you can resume normal activities, but continue to follow medical advice.'),
              SizedBox(height: 2.h),
              _buildSectionTitle('6. Preventive Measures Post-Treatment'),
              _buildBodyText(
                'Continue with regular medical check-ups even after completing TB treatment to ensure there is no recurrence. Follow any additional preventive treatment if you have latent TB infection (LTBI) to prevent future activation.',
              ),
              _buildSectionTitle('Vaccination:'),
              _buildBodyText(
                  'In countries where it is part of the TB control strategy, ensure children are vaccinated with the Bacillus Calmette-Guérin (BCG) vaccine.'),
              _buildBodyText(
                  'Living with TB requires careful adherence to treatment, preventive measures to avoid transmission, and lifestyle adjustments to support recovery and overall well-being. With proper medical care and self-management, individuals with TB can recover fully and lead healthy lives. It’s important to follow healthcare provider recommendations, stay informed, and seek support when needed.'),
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
