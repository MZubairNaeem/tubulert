import 'package:flutter/material.dart';
import 'package:tubulert/screens/description_screens/causes_screen.dart';
import 'package:tubulert/screens/description_screens/diagnoses.dart';
import 'package:tubulert/screens/description_screens/introduction.dart';
import 'package:tubulert/screens/description_screens/living_with_tb_screen.dart';
import 'package:tubulert/screens/description_screens/prevention_screen.dart';
import 'package:tubulert/screens/description_screens/symptoms_screen.dart';
import 'package:tubulert/screens/description_screens/treatment_screen.dart';

class GuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink, // Match the pink color from the image
        title: Text(
          'Guide',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            buildGuideButton(
              context,
              'Introduction',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IntroductionScreen()),
                );
              },
            ),
            buildGuideButton(
              context,
              'Symptoms',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SymptomsScreen()),
                );
              },
            ),
            buildGuideButton(
              context,
              'Causes',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CausesScreen()),
                );
              },
            ),
            buildGuideButton(
              context,
              'Prevention',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PreventionScreen()),
                );
              },
            ),
            buildGuideButton(
              context,
              'Diagnosis',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiagnosesScreen()),
                );
              },
            ),
            buildGuideButton(
              context,
              'Treatment',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TreatmentScreen()),
                );
              },
            ),
            buildGuideButton(
              context,
              'Living with TB',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LivingWithTBScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGuideButton(
      BuildContext context, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 2,
        ),
        onPressed: onTap, // Use the onTap callback here
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.pink,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.pink, size: 16),
          ],
        ),
      ),
    );
  }
}
