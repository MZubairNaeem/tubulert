// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/screens/addeventscreen.dart';
import 'package:tubulert/screens/doctordetailsscreen.dart';
import 'package:tubulert/screens/doctordetailsscreen2.dart';
import 'package:tubulert/screens/doctordetailsscreen3.dart';
import 'package:tubulert/screens/doctordetailsscreen4.dart';
import 'package:tubulert/screens/doctordetailsscreen5.dart';
import 'package:tubulert/screens/doctors_screen.dart';
import 'package:tubulert/screens/feedback_screen.dart';
import 'package:tubulert/screens/help.dart';
import 'package:tubulert/screens/homescreen.dart';
import 'package:tubulert/screens/diagnoses.dart';
import 'package:tubulert/screens/introduction.dart';
import 'package:tubulert/screens/medtracaddevent.dart';
import 'package:tubulert/screens/medtrawitevent.dart';
import 'package:tubulert/screens/onboarding/splashscreen.dart';
import 'package:tubulert/screens/patienthistory_screen.dart';
import 'package:tubulert/screens/profilescreen.dart';
import 'package:tubulert/screens/reportscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tubulert',
        theme: ThemeData(
          fontFamily: GoogleFonts.jost().fontFamily,
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        home: IntroductionScreen(),
      );
    });
  }
}
