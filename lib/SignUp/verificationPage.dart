import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For image picking
import 'dart:io';

import 'businessHours.dart';
import 'donePage.dart'; // For File

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final ImagePicker _picker = ImagePicker();
  List<File> _pickedImages = [];
  bool _isButtonVisible = true;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: deviceHeight * 0.14),
              const Text(
                "Signup 3 of 4",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: deviceHeight * 0.02),
              Text(
                "Verification",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: deviceHeight * 0.02),
              Text(
                "Attached proof of Department of Agriculture registration i.e. Florida Fresh, USDA Approved, USDA Organic",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: deviceHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Attached Proof of Registration",
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 8.0,
                      children: [
                        ..._pickedImages.map((image) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                image,
                                width: deviceWidth * 0.32,
                                height: deviceHeight * 0.1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
                        if (_isButtonVisible)
                          InkWell(
                            onTap: () async {
                              final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
                              if (pickedFile != null) {
                                setState(() {
                                  _pickedImages.add(File(pickedFile.path));
                                  _isButtonVisible = true;
                                });
                              }
                            },
                            child: Container(
                              width: deviceWidth * 0.13,
                              height: deviceWidth * 0.13, // Ensure the height matches the width for a circle
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.orange.shade900,
                                shape: BoxShape.circle, // Use BoxShape.circle for a circular container
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: deviceHeight * 0.4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessHours()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange.shade600,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
