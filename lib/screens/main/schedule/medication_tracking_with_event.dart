import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class MedicationTrackingWithEvent extends StatefulWidget {
  @override
  _MedicationTrackingWithEventState createState() =>
      _MedicationTrackingWithEventState();
}

class _MedicationTrackingWithEventState
    extends State<MedicationTrackingWithEvent> {
  // Collection reference
  final CollectionReference _medicationCollection =
      FirebaseFirestore.instance.collection('medications');

  // Method to fetch medication events from Firebase
  Future<List<Map<String, dynamic>>> _fetchEvents() async {
    try {
      QuerySnapshot snapshot = await _medicationCollection.get();
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error fetching medication events: $e');
      return [];
    }
  }

  // Method to add a new medication event to Firebase
  Future<void> _addEvent(
      String medicine, String dose, String time, String imagePath) async {
    try {
      await _medicationCollection.add({
        'medicine': medicine,
        'dose': dose,
        'setTime': time,
        'imagePath': imagePath,
      });
    } catch (e) {
      print('Error adding medication event: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: white,
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Medication Tracking',
                style: TextStyle(
                  color: white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
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
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _fetchEvents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No Events Added Yet!'));
            }

            List<Map<String, dynamic>> events = snapshot.data!;

            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                var event = events[index];
                return _buildEventCard(
                  event['medicine'],
                  event['dose'],
                  event['setTime'],
                  event['imagePath'],
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: cuspink,
        onPressed: () {
          // Add new event on button press
          _showAddEventDialog();
        },
        backgroundColor: cuspink,
        child: Icon(
          Icons.add,
          size: 28.sp,
          color: white,
        ),
      ),
    );
  }

  // Method to show dialog for adding new event
  void _showAddEventDialog() {
    final TextEditingController medicineController = TextEditingController();
    final TextEditingController doseController = TextEditingController();
    final TextEditingController timeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Medication Event'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: medicineController,
                decoration: InputDecoration(labelText: 'Medicine Name'),
              ),
              TextField(
                controller: doseController,
                decoration: InputDecoration(labelText: 'Dose'),
              ),
              TextField(
                controller: timeController,
                decoration: InputDecoration(labelText: 'Time'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String medicine = medicineController.text.trim();
                String dose = doseController.text.trim();
                String time = timeController.text.trim();
                String imagePath = 'lib/assets/Pills.png'; // Default image path

                if (medicine.isNotEmpty && dose.isNotEmpty && time.isNotEmpty) {
                  _addEvent(medicine, dose, time, imagePath);
                  Navigator.pop(context);
                }
              },
              child: Text('Add Event'),
            ),
          ],
        );
      },
    );
  }

  // Helper widget for Event Card
  Widget _buildEventCard(
      String medicine, String dose, String time, String assetPath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(assetPath, height: 8.h, fit: BoxFit.contain),
        title:
            Text(medicine, style: TextStyle(fontSize: 16.sp, color: cuspink)),
        subtitle: Text('$dose - $time',
            style: TextStyle(fontSize: 14.sp, color: cuspink)),
        trailing: Icon(
          Icons.more_vert,
          color: cuspink,
        ),
      ),
    );
  }
}
