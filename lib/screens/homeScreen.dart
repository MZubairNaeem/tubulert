import 'package:flutter/material.dart';
import 'package:tubulert/colors/colors.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: cuspink,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Hy Firebase is working Well :)',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: white),
            ),
          ),
        ],
      ),
    );
  }
}
