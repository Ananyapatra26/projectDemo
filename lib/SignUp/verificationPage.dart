import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

import 'businessHours.dart';

class VerificationPage extends StatefulWidget {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String reEnterPassword;
  final String businessName;
  final String informalName;
  final String streetAddress;
  final String city;
  final String state;
  final String zipcode;

  const VerificationPage({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.reEnterPassword,
    required this.businessName,
    required this.informalName,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipcode,
  });

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final ImagePicker _picker = ImagePicker();
  List<File> _pickedImages = [];
  bool _isImageCaptured = false;
  String _pdfFilePath = '';

  Future<void> _convertImagesToPdf() async {
    final pdf = pw.Document();

    for (var image in _pickedImages) {
      final imageFile = pw.MemoryImage(
        File(image.path).readAsBytesSync(),
      );

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Image(imageFile),
        ),
      );
    }

    final outputFile = await _getOutputFile();
    await outputFile.writeAsBytes(await pdf.save());
    _pdfFilePath = outputFile.path; // Save the PDF file path
  }

  Future<File> _getOutputFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/output.pdf';
    return File(filePath);
  }

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
                  Expanded(
                    child: Text(
                      "Attached Proof of Registration",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: SizedBox(
                      height: deviceHeight * 0.2,
                      child: Wrap(
                        spacing: 20.0,
                        runSpacing: 8.0,
                        children: [
                          ..._pickedImages.map((image) {
                            return Container(
                              width: deviceWidth * 0.32,
                              height: deviceHeight * 0.1,
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
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                          if (_isImageCaptured)
                            Container(
                              width: deviceWidth * 0.13,
                              height: deviceWidth * 0.13,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.green.shade600,
                                shape: BoxShape.circle,
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
                                Icons.check,
                                color: Colors.white,
                                size: 25,
                              ),
                            )
                          else
                            InkWell(
                              onTap: () async {
                                final XFile? pickedFile = await _picker.pickImage(
                                    source: ImageSource.camera);
                                if (pickedFile != null) {
                                  setState(() {
                                    _pickedImages.add(File(pickedFile.path));
                                    _isImageCaptured = true;
                                  });
                                  await _convertImagesToPdf();
                                }
                              },
                              child: Container(
                                width: deviceWidth * 0.13,
                                height: deviceWidth * 0.13,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade900,
                                  shape: BoxShape.circle,
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
                  ),
                ],
              ),
              SizedBox(height: deviceHeight * 0.2),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BusinessHours(
                                fullName: widget.fullName,
                                email: widget.email,
                                phone: widget.phone,
                                password: widget.password,
                                reEnterPassword: widget.reEnterPassword,
                                businessName: widget.businessName,
                                informalName: widget.informalName,
                                streetAddress: widget.streetAddress,
                                city: widget.city,
                                state: widget.state,
                                zipcode: widget.zipcode,
                                pdfFilePath: _pdfFilePath, // Passing PDF file path
                              )));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange.shade600,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
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
