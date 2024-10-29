// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class SymptomsScreen extends StatelessWidget {
  const SymptomsScreen({Key? key}) : super(key: key);

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
                  'Symptoms',
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
              Text(
                'Tuberculosis (TB) is a serious illness caused by bacteria that mainly affects the lungs. Here are the common symptoms associated with TB:',
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 2.h),
              _buildSectionTitle('Primary TB Infection'),
              _buildBodyText(
                  'During the initial stage, most people don’t experience noticeable symptoms.\nSome may have flu-like symptoms, including:\nLow fever.\nTiredness.\nCough.'),
              SizedBox(height: 2.h),
              _buildSectionTitle('Latent TB Infection'),
              _buildBodyText(
                  'After the primary infection, the immune system walls off the TB germs in lung tissue.\nThere are no symptoms during this stage.'),
              SizedBox(height: 2.h),
              _buildSectionTitle('Active TB Disease'),
              _buildBodyText(
                  'Active TB occurs when the immune system can’t control the infection, leading to disease throughout the lungs or other parts of the body.\nSymptoms of active TB in the lungs include:\nPersistent cough.\nCoughing up blood or mucus.\nChest pain.\nPain with breathing or coughing.\nFever. \nChills.\nNight sweats.\nWeight loss.\nLoss of appetite. \nFatigue.'),
              SizedBox(height: 2.h),
              _buildSectionTitle('Extrapulmonary TB'),
              _buildBodyText(
                  'TB infection can spread beyond the lungs to other parts of the body.\nSymptoms vary depending on the affected area and may include:\nFever.\nChills.\nNight sweats.\nWeight loss. \nPain near the site of infection.'),
              SizedBox(height: 2.h),
              _buildBodyText(
                  'Early detection and treatment of TB are crucial to prevent serious health complications and to stop the spread of the infection to others. If TB is suspected, a healthcare provider will conduct tests, including chest X-rays, sputum tests, and possibly skin tests or blood tests, to confirm the diagnosis and determine the appropriate treatment.'),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _buildSectionTitleStyle() {
    return TextStyle(
        fontSize: 17.sp, fontWeight: FontWeight.bold, color: Colors.pink);
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: _buildSectionTitleStyle(),
    );
  }

  Widget _buildBodyText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 15.sp, height: 1.5),
    );
  }
}
