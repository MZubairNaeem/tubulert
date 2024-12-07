import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tubulert/colors/colors.dart';

class UploadXrayScreen extends StatefulWidget {
  const UploadXrayScreen({super.key});

  @override
  State<UploadXrayScreen> createState() => _UploadXrayScreenState();
}

class _UploadXrayScreenState extends State<UploadXrayScreen> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      // You can use the image here (e.g., upload or display)
      print('Picked image: ${image.path}');
    }
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera); // Open camera
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery); // Open gallery
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: const Icon(Icons.cancel),
                title: const Text('Cancel'),
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   toolbarHeight: 70,
      //   title: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Text(
      //       'X-Ray Diagnoses',
      //       style: TextStyle(
      //         color: white,
      //         fontSize: 20.sp,
      //         fontWeight: FontWeight.normal,
      //       ),
      //     ),
      //   ),
      //   centerTitle: false,
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(20.sp),
      //         bottomRight: Radius.circular(20.sp),
      //       ),
      //       color: cuspink,
      //     ),
      //   ),
      // ),
      body: Center(
          child: Container(
        width: 80.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(15.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // How much the shadow should spread
              blurRadius: 10, // How blurry the shadow should appear
              offset:
                  const Offset(0, 2), // Horizontal and vertical shadow offset
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
          vertical: 2.h,
        ),
        child: Column(
          children: [
            // Image at the start
            Image.asset(
              'lib/assets/upload_img.png', // Replace with your image path
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 2.h,
            ), // Spacing between image and text

            // Pink text
            Text(
              'Upload an image of your X-Ray',
              style: TextStyle(
                color: cuspink,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 2.h), // Spacing between text and button

            // Pink upload button
            ElevatedButton(
              onPressed: _showBottomSheet,
              style: ElevatedButton.styleFrom(
                backgroundColor: cuspink, // Background color
                padding: EdgeInsets.symmetric(
                  vertical: 1.h,
                  horizontal: 15.w,
                ),
              ),
              child: Text(
                'Upload',
                style: TextStyle(
                  color: white,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ), // Spacing between button and agreement text

            // Privacy policy text with blue "Privacy Policy" link
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'By uploading I agree to the ',
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Privacy Policy',
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Add your privacy policy link logic here
                      },
                  ),
                  const TextSpan(
                    text:
                        '\nYour personal data is protected and will never be shared with anyone.',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
